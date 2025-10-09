class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.5.2/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "8940051f3d8b77611dd25b33fb0bf8b1d5bd974a000168719dae7155ea1629aa"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.5.2/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "1e367b29e7fe54ca1ed65e10d1914ef8d467c63bd93794fcc0997438bbad386f"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.5.2/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "a3b54564e7291e2398c8766d22d9c38768cdf2db508ad38d84f46bfe19490d28"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.5.2/txtx-linux-arm64.tar.gz"
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