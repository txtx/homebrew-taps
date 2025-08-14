class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.10.3/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 ""
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.3/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "91e31d59160e7dca0173cea999b7615f1dba115eaaabf8f822bfa9ac8dead99e"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.3/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "612e1f0115d02faf7ebaae12def91be56a0a0c006ea42d04f86e73e74def9aa1"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.10.3/surfpool-linux-arm64.tar.gz"
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
