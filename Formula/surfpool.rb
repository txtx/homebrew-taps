class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.11/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "7ec1b6e8e29171234a0b2a947a21fd1f634658ae19443c4561c104e6d889a2ff"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.11/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "e6812dbd3759f62be6764dc48d6d7b5ff3cd75a0cb476a7551779341736748f6"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.11/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "dc3db7278d445de93e7639b00433ae9b688423b977f925ac04e7fc7a83077cd8"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.11/surfpool-linux-arm64.tar.gz"
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
