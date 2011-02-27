class Asset < ActiveRecord::Base
  mount_uploader :data, DataUploader
end