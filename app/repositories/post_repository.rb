module PostRepository
  extend ActiveSupport::Concern

  included do
    scope :created, -> { where :state => :created }
  end
end
