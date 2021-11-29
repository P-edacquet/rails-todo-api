require 'rails_helper'

describe "delete question route" do
  before(:each) do
    @question_one = create(:random_question)
    @question_two = create(:random_question)
  end

  it 'should delete the question' do
  get "/api/v1/questions"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq([YAML.load(@question_one.to_json),YAML.load(@question_two.to_json),])

  delete "/api/v1/questions/#{@question_one.id}"
    expect(response.status).to eq(204)

  get "/api/v1/questions"
    expect(JSON.parse(response.body)).to eq([YAML.load(@question_two.to_json)])
  end
end