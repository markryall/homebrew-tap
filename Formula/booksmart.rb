class Booksmart < Formula
  desc "Terminal bookmark launcher that opens bookmarks in the right browser space"
  homepage "https://github.com/markryall/booksmart"
  url "https://github.com/markryall/booksmart/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1e4cdf5e3a3896452a4eb60dab2691b13cf4ea08af68f178e488eab7c8cf6948"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/markryall/booksmart.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "booksmart #{version}\n", shell_output("#{bin}/booksmart --version")
  end
end
