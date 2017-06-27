module C80Push
  class Region < ActiveRecord::Base
    has_and_belongs_to_many :dealers
    has_and_belongs_to_many :offices

    default_scope -> { order(:ord => :asc) }

    validates :title,
              :uniqueness => true,
              :presence => true,
              :length => { in: 2..90 }

    validates :ord,
              :presence => true

  end
end