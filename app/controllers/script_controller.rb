class ScriptController < ApplicationController

  def index
  end

  def search
    @scripts = Script.search(params[:search])
    @verses = current_user.verses.search(params[:search])
  end

end
