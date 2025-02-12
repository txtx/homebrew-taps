class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.7/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "feb2204ee0d5dd3ff169ba953299a3fe7d3345b55332c21b473730ba0679de13"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.7/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "c58aa84b09502064781d33cb609def01f73b4f080f7db915e06831e74db6b704"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.7/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "f75fcbc243287d36c4f7fba6b6f8b87b814f8d7f887285c3b3cbefd0877bdeb9"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.7/surfpool-linux-arm64.tar.gz"
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
