class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.4/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "b8a0d1bad82e830487483c4784cab48e588eb8d856014373cfd5f7ca2271f8c6"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.4/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "904ae72fa87714a471002ec3ff7b630cdc1358652def627f6e5fc70b58d6d5f4"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.4/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "963c6a653df54fd9da76cfe77de6af7b803fd195884213e3774b32495c487361"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.4/txtx-linux-arm64.tar.gz"
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