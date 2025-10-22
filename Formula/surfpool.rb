class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.11.1/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "5cea4994bcd0320c5864477955412032b44f7c2083f12683dfbc2dfae4a87efa"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.11.1/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "9d52481a760f6cd4a440886b59dd5cabc671b20e2e39936caccd67f95bc564ee"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.11.1/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "41b81daf465096a219f263d8aef83997b37e7fb4f9754a862206d88e02f5fa38"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.11.1/surfpool-linux-arm64.tar.gz"
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
