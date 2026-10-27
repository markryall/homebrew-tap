class Cardthing < Formula
  desc "Simple, fast command-line tool for managing task cards"
  homepage "https://github.com/markryall/cardthing"
  url "https://github.com/markryall/cardthing/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eebf4409f67988a8100469c3ea9f2035481d47a99a6193b111533f8d1d0ba972"
  head "https://github.com/markryall/cardthing.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"cardthing", "--help"
  end
end
