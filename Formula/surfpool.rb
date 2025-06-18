class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.8.0/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 ""
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.8.0/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "f2bea44cdf7f4a26ae617cd9a016c487bf544077eec9575971b53f2af6d09a6f"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.8.0/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "b7afddbce3426050c13b77fcd16e4ef48d7402a717f957057a70113b8f1f7288"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.8.0/surfpool-linux-arm64.tar.gz"
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
