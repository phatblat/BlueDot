Pod::Spec.new do |s|
  s.name             = "BlueDot"
  s.version          = "0.1.1"
  s.summary          = "A self-animating view that mimics the current location dot in the iOS Maps app."
  s.description      = <<-DESC
                       A QuartzCore experiment that yielded something very similar to the animated current location dot from Maps.
                       DESC
  s.homepage         = "https://github.com/phatblat/BlueDot"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ben Chatelain" => "benchatelain@gmail.com" }
  s.social_media_url = 'https://twitter.com/phatblat'

  s.source           = { :git => "https://github.com/phatblat/BlueDot.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
end
