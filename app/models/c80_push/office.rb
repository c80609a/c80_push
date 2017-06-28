module C80Push
  class Office < ActiveRecord::Base
    has_and_belongs_to_many :regions
    belongs_to :dealer

    default_scope -> { order(:ord => :asc) }

    validates :ord,
              :presence => true

    validates :title,
              :presence => true

    validates :addr,
              :presence => true

    validates :gps,
              :presence => true

    validates :tel,
              :presence => true

    def gps_arr
      self.gps.split(',').map! { |c| c.to_f }
    end
  end
end