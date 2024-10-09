class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.9/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "74dade4e573e7a2682cc0d1395ed10de0372b3121cfc050e588ddc6fbf3a9abd"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.9/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "a3bd9cb61db33e44b265c20ca45329cb1db797db0649f0f0ab3a09be3956df97"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.9/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "dc7a8d10e0f04f709f14b55da301fd4bf7743af0a7dfb4ddb3e95383ba261f73"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.9/txtx-linux-arm64.tar.gz"
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