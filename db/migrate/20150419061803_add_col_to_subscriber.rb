class AddColToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :accept_terms, :boolean
  end
end
