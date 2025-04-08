class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.12/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "665d8b596cd0f6312b3e7ed2cbf7f607fb9b9b7e2f98b6abc445fbb3c0fec1b1"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.12/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "6889e09201a0d15fdb7dbfafcc11b0aefc82922989d720a31a62097be2f561fb"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.12/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 ""
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.12/txtx-linux-arm64.tar.gz"
        #     # sha for linux_arm64
        #     sha256 "SHA256_OF_LINUX_ARM64_BINARY"
        end
    end
  
    def install
        bin.install "txtx" => "txtx"
    end
    
    test do
      assert_match pipe_output("#{bin}/txtx --version", "n\n"), "txtx-cli"
    end
  end