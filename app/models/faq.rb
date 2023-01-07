class Faq < ApplicationRecord
    validates :question, presence: true, length: {minimum: 3}
    validates :answer, presence: true, length: {minimum: 3}
    belongs_to :title
end
