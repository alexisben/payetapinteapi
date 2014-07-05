class AddAttrsToBars < ActiveRecord::Migration
  def change
    add_column :bars, :happy, :boolean
    add_column :bars, :addr_label, :string
    add_column :bars, :addr_city, :string
    add_column :bars, :addr_postal_code, :string
    add_column :bars, :addr_country, :string
    add_column :bars, :enable, :boolean
    add_column :bars, :partner, :boolean
    add_column :bars, :phone, :string
    add_column :bars, :facebook, :string
    add_column :bars, :twitter, :string
    add_column :bars, :site, :string
    add_column :bars, :desc, :string



  end
end
