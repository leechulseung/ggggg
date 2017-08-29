class Cbb < ActiveRecord::Base
    belongs_to  :user
    has_many :ccomments
end
