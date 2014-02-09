class WelcomeController < ApplicationController
  def index
    @item = Item.all.sample(1).first
  end

  def test

    
    question = params[:question]
    answer = params[:answer]

    actual_answer = Item.find_by(question: question).answer

    result = :success

    begin
      answer = answer.to_i
      actual_answer.to_i
    rescue
      result = :failure
    end

    if actual_answer == answer and result == :success
      flash['message'] = "Correct"
    else
      flash['message'] = "Incorrect. The correct code for " + question + " is " + actual_answer + "." + "You entered: " + answer.to_s
    end

    redirect_to '/'
  end
end
