class AssignCategory
  ValidationError = Class.new(StandardError)

  include ActiveModel::Model
  include Virtus.model

  attribute :name, String
  attribute :question, Integer

  validates :name, presence: true

  def persisted?
    false
  end

  def validate!
    raise ValidationError, errors unless valid?
  end
end
