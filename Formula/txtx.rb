class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.4/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "b24bdabe46cfcfa4b3df125893d96650a3613db6af89533670ea531ff5d440e7"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.4/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "969ac76e99b9cea2da1ce07a78c2d9b1022e09e5c0f56e411ecbba2f72899684"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.4/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "ebe09b3733417c4142e52019ded4a8bd140b16f5a4a4e52f49fed04329f1c7bd"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.4/txtx-linux-arm64.tar.gz"
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