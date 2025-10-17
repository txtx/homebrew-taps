class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.11.0/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "6f0a928419f2b3964036ac3a8670bf7d3e6adb97ee2f0df429d9c473f0232417"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.11.0/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "5016c9bd8626119a3a3eac353e2f32a6eb744c2ae480ba11a28c2923056dd689"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.11.0/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "51151faf93ce683a2ff5da8bd471f401a65e0f38f2fb549643164c50d147b0d3"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.11.0/surfpool-linux-arm64.tar.gz"
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
