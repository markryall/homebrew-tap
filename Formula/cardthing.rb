class Cardthing < Formula
  desc "Simple, fast command-line tool for managing task cards"
  homepage "https://github.com/markryall/cardthing"
  url "https://github.com/markryall/cardthing/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "46caf5b2f7309d055a6a3901b5307938da69e1216debbf10444f61819473992a"
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
