module C80Push
  class Region < ActiveRecord::Base
    has_and_belongs_to_many :dealers
    has_and_belongs_to_many :offices
  end
end