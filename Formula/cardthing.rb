class Cardthing < Formula
  desc "Simple, fast command-line tool for managing task cards"
  homepage "https://github.com/markryall/cardthing"
  url "https://github.com/markryall/cardthing/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8ee73ea2f8acccd07cbc87f7a6e24612335f209730d3f31cf3e65daf36930a8d"
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
