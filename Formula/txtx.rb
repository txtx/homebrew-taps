class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.9/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "941b19ebfc332038db2d42d361028b6dfe0e90172e69669718ff454707de78cf"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.9/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "51a3ed7163ff7ca56dfd8211fec4185bbcd2512fb11f8cf624992e4777d5f216"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.9/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "540a3ee218bc7f91a190cb293f19abb1413ddd9465b3593e5f109ee12350bc32"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.9/txtx-linux-arm64.tar.gz"
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