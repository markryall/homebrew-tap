cask "font-mote-mono" do
  version "0.1.0"
  sha256 "c095990bcf8921c1074fa50cbdbcfc727375653ef3f0800efdc1958af602a1bf"

  url "https://github.com/markryall/mote-mono/releases/download/v#{version}/MoteMono-#{version}.zip"
  name "Mote Mono"
  desc "Rounded monospace coding font built on Iosevka"
  homepage "https://github.com/markryall/mote-mono"

  livecheck do
    url :url
    strategy :github_latest
  end

  font "MoteMono-Bold.ttf"
  font "MoteMono-BoldItalic.ttf"
  font "MoteMono-Italic.ttf"
  font "MoteMono-Light.ttf"
  font "MoteMono-LightItalic.ttf"
  font "MoteMono-Medium.ttf"
  font "MoteMono-MediumItalic.ttf"
  font "MoteMono-Regular.ttf"
end
