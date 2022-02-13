class Versioneer < Formula
  desc "🏆 Standalone tool version your Git repos following conventional-commits"
  homepage "https://github.com/johnnyhuy/versioneer"
  version "1.0.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/johnnyhuy/versioneer/releases/download/v#{version}/versioneer-macos-arm64.tar.gz"
    elsif Hardware::CPU.is_64_bit?
      url "https://github.com/johnnyhuy/versioneer/releases/download/v#{version}/versioneer-macos-x64.tar.gz"
    end
  elsif OS.linux?
    url "https://github.com/johnnyhuy/versioneer/releases/download/v#{version}/versioneer-linux-x64.tar.gz"
  elsif OS.windows?
    url "https://github.com/johnnyhuy/versioneer/releases/download/v#{version}/versioneer-win-macos-x64.tar.gz"
  end

  depends_on "git"
  depends_on "zsh" => :optional

  def install
    bin.install "versioneer"
  end

  test do
    system "#{bin}/versioneer"
  end
end