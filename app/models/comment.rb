class Comment < ApplicationRecord
  belongs_to :doubt
  belongs_to :user
end
