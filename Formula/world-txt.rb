class WorldTxt < Formula
  desc "Cozy multiplayer text world: wander, chat, garden and craft on a shared island"
  homepage "https://github.com/markryall/world.txt"
  url "https://github.com/markryall/world.txt/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "d4f7df8e839acf79f5e2871cd388cf030cef12bf8fe3d1cf7c5bf05e947e0622"
  license "MIT"
  head "https://github.com/markryall/world.txt.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # Cargo won't put a "." in a binary name, so it's renamed here.
    mv bin/"world-txt", bin/"world.txt"
  end

  def caveats
    <<~EOS
      For sound in the terminal client (radios, gramophones, jukeboxes, hums
      and the island's own sounds), and to play your own songs from it:
        brew install mpv
      Then type `sound on` in world.txt play.
    EOS
  end

  test do
    assert_match "world.txt #{version}", shell_output("#{bin}/world.txt --version")
  end
end
