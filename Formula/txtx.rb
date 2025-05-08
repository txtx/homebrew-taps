class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.17/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "8a712c683cc3bcb124ee55be91138337578e3decf653ba0d6156e2459182eebf"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.17/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "daec3afbdc93951fd8e63116ffd194ab6b3f41e4687c7beb90cbe8b972bf5b62"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.17/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "e6412cb93e1522caee38007b5a741a02896d0bec7ab4abda81d2bb61003cabd8"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.17/txtx-linux-arm64.tar.gz"
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