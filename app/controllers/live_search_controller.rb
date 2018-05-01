class LiveSearchController < ApplicationController
  def search
    keyword = params[:keyword]
    classname = params[:classname]

    obj = Object.const_get(classname)
    self.instance_variable_set("@" + obj.name.tableize.tr('/', '_'), obj.send("search", keyword))
    @controller_path = obj.name.tableize
    respond_to do |format|
      format.js
    end

  end

end
