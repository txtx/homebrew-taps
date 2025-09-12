class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.10.8/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "e5c9bff16bbb433074c4f23dbb0401c13e90a7a2e3f7aae884d8354ff5cee49c"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.8/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "049d47e2d92abb18d1db974ebdfae493d97240737bf4e3e0ad715734275b1bae"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.8/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "b90fa16bd5acb83c66fbb39d8fe32e5e00990eeb7165c84b9f23e7d4315bf70e"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.10.8/surfpool-linux-arm64.tar.gz"
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
