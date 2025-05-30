class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.5.0/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 ""
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.5.0/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "52dac178e844df0e2ce726c337fdbaba09a730d97d5979e9c1487a9397523083"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.5.0/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "07a5dc1b3d1bf61f0c33bc86ef6d49b37efbfb077a9c974668334a77a93f869e"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.5.0/surfpool-linux-arm64.tar.gz"
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
