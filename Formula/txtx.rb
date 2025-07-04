class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.4.1/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "2fdbdea31c7707250d068babf8af359b1d384dd8d7725e59eb9eea7b3bca44e9"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.4.1/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "4f8072c8132d39995e8f3d5d9a91db4fe596ded3cf440acdba87933b7a4718f2"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.4.1/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "bcb6e9d30e486b5a2cba794272c4e8a09c373d8624aeff7d5d0fce025ad6b2a5"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.4.1/txtx-linux-arm64.tar.gz"
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