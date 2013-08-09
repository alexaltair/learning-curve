class Search < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.searchAnswers(search)
    if search
      Answer.find(:all, conditions: ['LOWER(caption) LIKE LOWER(?)', "%#{search}%"])
    end
  end

  def self.searchQuestions(search)
    if search
      Question.find(:all, conditions: ['LOWER(title) LIKE LOWER(?) or LOWER(description) LIKE LOWER(?)', "%#{search}%", "%#{search}%"])
    end
  end

  def self.searchLessons(search)
    if search
      Lesson.find(:all, conditions: ['LOWER(title) LIKE LOWER(?) or LOWER(description) LIKE LOWER(?)', "%#{search}%", "%#{search}%"])
    end
  end

end
