class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.2/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "0a18519a10889a8fde244498ac9eefbe63766e98ce7e90ca6fbe77729585f99f"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.2/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "080dde5186c91a2732ae1090abe38a54de6812f5581818d3db2985e3352421d0"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.2/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "5180d6a9beaa06124ecaec8ee49695a60cbac49984db5d8a50c20754b048f557"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.2/txtx-linux-arm64.tar.gz"
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