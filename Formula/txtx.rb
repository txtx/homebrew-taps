class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.3/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "fefb05cae7a3481953fd9450db9602bc2b82a48d96cd236249ee312a8ff61a1b"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.3/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "f38d83ec467e1c1d9cacaa380b0b583d4e470d73895f7df52d49a70014deb7e0"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.3/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "f72c42e04354eb52b3ae4a3234a3d94043d27e4eef3a33c8ec12eaed4f996ef1"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.3/txtx-linux-arm64.tar.gz"
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