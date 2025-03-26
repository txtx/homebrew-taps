class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.10/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "3cfeeb8a04781bba7e54db2198b50af1a3ab41a7f5ef2f084aecb5bdb3da169e"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.10/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "9957a02dfa08d331a8d541969af275e2233356dad210b400416dd00be1ab551a"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.10/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "42d2d34d5dc7205fafb05c3ad9b3238a53e43b9ff93a551e81c9358f539e5311"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.10/surfpool-linux-arm64.tar.gz"
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
