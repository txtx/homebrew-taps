class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    url "https://github.com/txtx/txtx/archive/refs/tags/v0.0.1-beta.0.tar.gz"
    sha256 "7d77ea2026325045879248c60368f0db6bd9aafa"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"
  
    depends_on "rust" => :build
  
    uses_from_macos "llvm" => :build # for libclang
  
    def install
      system "cargo", "install", "--locked", "--force",
                                  *std_cargo_args(path: "components/txtx-cli")
    end
  
    test do
      assert_match "txtx-cli", pipe_output("#{bin}/txtx --version", "n\n")
    end
  end