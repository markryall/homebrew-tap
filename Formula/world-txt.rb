class WorldTxt < Formula
  desc "Cozy multiplayer text world: wander, chat, garden and craft on a shared island"
  homepage "https://github.com/markryall/world.txt"
  url "https://github.com/markryall/world.txt/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "205f4370c342f4b5a8e38acefe42575e855f55148505cb14fc415e5b4e0a6c53"
  license "MIT"
  head "https://github.com/markryall/world.txt.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # Cargo won't put a "." in a binary name, so it's renamed here.
    mv bin/"world-txt", bin/"world.txt"
  end

  test do
    assert_match "world.txt #{version}", shell_output("#{bin}/world.txt --version")
  end
end
