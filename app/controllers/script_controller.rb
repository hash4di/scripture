class ScriptController < ApplicationController

  def index
    @scripts = Script.all.search(params[:search])
  end

  private

    attr_accessor :script
    attr_accessor :scripts_attributes
    attr_accessor :verses

    def book_number
      params[:script][:book]
    end

end
