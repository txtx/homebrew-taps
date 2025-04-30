class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.15/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 ""
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.15/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "58ba1b22e82949fc7b27d7dedac0d96a4cf79128d8c7df8482a38bd91a565ff6"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.15/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "5ca214188366cddb8a2735ffe62f1dced5b2c9256277b3f186d06eb1291d6f99"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.15/surfpool-linux-arm64.tar.gz"
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
