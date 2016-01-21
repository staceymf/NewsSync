Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'vWaPq32ONt4EM4XYT5KiAi3wb', "swecZkrnQoXq2qPIGZLAVY45WUGqNFDPRu8jTOesMROI07nPxM",
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'en'
      }
    }
end
