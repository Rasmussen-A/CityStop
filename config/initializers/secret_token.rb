# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
CityStop::Application.config.secret_token = '1effdaece12bc5d49ae5de78121b62c268cfc02811a6ed6462a0afeffb440da4ea6403f635b09c6a1eca5c87c194c237380feeed6a5beec5842857164e9e2b75'

CityStop::Application.config.secret_token = 'existing secret token'
CityStop::Application.config.secret_key_base = 'new secret key base'
