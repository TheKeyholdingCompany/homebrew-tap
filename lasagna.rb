class Lasagna < Formula
  @@version = "0.0.5"
  @@organisation = "TheKeyholdingCompany"
  @@app_name = "lasagna"
  desc "A CLI tool to build your lambda layer zip for you."
  homepage "https://github.com/#{@@organisation}/#{@@app_name}"
  url "https://github.com/#{@@organisation}/#{@@app_name}/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "0a7e2c61e93f80f556a0c86ee78a0001e325f289ab0544984014d78e41f6fa01"
  license "Apache Licence, Version 2.0"
  head "https://github.com/#{@@organisation}/#{@@app_name}"
  
  depends_on "bash" => :build
  depends_on "go" => :build

  def install
    system "./build.sh", "--default", "--output=./dist", "--version=#{@@version}", "--no-zip"
    bin.install "./dist/#{@@app_name}"
  end

  test do
    system "#{bin}/#{@@app_name}", "--version"
  end
end