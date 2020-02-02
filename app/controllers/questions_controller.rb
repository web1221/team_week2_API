class QuestionsController < ApplicationController
    def index
        @quesitons = Question.all
        json_response(@quesitons)
    end

    def show
        @quesiton = Question.find(params[:id])
        json_response(@quesiton)
    end

    def create
        @quesiton = Question.create!(quesiton_params)
        json_response(@quesiton, 201)
    end

    def update
        @quesiton = Question.find(params[:id])
        if @quesiton.update!(quesiton_params)
            render status: 200, json: {
                message: "This quesiton (#{@quesiton.question}) has been updated successfully."
            }
        end
    end

    def destroy
        @quesiton = Question.find(params[:id])
        if @quesiton.destroy!
            render status: 200, json: {
                message: "Destroyed quesiton: #{@quesiton.question}"
            }
        end
    end

    private
    def quesiton_params
        params.permit(:question, :correct_answer, :answer_1, :answer_2, :answer_3, :answer_4)
    end
end
