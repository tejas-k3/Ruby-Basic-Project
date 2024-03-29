class Todo < ApplicationRecord
    enum state: { created: 0, in_progress: 1, done: 2 }
    has_one_attached :image
    has_many :poly_comments, as: :commentable
end
