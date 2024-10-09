class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.10/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "519bcba59575fd5383264001b66c47c1f33a748b5b4d8cdd96dcf55ab0dfebb4"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.10/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "dad8ef424b5fffacc0245a839d24aa123d15d1d3d983e31e045779d31de1f0c7"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.10/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "98279944749635caa85ed5a8a7e445d59e7eaa43563db94bfe90829b78c32fa9"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.10/txtx-linux-arm64.tar.gz"
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