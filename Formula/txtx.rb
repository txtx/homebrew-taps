class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.14/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "457da5aae895551eddf98c08544cf27b28d0af1a422d35d53f54cf0833b358f6"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.14/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "a521bea7194a41784f7fd7437bc995ed51efacbbf76b149e477e6f1d740e55b8"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.14/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "28e0982c330e425b620a4a540cf3682ec6a1ec9eee84c0203b1eca6f44ebbd4f"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.14/txtx-linux-arm64.tar.gz"
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