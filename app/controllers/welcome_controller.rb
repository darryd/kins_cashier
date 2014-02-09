class WelcomeController < ApplicationController
  def index
    @item = Item.all.sample(1).first
  end

  def test

    
    question = params[:question]
    answer = params[:answer] #.gsub(/\s+/, "")

    actual_answer = Item.find_by(question: question).answer

    if actual_answer == answer
      flash['message'] = "Correct"
    else
      flash['message'] = "Incorrect. The correct code is " + actual_answer + "."
    end

    redirect_to '/'
  end
end
