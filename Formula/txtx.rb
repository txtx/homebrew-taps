class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.1/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "8a7bc107207ca623dbd273eef22a0b659133a9e4e31ef1be97865a5371144634"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.1/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "8e0323cc17a9bd5e197aba02d5a87c476f98e9dbf380b1d5e4d8ffa38bd8bf3a"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.1/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "02044ed2ba195f8bca2fb545d7b4b3cbb326de635896cdb70d6aa4a6f9fc782b"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.1/txtx-linux-arm64.tar.gz"
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