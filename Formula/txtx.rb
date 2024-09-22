class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.7/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "f367c009fb2da174252e75204390c0b75c6011878d9e48e743cf4a1bc63a2a34"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.7/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "9f918ca379bf343ab1590113e0b9981abaddd8f42308b2d79e3d0cfd369241e8"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.7/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "5de792b042dbf0205bbfbfe5cb3b84d41dedb515ceb86484324940a16a7b76ea"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.7/txtx-linux-arm64.tar.gz"
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