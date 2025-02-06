class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.1.3/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "948f698fb770023f04a398e8bfc999c3cd7bb19308d47c1cf1f6724c369cb02b"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.3/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "a753437acbcfcdab95b8842eb36646aae36904a00208c981e4a09b976953cfab"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.1.3/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "768b44df9fbf0df62eca186fe2fbb1087fdb91197d0f4889f19538f81f3f524d"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.1.3/surfpool-linux-arm64.tar.gz"
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
