class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.11/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "9b7bf9234e5d72ccc404d076d3a1f84dd74564f7610618ce14a1100fe65b73a3"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.11/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "9c78ac981716e287ee7a5552f948b3216e5d5e612cf5ca28af193d9f6dd5d08b"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.11/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "c69fa200ff97abdf0fc17ac2036b0521f4dbd0c7046b548f838a88018f42fc0e"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.11/txtx-linux-arm64.tar.gz"
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