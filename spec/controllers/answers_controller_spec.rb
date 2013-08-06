require 'spec_helper'

describe AnswersController do

  let(:answer) {FactoryGirl.create(:answer)}

  describe '#upload' do

    it 'should create a new answer' do
      @new_answer = {
      caption: "answer caption",
      video: "AAAAAA",
      user_id: 1
    }

    expect{
      post :upload, answer: @new_answer
    }.to change(Answer, :count).by(1)
    end

  end

  describe '#save_video' do

    before :each do
      get :show, id: answer.id
    end

    it 'should find answer by id' do
      expect(assigns(:answer)).to eq(answer)
    end

    it 'should redirect to questions show page' do
      expect(response).to render_template :show
    end
  end

  describe '#destroy' do
    it 'should remove answer' do
      answer
      expect{
        delete :destroy, id: answer.id
      }.to raise_error ActiveRecord::RecordNotFound
    end
  end


end
