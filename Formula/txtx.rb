class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.6/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "69f8c494cec9a3716a97ff840c1e21078b3b5b0aba1bebf5d47998019f36f2cf"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.6/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "36f474ad679ae1ce7ff180ef8879cdf6cafdbf7b659457bac6c331ca092a2cf8"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.6/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "9534dd0a8d1eecf2864149e91ec0d895ec35ed4613be0fbf3460b2147c417446"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.6/txtx-linux-arm64.tar.gz"
        #     # sha for linux_arm64
        #     sha256 "SHA256_OF_LINUX_ARM64_BINARY"
        end
    end
  
    def install
        bin.install "txtx" => "txtx"
    end
    
    test do
      assert_match pipe_output("#{bin}/txtx --version", "n\n"), "txtx-cli"
    end
  end