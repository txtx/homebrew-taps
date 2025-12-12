class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0-rc1/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "1e974c05c7b574a31083315600f8740c6ae4176d68783b14b012e616a7bdecca"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0-rc1/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "383747c419dd2fbeee4961bf8c7f76783769ae10564f89307408060120b9a7d4"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0-rc1/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "dd4c8d6c6b065cdc5c44e6ecc20c2ec748a7a6903dee9ef34de4273188cb86c9"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v1.0.0-rc1/surfpool-linux-arm64.tar.gz"
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
