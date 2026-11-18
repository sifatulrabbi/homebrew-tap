class SifatulStack < Formula
  desc "Install skills, sub-agents, and instructions into AI coding harnesses"
  homepage "https://github.com/sifatulrabbi/sifatul-stack"
  url "https://github.com/sifatulrabbi/sifatul-stack/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3c86480ca62989db5fdf2891cbcf6e276b96a2b20cd225a01276ebbdc50fe125"
  license "MIT"
  head "https://github.com/sifatulrabbi/sifatul-stack.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    cd "cli" do
      system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/sifatul-stack"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sifatul-stack --version")
  end
end
