class VeryNormal < Formula
  desc "Typing tutor that makes a layout from your typing and moves you to it"
  homepage "https://github.com/markryall/very-normal"
  url "https://github.com/markryall/very-normal/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6b844a23b406ff260fa8cf0d6fec884485da2bb8f083c1484f799a33691f2d1f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/markryall/very-normal.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "very-normal #{version}\n", shell_output("#{bin}/very-normal --version")
    assert_match "Very Normal", shell_output("#{bin}/very-normal plan")
  end
end
