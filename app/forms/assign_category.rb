# Placed in app/models instead

# class AssignCategory
#   include ActiveModel::Conversion
#   include ActiveModel::Validations
#   extend ActiveModel::Naming
#   include ActiveModel::Model

#   attr_accessor :name

#   def initialize params={}
#     params.each do |param, value|
#       self.public_send(:"#{param}=", value)
#     end
#   end

#   validates :name, presence: true

#   def save
#     if valid?
#       persist!
#       true
#     else
#       false
#     end
#   end

#   def persisted?
#     false
#   end

#   private

#   def persist!
#     @question = Question.find_by_id(params[:id])
#     @question.category.create!(name: name)
#   end
# end
