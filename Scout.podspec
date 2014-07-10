Pod::Spec.new do |s|
  s.name     = 'Scout'
  s.version  = '1.0'
  s.summary  = 'Scout discovers apps installed on an iOS device utilising the URL scheme feature'
  s.description = <<-DESC
                    Scout discovers apps installed on an iOS device utilising the URL scheme feature. Evaluate the data as you intend.
                  DESC
  s.homepage = 'https://github.com/ustwo/Scout'
  s.license  = 'MIT'
  s.author   = { 'Martin Stolz' => 'martin@ustwo.com', 'Oliver White' => 'oliver@ustwo.com' }
  s.social_media_url = 'https://twitter.com/ustwo'
  s.ios.deployment_target = '7.0'
  s.source   = { :git => 'https://github.com/ustwo/Scout.git', :tag => '1.0' }
  s.source_files = 'Scout/*'
  s.public_header_files = 'Scout/*.h'
  s.requires_arc = true
end