class Octant < Formula
  desc "A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
  homepage "https://github.com/vmware/octant"
  url "https://github.com/vmware/octant.git",
    :tag      => "v0.5.1",
    :revision => "e0397d2596a7575abf4ca9aeacafd92912d484e0"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "0b31bb62b87e33a40e472368b27d4180180641220c8d1a3e71226270aaef0414" => :mojave
    sha256 "0b31bb62b87e33a40e472368b27d4180180641220c8d1a3e71226270aaef0414" => :high_sierra
    sha256 "0b31bb62b87e33a40e472368b27d4180180641220c8d1a3e71226270aaef0414" => :sierra
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["CGO_ENABLED"] = "0"
    src = buildpath/"src/github.com/vmware/octant"
    src.install buildpath.children
    src.cd do
      system "make", "octant-dev"
      bin.install "octant"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/octant", "--help"
  end
end
