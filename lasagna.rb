class Lasagna < Formula
  @@version = "0.0.7"
  @@organisation = "TheKeyholdingCompany"
  @@app_name = "lasagna"
  desc "A CLI tool to build your lambda layer zip for you."
  homepage "https://github.com/#{@@organisation}/#{@@app_name}"
  url "https://github.com/#{@@organisation}/#{@@app_name}/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "1a989ea4e9d4dd482954d9e15653cb0a03566cab4dcde637dd9fd16238a7d15b"
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