class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.4.0/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "8e489dae47b712ba902f0a0ca84d72909e0f61cef3e648e887fa66cacc083162"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.4.0/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "d23c325a0daf20ade06dfe4cb5d579b9f71f4ede63930e16c1ec2a25d3139548"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.4.0/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "d358a929dd4e527d0eb4e4002ae1f4a0a2bdcedfa9b58b9eb14d1cfb55ffbd87"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.4.0/txtx-linux-arm64.tar.gz"
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