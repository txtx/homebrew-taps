class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.6/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "d8f6b6d5e27999f937b4df69a5326353fc44e70fe5314d7a2dd3cb1ae190e2b2"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.6/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "5a3b36f136c9b45c3406e1befdc1f6c5240cd0197bfc7bcf79d8f32d75a3ebca"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.6/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "ca5d5849cbb0c3d1fc46161e6b0f141541004c2abf4e7b973e76e035d3bfd7b9"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.6/txtx-linux-arm64.tar.gz"
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