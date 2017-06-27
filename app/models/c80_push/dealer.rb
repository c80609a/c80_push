module C80Push
  class Dealer < ActiveRecord::Base
    has_and_belongs_to_many :regions
    has_many :offices, :dependent => :destroy
    accepts_nested_attributes_for :offices,
                                  :reject_if => lambda { |attributes|
                                    !attributes.present?
                                  },
                                  :allow_destroy => true

    validates :title,
              :uniqueness => true,
              :presence => true

    validates :ord,
              :presence => true

    default_scope -> { order(:ord => :asc) }

  end
end