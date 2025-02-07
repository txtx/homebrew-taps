class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.5/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "8252e906beab8583efd7b970612121e4d897bf4d91db90586b8a984befa343eb"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.5/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "fdac835228c118170e6aed9cd01090bbd939e6a60b13a82cd1dbaf65235003af"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.5/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "3a580fd390fabb731ebd2b2dd58747dfaa11eb39808fa4c62e5090744c5c8d15"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.5/surfpool-linux-arm64.tar.gz"
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
