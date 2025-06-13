class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.3.0/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "b3560f32fb00ced209eab8be3752726251d895e460737997c73be256c5192541"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.3.0/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "cf56c877e2e2dde825a5d42491bfb2b6753f9c57d1cfcc06db6a1ee8b960e276"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.3.0/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "37211896f0c8f3257fe14e4ae277dfe7a0ddf16e3b440a6ed9f283beb0392c3e"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.3.0/txtx-linux-arm64.tar.gz"
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