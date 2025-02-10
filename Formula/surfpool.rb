class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.6/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "048777b06137a17ec149577ed01b57241331caf35b48a76c4d4e4496508688cf"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.6/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "2a1e4c9c8ae27d3a14cd37e5968bf31d019cf8607d9a1b06f65d34711d855981"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.6/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "48d1a40b109f8428fef19dad82164e63c61c521d4da17cf53113b1919185556f"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.6/surfpool-linux-arm64.tar.gz"
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
