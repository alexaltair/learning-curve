require 'spec_helper'



describe QuestionsController do
let (:question) {FactoryGirl.create(:question)}

  describe '#index' do
    before :each do
      get :index
    end


    it "should assign @questions" do
      @questions = Question.all
      expect(assigns(:questions)).to eq(@questions)
    end

    it "should render index.html" do
      expect(response).to render_template :index
    end
  end


  describe '#show' do
    before :each do
      get :show, id: question.id
    end

    it "should find question by id" do
      expect(assigns(:question)).to eq(question)
    end

    it "should render show.html" do
      expect(response).to render_template :show
    end
  end

  describe '#new' do

    it 'should render new.html' do
      get :new
      expect(response).to render_template :new
    end

  end


  describe '#create' do
    before :each do
      @new_question = {
        title: "question 2",
        description: "description 2"
      }
    end

    it 'should create a new question' do
      expect{
        post :create, question: @new_question
      }.to change(Question, :count).by(1)
    end
  end

  describe '#edit' do

    before :each do
      get :edit, id: question.id
    end

    it 'should find by id' do
      expect(assigns(:question)).to eq(question)
    end

    it 'should render edit.html' do
      expect(response).to render_template :edit
    end

  end

  describe '#update' do
    it 'should update question' do
      updated_question = {title: 'updated question', description: 'updated description'}
      put :update, id: question.id, question: updated_question
      question.reload
      question.title.should == updated_question[:title]
    end
  end

  describe '#destroy' do
    it 'should remove question' do
      question
      expect{
        delete :destroy, id: question.id
      }.to change(Question, :count).by(-1)

    end
  end



end
