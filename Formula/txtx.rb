class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.10/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "a834d4ce5cbd9d6f3a91dc5e46c2e0238363073fa9f6f4ac59cd29b88369fee6"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.10/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "b43b845d230192c2a6e601beb2293a3ae14511a7b2d36e3f7a139b25acc8c349"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.10/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "a61e975df80c457ad76502e80a8314b2b9de1ed890298333278bbfefa514ff82"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.10/txtx-linux-arm64.tar.gz"
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