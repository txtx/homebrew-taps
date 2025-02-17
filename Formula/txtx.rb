class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.5/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "444bd24c6cb14cb7d112a56ba438c96eeadb1a9daad92344cc2c42c16f27af29"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.5/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "6ef62b34b248f28c6094b4c789146666a2db2f4f462127210de3f035510061be"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.5/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "4b5892c367a79811ccd4157f2318e8a561d7d83239d57cad68bb3d0145eaae69"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.5/txtx-linux-arm64.tar.gz"
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