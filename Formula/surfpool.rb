class Surfpool < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/surfpool"
    license "Apache-2.0"
    head "https://github.com/txtx/surfpool.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/surfpool/releases/download/v0.10.9/surfpool-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "57e9e90978c7ca4feb97797b68ce332bc7ee19821b9dedba383e6830da2591fd"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.9/surfpool-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "53741bcc4d6978d894ca7dd2ca61e922edeaad7b7ed263017e3392945ec23885"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/surfpool/releases/download/v0.10.9/surfpool-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "79e960722d1ce6bd86c689be287e00f29c3a9ac67af0591bc7eb7bc95f736fb3"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/surfpool/releases/download/v0.10.9/surfpool-linux-arm64.tar.gz"
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
