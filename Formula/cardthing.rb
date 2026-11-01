class Cardthing < Formula
  desc "Simple, fast command-line tool for managing task cards"
  homepage "https://github.com/markryall/cardthing"
  url "https://github.com/markryall/cardthing/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "a42789fa1de8b19586497873ae2134329d4f987c834465eae64db23a93f0600e"
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
