class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.15/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "2f168c1ad58e904dbfdcb4ff7cd80179d1b66dc4207468074b397813e6548041"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.15/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "2e92f4f4121b45f9b5c6dd9caead83af80a8c83b88b784fbad7b2555368fe88f"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.15/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "457c55f298e0eeb4ea836f99b8f6554438e1ab0fc53de2f9c16cac4d8e5c50fc"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.15/txtx-linux-arm64.tar.gz"
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