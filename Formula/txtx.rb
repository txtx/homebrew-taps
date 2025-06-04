class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.19/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "5a675b2c86f9b63ce8e2a1868e1c7f13e5181b0e0b3581cdf17322f619604e2a"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.19/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "69005f832e429db917a45875d2d919d83e3705a5edecf1b9fc5e780bf29f725b"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.19/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "de42e6ff326fe1e2efc5e50c91b9af982b0791b4be6cd32a7ca8e892c4c321a6"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.19/txtx-linux-arm64.tar.gz"
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