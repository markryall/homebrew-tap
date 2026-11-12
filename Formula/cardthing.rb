class Cardthing < Formula
  desc "A simple CLI tool for managing task cards"
  homepage "https://github.com/markryall/cardthing"
  version "0.1.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/cardthing/releases/download/v0.1.5/cardthing-aarch64-apple-darwin.tar.xz"
      sha256 "cbfab576e329f033dc8c6580e1a54e41ea4f3c80ec674f1bd49e7aab4d1b7605"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/cardthing/releases/download/v0.1.5/cardthing-x86_64-apple-darwin.tar.xz"
      sha256 "f133e9e7cfcc4ad8c4e88d8f265f16dd5562973e419043c8e081c1fc93f464ce"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/cardthing/releases/download/v0.1.5/cardthing-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9c01de12914f766c22de0e0df8f5b0fe1dc22801c081686e0f8236f2e66f4c2f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/cardthing/releases/download/v0.1.5/cardthing-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8c165a1a3f933066dce3b198bb9a68b583d222e90f7fac38d2ff0ca7f295690a"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
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
      bin.install "cardthing"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "cardthing"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "cardthing"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "cardthing"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
