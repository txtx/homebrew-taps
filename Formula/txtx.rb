class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.0/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "f3b1ae336800ed4cb1a6f093235911f665addac1db83d61b9adc88c10038db87"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.0/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "615917521ff9b6febb735313aed0c3c3f1a0f98a58765f2dfd09d6aa21f9dfb6"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.0/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "d9d3488ac3358075296a4f895b0d5b2a721edb8840b601c48d82c6ad4b780284"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.0/txtx-linux-arm64.tar.gz"
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