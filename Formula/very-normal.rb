class VeryNormal < Formula
  desc "A terminal typing tutor that makes a keyboard layout from your own typing and moves you to it from QWERTY a few keys at a time"
  homepage "https://github.com/markryall/very-normal"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/very-normal/releases/download/v0.2.1/very-normal-aarch64-apple-darwin.tar.xz"
      sha256 "5c4ec0a0d9119c71274a7425749d15a2d32cb3a97dad89e7cd50a26c13ca30dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/very-normal/releases/download/v0.2.1/very-normal-x86_64-apple-darwin.tar.xz"
      sha256 "334dfcc24c6f83ce54d8e87b0bd1377dfb6970132b83b8ea2d43dbdbe33b9d84"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/very-normal/releases/download/v0.2.1/very-normal-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3db2b0e198f8d2a597dd4157ef9d33bd85518b5817fa2ae423bb1a42552cd397"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/very-normal/releases/download/v0.2.1/very-normal-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "08368370ad8e005954aa8c7b98d62b5dc4ba445b20fccef740b01edae8e88d6a"
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
      bin.install "very-normal"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "very-normal"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "very-normal"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "very-normal"
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
