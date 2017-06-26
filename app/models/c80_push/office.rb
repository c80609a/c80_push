module C80Push
  class Office < ActiveRecord::Base
    has_and_belongs_to_many :regions
    belongs_to :dealer

    validates :title,
              :presence => true

    validates :addr,
              :presence => true

    validates :gps,
              :presence => true

    validates :tel,
              :presence => true
  end
end