require 'rubyXL'

class ImportDataController < ApplicationController
  def index
  end

  def upload
    puts "upload"
    puts params[:importedFile]

    uploaded_io = params[:importedFile]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    workbook = RubyXL::Parser.parse(Rails.root.join('public', 'uploads', uploaded_io.original_filename))
    workbook.each do |worksheet|
      name = worksheet.sheet_name.capitalize
      name = name.gsub(/\s+/, ' ').strip
      name.gsub!(" ", "_")
      name.gsub!("é","e")

      name = "Generated::" + ActiveSupport::Inflector.classify(name)
      table_name = name.gsub("::", "_")
      table_name = ActiveSupport::Inflector.tableize(table_name)
      # get the first row and iterate over the columns
      col = 0
      begin
        ActiveRecord::Base.connection.execute("drop table " + table_name)
      rescue
      end
      command_destroy = "rails destroy scaffold " + name
      command_scaffold = "rails generate scaffold " + name


      columns = []
      cell = worksheet[0].cells[col]
      until cell.nil? || cell.value.nil? do
      #  cell = worksheet[0].cells[i]
        puts cell.value
        val = cell.value.downcase
        val = val.gsub(/\s+/, ' ').strip

        val.gsub!(" ", "_")
        val.gsub!("é","e")

        # identify type of data
        type = "string"
        firstcell = worksheet[1].cells[col]
        type = "date" if firstcell.value.is_a?(DateTime)
        type = "float" if firstcell.value.is_a?(Float)
        type = "integer" if firstcell.value.is_a?(Integer)

        command_scaffold += " #{val}:#{type}"
        columns << val
        col = col+1
        cell = worksheet[0].cells[col]
      end
      puts command_scaffold
      system command_destroy
      system command_scaffold
      system "rails db:migrate"
#      ActiveRecord::Base.connection.clear_cache!()

#      ActiveRecord::Base.connection_pool.release_connection
#      Rails.cache.clear()
      # let's insert some data
      row = 1
      cell = worksheet[row].cells[0]
      until cell.nil? || cell.value.nil? do
        puts cell.value

#        Object.const_get(name).remove_connection()
        Object.const_get(name).reset_column_information()
        Object.const_get(name).establish_connection()

        obj = Object.const_get(name).new()
        columns.each_with_index do |c, index|
          val = worksheet[row].cells[index].value
          obj.send("#{c}=", val)
        end
        obj.save()
        row = row + 1
        cell = worksheet[row].cells[0]
      end

      # check if we need to add filters or not
      # we add filters when number of occurences < 20 or when the column is a number
      model = Object.const_get(name)
      filters = ""
      model.columns.each do |c|

        if c.type == :integer
          filters += c.name + ','
        end

        if c.type == :string
          values = model.distinct.pluck(c.name.to_sym)
          if (values.count < 20)
            filters += c.name + ','
          end
        end
      end
      Thing.find_or_create_by(name: name) do |thing|
        thing.filters = filters
      end

    end

  end

end
