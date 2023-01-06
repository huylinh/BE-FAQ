class Title < ApplicationRecord
    has_many :faq
    scope :with_title, ->(name) { where("LENGTH(title) > ?", name) }
end
