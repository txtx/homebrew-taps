class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.3/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "136d725026ce2ed359b99005da6b0a32d4b519e9201399a30d630accfc06f7e9"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.3/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "09fc6817bac1feee46b3a7b2d68b8b98b6289b9892fc1372cc4f1d09ab1a6c24"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.3/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "edc332e301294ce2535510053a32a7ccb6b2d2a915509d9e42e706b74cebf772"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.3/txtx-linux-arm64.tar.gz"
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