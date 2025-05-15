class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.18/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "23eeaf6aaf7720d7ae1f7d209b16b3d5bc27d9752db3de36304f734addff5025"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.18/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "06591376bcbaebf57803d5906c9e311dbf5056329e567590c6828bb5a27f8a49"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.18/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "db7898497a1b9e5c85cb63a956b582d9d9a6e355965ae636abcf8d0177ab49de"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.18/txtx-linux-arm64.tar.gz"
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