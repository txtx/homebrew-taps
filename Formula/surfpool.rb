class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.12/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "3243432780992c988a943667d65b7e0b43baea32fcf2069cdafc979fc7397924"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.12/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "7944b4f6c0ade87387cc4d891a378e50b63cff2431bfd92e55e23540c61d3582"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.12/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "d00004a25994a51ffbd182aedd7e2db7ae3692699f8d3c00e271b963cd495e78"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.12/surfpool-linux-arm64.tar.gz"
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
