class AddPullQuoteToMedia < ActiveRecord::Migration
  def change
    add_column :medias, :pull_quote, :text
  end
end
