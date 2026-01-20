class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "d4f56b6f2b69d5d1aefb0cc43d79a3663787283df89b88b5658c193f8ff96fb3"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "afefac437cf5b4e1e4b8766bbe48b47a360017fc0ec54769f106351097c8191d"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "4812efc59f8f144a891df7fab9f52d88779fcf35ac8b6b5d6cdd5fb173bda7b1"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-linux-arm64.tar.gz"
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
