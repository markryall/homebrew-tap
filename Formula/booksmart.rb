class Booksmart < Formula
  desc "A terminal bookmark launcher: fuzzy-filter TOML bookmarks and open them in the right browser space"
  homepage "https://github.com/markryall/booksmart"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/booksmart/releases/download/v0.2.1/booksmart-aarch64-apple-darwin.tar.xz"
      sha256 "ae19efc6d2d99741c7a5e1cb3c57a33ecbe44f0e1aaaf0b03a9f06bbc07619da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/booksmart/releases/download/v0.2.1/booksmart-x86_64-apple-darwin.tar.xz"
      sha256 "b3d2d4eff786af39b6d033409ffec9e90b39bf4b8993a33dd305f943ef0e772f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/markryall/booksmart/releases/download/v0.2.1/booksmart-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c1c726d51252a2b43e9dc058fda6b5d79a7f35400abeb42d077e013761659962"
    end
    if Hardware::CPU.intel?
      url "https://github.com/markryall/booksmart/releases/download/v0.2.1/booksmart-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0cc5fd8ba7c8938d1412d472d2b9e0f6f483293e3761f84a1ec6ebcf9fd4fa6a"
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
      bin.install "booksmart"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "booksmart"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "booksmart"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "booksmart"
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
