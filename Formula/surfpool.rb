class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.12.0/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "612cfd34eb5b198d55a3194805bb45c561d0d983a33c2122adaf7c326ae7c53a"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.12.0/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "b122e5f42429090652c4f12b2b679b2484ef92a75369443c77f9529d1e300a7b"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.12.0/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "5b39cf5374ce29ac0476181cb910d666a0e1c638f7ea5905cc94965a120064de"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.12.0/surfpool-linux-arm64.tar.gz"
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
