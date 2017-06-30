module C80Push
  class Preset < ActiveRecord::Base
    has_and_belongs_to_many :dealer
  end
end