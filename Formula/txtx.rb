class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.5.1/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "fb4a94106c9b5b319ca38c9d03e425f5111aa945fc22f5deb4381aa5e87b778e"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.5.1/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "04dcba2cce0b5037e5872f475067bfc5e2df0e7dc2a3fb29fd45436883cba652"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.5.1/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "b20734c5e0f18bde9380b1b545c8a589d131da93ce30cecb13abb8de452e4f6c"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.5.1/txtx-linux-arm64.tar.gz"
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