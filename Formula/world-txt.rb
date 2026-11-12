class WorldTxt < Formula
  desc "A cozy multiplayer text world: wander, chat, garden and craft on a shared island. No battles, just bonhomie."
  homepage "https://github.com/markryall/world.txt"
  version "0.12.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/world.txt/releases/download/v0.12.1/world-txt-aarch64-apple-darwin.tar.xz"
      sha256 "7fe6ef4b837f0a9074f8064bdaf11b7e866c3c5dc0f4ed1c508b0e538bf5056f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/world.txt/releases/download/v0.12.1/world-txt-x86_64-apple-darwin.tar.xz"
      sha256 "0d51f9406a108e354076047bb078424984f3a6b3ab253804e53d384ac7c4f630"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/world.txt/releases/download/v0.12.1/world-txt-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c2479ad8a95e49c9c3c5f76c8464b7a04f4a77b97c05bc43f32882e19daf492f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/world.txt/releases/download/v0.12.1/world-txt-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "311e5d73c565fa1dbf018b0e455543051f3d439fdaa1bafddd96ce604ef381cb"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {
      "world-txt": [
        "world.txt"
      ]
    },
    "aarch64-unknown-linux-gnu": {
      "world-txt": [
        "world.txt"
      ]
    },
    "x86_64-apple-darwin": {
      "world-txt": [
        "world.txt"
      ]
    },
    "x86_64-unknown-linux-gnu": {
      "world-txt": [
        "world.txt"
      ]
    }
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "world-txt"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "world-txt"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "world-txt"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "world-txt"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
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
