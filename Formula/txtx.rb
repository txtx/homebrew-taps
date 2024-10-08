class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.8/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "3c7ad190c02746638c78cc15b68ea8c9be7aa4f98c9cfce2fd845f1a73557e80"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.8/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "76fdd11dcb967e6107eb9174b80b9b150f4e476a5c7ab66ffce604f70fe5d682"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.8/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "ef7b50580199f7e6bf2022c8a6e7ddb3eadc22b9e9da5dfd760c149cbbbe3736"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.8/txtx-linux-arm64.tar.gz"
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