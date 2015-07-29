WECHAT_CONFIG = YAML.load_file(Rails.root.join('config', 'wechat.yml'))[Rails.env].with_indifferent_access
