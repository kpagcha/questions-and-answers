class AssignCategoryService
  def call form_object
    form_object.validate!

    ActiveRecord::Base.transaction do
      question = Question.find_by_id form_object.question
      category = Category.find_by_name form_object.name
      if category
        question.category = category
        question.save
      else
        category = Category.new(name: form_object.name)
        category.save
        question.category = category
        question.save
      end
    end

    form_object
  rescue form_object.class::ValidationError
    false
  end
end