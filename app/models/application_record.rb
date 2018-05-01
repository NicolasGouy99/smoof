class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(keyword)
    if keyword
      query = ""
      column_names.each_with_index do |col, idx|
        query += "#{col} LIKE '%#{keyword}%'"
        query += " OR " if idx < (column_names.length - 1)
      end
      where(query)
    else
      find(:all)
    end
  end

end
