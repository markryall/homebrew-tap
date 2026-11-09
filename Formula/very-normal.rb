class VeryNormal < Formula
  desc "Typing tutor that moves your keyboard to a new layout a few keys at a time"
  homepage "https://github.com/markryall/very-normal"
  url "https://github.com/markryall/very-normal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0c178e3286461785d0e9c0fa591c3bcc3eddc49b49c675c68f4a8d69a7c8479b"
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
