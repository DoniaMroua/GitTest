class Book < ActiveRecord::Base
  belongs_to :author, :foreign_key => :author_id
  #Override the as_json method to include the author.
  def as_json(options = {})
    super(options.merge(include: :author))
  end
end
