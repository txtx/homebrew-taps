class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.11.2/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "b96aca49a04210664c42b27f2969d9228ed1240c2d697ffa8ee264b21840f409"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.11.2/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "7c3bbf8e8a613f40f81c602d6ccd71a9a646e3a0a827d47dd96a17dc31a73ab9"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.11.2/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "bbe2130465c2da38d64f82bc4a395a6ae1fe6bf23612b6801f2e08ec0c774c86"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.11.2/surfpool-linux-arm64.tar.gz"
        #     # sha for linux_arm64
        #     sha256 "SHA256_OF_LINUX_ARM64_BINARY"
        end
    end
  
    def install
        bin.install "surfpool" => "surfpool"
    end
    
    test do
      assert_match pipe_output("#{bin}/surfpool --version", "n\n"), "surfpool-cli"
    end
  end
