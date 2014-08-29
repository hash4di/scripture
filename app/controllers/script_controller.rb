class ScriptController < ApplicationController

  def index
    @script = Script.select('DISTINCT book')
  end

  def search
    @scripts = Script.search(params[:search])
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    attr_accessor :script
    attr_accessor :scripts_attributes
    attr_accessor :verses

    def book_number
      params[:script][:book]
    end

end
