class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.14/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "52d7114d33f850552ab5154fedc50d2bba7c62470b2721942e814dd0b85b06c7"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.14/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "25bceee7633553493e24a7938ff6e15e912c54770c811c36f656bb742a20ff5d"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.14/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 ""
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.14/txtx-linux-arm64.tar.gz"
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