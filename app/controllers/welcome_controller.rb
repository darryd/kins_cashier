class WelcomeController < ApplicationController
  def index

    if flash[:id] != nil

      item_id = flash[:id]
      
      begin
	@item = Item.find(item_id)
      rescue
	flash[:id] = nil
      end
    end

    if flash[:id] == nil
      @item = Item.all.sample(1).first
    end

  end

  def test

    question = params[:question]
    answer = params[:answer]

    item = Item.find_by(question: question)
    actual_answer = item.answer

    if actual_answer.to_i == answer.to_i
      flash['message'] = "Correct! Try the next one shown."
      flash['correct'] = true
    else
      flash['message'] = "Try again! The correct code for " + question + " is " + actual_answer + "." + "You entered: " + answer.to_s
      flash[:id] = item.id
      flash['correct'] = false
    end

    redirect_to '/'

  end

  def view
    
   @items = Item.all

  end

end
