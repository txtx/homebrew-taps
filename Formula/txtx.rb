class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.1/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "53056b22304ee5fcbcea23e6eaaff7f5c21c03050204895e11075beb4ba7cdc1"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.1/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "03e2a20833d91484fcaeb5448b1f2f9cc0a4f74e4e2ec50a5b21392c3f39874e"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.1/txtx-linux-x64-glibc.tar.gz"
            # sha for linux_x64
            sha256 "0af64828fd4c3b7d75a0926425508ca32dadba9b3b06321d1c6525a8218e167e"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.1/txtx-linux-arm64.tar.gz"
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