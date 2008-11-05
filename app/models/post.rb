class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :small => "96x96>", :regular => "450x450>" },
                    :url  => "/assets/posts/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'wedidit_dev'

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  before_validation :geocode_address

  private
    def geocode_address
      if !city.blank?
        begin
          geo=GeoKit::Geocoders::MultiGeocoder.geocode(city + ' ' + state + ' ' + country)
        rescue
          errors.add(:address1, "Could not Geocode address") if !geo.nil? && !geo.success
        end
          errors.add(:address1, "Could not Geocode address") if !geo.nil? && !geo.success
        self.lat, self.lng = geo.lat,geo.lng if !geo.nil? && geo.success
      end
    end

end