module Rizzler
  module Chat
    class AnswersController < ApplicationController
      def create
        # // GIVE W RIZZ ADVICE
        question = "Give me dating advice to make a girl attracted to me "
        question += params[:text]
        @answer = Answer.create(question: question)
        @answer.broadcast_replace_to(current_user, target: "logo", partial: "rizzler/chat/loading")
        @answer.broadcast_update_to(current_user, target: "form", partial: "rizzler/chat/form")
        client = OpenAI::Client.new
        response = client.chat(
          parameters: { 
              model: "gpt-3.5-turbo", # Required.
              messages: [{ role: "user", content: question }], # Required.
              temperature: 0.7,
          })
        Answer.update(response: response['choices'][0]['message']['content'])
        redirect_to rizzler_chat_answers_path(answer_id: @answer.id)
      end

      def index
        @answer = Answer.find(params[:answer_id])
      end
    end
  end
end