class ScriptController < ApplicationController

  def index
  end

  def search
    @scripts = Script.search(params[:search])
  end

  private

    attr_accessor :script
    attr_accessor :scripts_attributes
    attr_accessor :verses

    def book_number
      params[:script][:book]
    end

end
