class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.16/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "9750aa8f1c9ecb20ef675c5bd7ce793e4a0a9840498271734a036103bfef6c83"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.16/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "06ff69e41fa147b1724ecadc98935b8c77e5aef0c63b103830d9ef69447fc99a"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.16/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "b8265a8e0ef782e2229c9b61d0487703cdc02cc5f49f1afa5bb4dc169f34cdc4"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.16/txtx-linux-arm64.tar.gz"
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