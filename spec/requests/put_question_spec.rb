require 'rails_helper'

describe "PUT /api/v1/questions/:id" do
  before(:each) do
    @question = create(:random_question)
  end

  it 'updates a question' do
    @new_question = Faker::Lorem.question
    @new_answer = Faker::Lorem.sentence

    put "/@question.id">api/v1/questions/#{@question.id}", params: {question: @new_question, answer: @new_answer}

    expect(response.status).to eq(202)
    expect(Question.find(@question.id).question).to eq(@new_question)
    expect(Question.find(@question.id).answer).to eq(@new_answer)
  end
end