class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.8/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "6b8e2fe4158b5fc950e64ba81c559573b734b31bd01799a2b04884fdd5b1d635"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.8/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "f6c386531dcdeaae2c96256464ee617e2eeacc6bd33bc1cc7e5f7af26b625ea3"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.8/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "10742177952dc8f3a64d4b16271901a26be9c6f04589f5e996c1166b86292962"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.8/surfpool-linux-arm64.tar.gz"
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
