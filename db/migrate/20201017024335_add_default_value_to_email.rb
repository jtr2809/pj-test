class AddDefaultValueToEmail < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:stores, :email, 'francisco.abalan@pjchile.com')
  end
end
