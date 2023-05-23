class Lasagna < Formula
  @@version = "0.0.4"
  @@organisation = "TheKeyholdingCompany"
  @@app_name = "lasagna"
  desc "A CLI tool to build your lambda layer zip for you."
  homepage "https://github.com/#{@@organisation}/#{@@app_name}"
  url "https://github.com/#{@@organisation}/#{@@app_name}/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "a030716c789f207f88b1d818286e34ddc619928d1ed1d8cbd626c46c70dc09c8"
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