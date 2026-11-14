class VeryNormal < Formula
  desc "A terminal typing tutor that makes a keyboard layout from your own typing and moves you to it from the layout you type on now, a few keys at a time"
  homepage "https://github.com/markryall/very-normal"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/very-normal/releases/download/v0.4.0/very-normal-aarch64-apple-darwin.tar.xz"
      sha256 "be78ac1f4ec0a33e907b03f7278e56e2aeed0bbb11bf795712963b5af593228b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/very-normal/releases/download/v0.4.0/very-normal-x86_64-apple-darwin.tar.xz"
      sha256 "3bca6f8bef7d832b4f15903d3404822df9e73c1d3aefd4bd028961e9528e1c28"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/very-normal/releases/download/v0.4.0/very-normal-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5cb673654bae820cd73090232cdea99954ea7fd3da170a8dcf0ff4d3db75cddf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/very-normal/releases/download/v0.4.0/very-normal-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e3b0aea17bcd8c47a2f0813d669f350fd3f4b7f15927bdd9e236d49e39f07341"
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
