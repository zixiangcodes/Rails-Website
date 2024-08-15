Rails.application.config.active_storage.variant_processor = :mini_magick
Rails.application.config.active_storage.service_urls_expire_in = 1.hour

# Increase the maximum upload size (e.g., to 5 MB)
Rails.application.config.active_storage.service_configurations.deep_merge!(
  local: { root: Rails.root.join("storage") },
  test:  { root: Rails.root.join("tmp/storage") },
  amazon: { upload: { multipart_threshold: 5.megabytes } }
)