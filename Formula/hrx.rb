# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hrx < Formula
  desc "Human-Readable archive utility"
  homepage "https://github.com/go-coreutils/hrx"
  license "Apache-2.0"
  head "https://github.com/go-coreutils/hrx.git", branch: "trunk"

  depends_on "go" => :build

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    system "make", "prefix=#{prefix}", "release", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test enjenv`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system bin/"hrx", "--help"
  end
end
