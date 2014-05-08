class Relationship < ActiveRecord::Base
  belongs_to :suffix, class_name: "Word"
  belongs_to :prefix, class_name: "Word"
end
