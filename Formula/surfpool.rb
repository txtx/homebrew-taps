class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.9/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "6752df9f87c0e8f3ec0533d720b47b2ac92aa9ee4c11f1e2c32cf3102a2a1473"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.9/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "fb2cb93960cd55bf39067a661479f376c1fd1cc5c9ae5272c5bafeb793b5b623"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.9/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "be8b212669bded3ab1431e817bdf897ec3f99d7a85acd2f6ae32fc45ea72c19a"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.9/surfpool-linux-arm64.tar.gz"
        #     # sha for linux_arm64
        #     sha256 "SHA256_OF_LINUX_ARM64_BINARY"
        end
    end
  
    def install
        bin.install "surfpool" => "surfpool"
    end
    
    test do
      assert_match pipe_output("#{bin}/surfpool --version", "n\n"), "surfpool-cli"
    end
  end
