class Title < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3}
    has_many :faq, dependent: :delete_all
end
