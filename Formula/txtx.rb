class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.13/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "5461329b8cd2faf2cd94a31d089ee57a95cfedba98b4143651f7c6db2be0668e"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.13/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "8302e7a0904de367108c801d43b8d0f78ef5ee0faec2af7ad5b1db4456be11f5"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.13/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 ""
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.13/txtx-linux-arm64.tar.gz"
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