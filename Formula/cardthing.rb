class Cardthing < Formula
  desc "Simple, fast command-line tool for managing task cards"
  homepage "https://github.com/markryall/cardthing"
  url "https://github.com/markryall/cardthing/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7d97632aede285593eb22f030185504cf0760fedd86da81ed2106189b05f688f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/markryall/cardthing.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"cardthing", "--help"
  end
end
