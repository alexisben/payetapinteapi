class Bar < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :price, :happy, :price_happy, :start_happy, :end_happy,
                  :addr_label, :addr_city, :addr_postal_code, :addr_country,
                  :enable, :partner, :phone, :facebook, :twitter, :site, :desc

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |bar,results|
    if geo = results.first
      bar.addr_label = geo.street_address
      bar.addr_city    = geo.city
      bar.addr_postal_code = geo.postal_code
      bar.addr_country = geo.country_code
    end
  end
  after_validation :geocode, :reverse_geocode
end
