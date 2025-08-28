class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.10.5/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 ""
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.5/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "d4bb3765bcda64ae86f5547ab6777f6f7880c923b3fac7479b49ce04946cf3a3"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.5/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "f4ac578a50e8b9bdc05a938381d898c7db5324f0b2b6f4dc8d4898a9f2eaa1d8"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.10.5/surfpool-linux-arm64.tar.gz"
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
