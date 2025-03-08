class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.7/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "c200bee112e0f4be9c9ba0bbc8dbc08bfab68fc02ec34b443fc67fab171500a5"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.7/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "d596352028062d229198509a2d830651ad7cf73e88e6fbcab8c6a25db0c2aebf"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.7/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "3dd43be016bc63b357c64f23f7d3a9108845dde2a79d1cb12ecfd7ea5256ff9f"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.7/txtx-linux-arm64.tar.gz"
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