class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.15/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "fbd2a67b8e0f672646ef87c4d4d75a219798985b28a9882ce440c862e3d0d057"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.15/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "6855c40c36bdc24b1b30663de52a2fa792b899d21f1124d23c2f6adf9ae0e856"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.15/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 ""
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.15/txtx-linux-arm64.tar.gz"
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