class AddTitleToFaqs < ActiveRecord::Migration[7.0]
  def change
    add_reference :faqs, :title, null: false, foreign_key: true
  end
end
