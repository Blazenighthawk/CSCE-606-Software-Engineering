class Movie < ActiveRecord::Base
end

class Movie < ActiveRecord::Base
    scope :filter_by_rating, -> (rating) { where rating: G }
    scope :filter_by_rating, -> (rating_id) { where rating_id: PG }
    scope :filter_by_rating, -> (rating_id) { where rating_id: PG-13}
    scope :filter_by_rating, -> (rating_id) { where rating_id: R }
    
  end