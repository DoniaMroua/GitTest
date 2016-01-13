class Author < ActiveRecord::Base
  has_many :books
  def as_json(options = {})
    super(options.merge(include: :books))
  end
end
