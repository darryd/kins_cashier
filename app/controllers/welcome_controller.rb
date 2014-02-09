class WelcomeController < ApplicationController
  def index
    @item = Item.all.sample(1).first
  end

  def test

    
    question = params[:question]
    answer = params[:answer]
    answer = answer.to_i

    actual_answer = Item.find_by(question: question).answer
    actual_answer = actual_answer.to_i

    if actual_answer == answer
      flash['message'] = "Correct"
    else
      flash['message'] = "Incorrect. The correct code for " + question + " is " + actual_answer + "."
    end

    redirect_to '/'
  end
end
