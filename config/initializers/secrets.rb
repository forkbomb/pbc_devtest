secret_file = YAML.load_file('config/secrets.yml')

SECRET_BASE = secret_file[Rails.env]['secret_key_base']