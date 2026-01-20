class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "83e1fd4508c293a02f2def3afd54bc77eb2ea62f8d1c6eee5ff1a2d8b735e356"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "8859290b4075784a2c3cebd997df7cf73a45bb33760f59908c296732ea1cd18d"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "20ff0202cbc69b5b191888ab3bc0b5d32a9d9dfadf5fb8393066e7ccc471e3ca"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v1.0.0/surfpool-linux-arm64.tar.gz"
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
