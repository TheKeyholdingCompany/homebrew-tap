class Lasagna < Formula
  @@version = "0.1.0"
  @@organisation = "TheKeyholdingCompany"
  @@app_name = "lasagna"
  desc "A CLI tool to build your lambda layer zip for you."
  homepage "https://github.com/#{@@organisation}/#{@@app_name}"
  url "https://github.com/#{@@organisation}/#{@@app_name}/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "d782f35d29d359ad8bfb02f5ba2ab35ed27575822029a4831c190bc5c4a14e00"
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