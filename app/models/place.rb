class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    has_one :favourite_place
end
