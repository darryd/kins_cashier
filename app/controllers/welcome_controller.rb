class WelcomeController < ApplicationController
  def index


    if session[:question] != nil

      item_id = parmas[:id]
      
      begin
	@item = Item.find(item_id.to_i)
      rescue
	session[:question] = nil
      end
    end

    if session[:question] == nil
      @item = Item.all.sample(1).first
    end

  end

  def test

    question = params[:question]
    answer = params[:answer]

    actual_answer = Item.find_by(question: question).answer

    if actual_answer.to_i == answer.to_i
      flash['message'] = "Correct"
      redirect_to '/'
    else
      flash['message'] = "Incorrect. The correct code for " + question + " is " + actual_answer + "." + "You entered: " + answer.to_s
      redirect_to '/&id=' + Item.id
    end

  end
end
