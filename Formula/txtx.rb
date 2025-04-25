class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.16/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "7818eb634d6d8e0f8b764a70845e6dbbbd463b35f4ee2924983dbd4f1d96b13b"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.16/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "8a8b0f62ba3e325fc71854cce8ed064d17c0bfd8ee54ba84e3b3e812d32b4c8f"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.16/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "c415c425ba773888d47ec0395dcc9d29e3c09d8a08b2a2abc0f58fb3a7e9c170"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.16/txtx-linux-arm64.tar.gz"
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