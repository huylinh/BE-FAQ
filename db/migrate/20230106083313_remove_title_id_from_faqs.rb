class RemoveTitleIdFromFaqs < ActiveRecord::Migration[7.0]
  def change
    remove_column :faqs, :title_id, :string
  end
end
