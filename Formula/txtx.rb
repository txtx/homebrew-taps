class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.12/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "d96171d8915b98cde6576b20a2f27b463bd48a5b8229b73331a3ed731bfa0d68"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.12/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "776be0f0630d8d620f0ff80c8f14b3f9b238653807149192aa115236832c3244"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.12/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "6442f1e3c8553dc50fe62ce5864a5f08bdb1402fce870601012e38b4a0ae1862"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.12/txtx-linux-arm64.tar.gz"
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