class VeryNormal < Formula
  desc "A terminal typing tutor that makes a keyboard layout from your own typing and moves you to it from the layout you type on now, a few keys at a time"
  homepage "https://github.com/markryall/very-normal"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/very-normal/releases/download/v0.3.0/very-normal-aarch64-apple-darwin.tar.xz"
      sha256 "00ed79114e6a2305d8ac540e5ad3dcd91487bdfd0637af4721298da5bd58a40d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/very-normal/releases/download/v0.3.0/very-normal-x86_64-apple-darwin.tar.xz"
      sha256 "fde774d09da82fde4de8bec94e8b1ba2b1a63bc64d25d4ea6f3e0d3a35ee5475"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/very-normal/releases/download/v0.3.0/very-normal-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "94cb204739da8ca37e953e32192d7bdcaf5e3057333bc5329959971d0ad95c4d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/very-normal/releases/download/v0.3.0/very-normal-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b5e7a38945785ae28ec2f77f4c441dd84678820d041359ee062738841cad0ae3"
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
