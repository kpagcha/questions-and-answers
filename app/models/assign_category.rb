class AssignCategory
  include ActiveModel::Model

  attr_accessor :name, :question

  def initialize params={}
    params.each do |param, value|
      self.public_send(:"#{param}=", value)
    end
  end

  validates :name, presence: true

  def save
    if valid?
      persist!
      #true
    else
      false
    end
  end

  def persisted?
    false
  end

  private

  def persist!
    @question = Question.find_by_id(question)
    @category = Category.find_by_name(name)
    if @category
      @question.category = @category
      @question.save
    else
      @category = Category.new(name: name)
      if @category.save
        @question.category = @category
        @question.save
      else
        false
      end
    end
    true
  end
end
