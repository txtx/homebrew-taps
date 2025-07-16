class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.4.3/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "bd9ddb449bcc570a06668d8ebdb9290bfda647e053603569a1ae9b48ce957b1d"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.4.3/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "aaf21edb2d722634f1bb4351fb0ed0404149f33324acbe21c86bea61bdbd54bb"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.4.3/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "1bad9d91b6712904268d43170a08827055494bf2a97f8548b0ee11c86f91fb78"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.4.3/txtx-linux-arm64.tar.gz"
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