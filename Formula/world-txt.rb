class WorldTxt < Formula
  desc "Cozy multiplayer text world: wander, chat, garden and craft on a shared island"
  homepage "https://github.com/markryall/world.txt"
  url "https://github.com/markryall/world.txt/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "e951a7aa06bc837d510f1068631b4a031adacb26248d241bfb4eb3c860edaaaf"
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
