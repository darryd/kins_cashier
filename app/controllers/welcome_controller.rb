class WelcomeController < ApplicationController
  def index

    if session[:id] != nil

      item_id = params[session[:id]]
      
      begin
	@item = Item.find(item_id)
      rescue
	session[:id] = nil
      end
    end

    if session[:id] == nil
      @item = Item.all.sample(1).first
    end

  end

  def test

    question = params[:question]
    answer = params[:answer]

    item = Item.find_by(question: question)
    actual_answer = item.answer

    if actual_answer.to_i == answer.to_i
      flash['message'] = "Correct"
      session[:id] = nil
    else
      flash['message'] = "Try again. The correct code for " + question + " is " + actual_answer + "." + "You entered: " + answer.to_s
      session[:id] = item.id
    end

    redirect_to '/'

  end
end
