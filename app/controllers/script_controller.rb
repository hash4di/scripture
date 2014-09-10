class ScriptController < ApplicationController

  def index
    @script = Script.select('DISTINCT book')
  end

  def search
    @scripts = Script.search(params[:search])
  end

  private

    def book_number
      params[:script][:book]
    end

end
