class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    url "https://github.com/txtx/txtx/archive/refs/tags/v0.0.1-beta.0.tar.gz"
    sha256 "15526b7a010b0553648b2a36a8fe5cbeec376d7c7a3a6030ccef9e8c0cbdbdec"
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