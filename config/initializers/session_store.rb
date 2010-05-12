# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ue_session',
  :secret      => 'efd35e49b416db4483f7b408827cbfd95332d013d17ca7905a5302ae75bc863b6ef3ecd045b3ead6c9501ea7b177e315f0eceae9714d414e40d53f9da8e52bbb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
