class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.3.1/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "8cbfaf9f82eaa58cd3b253aa8eb65cc8a5c79e81a7ea39febf2bd17b8f940883"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.3.1/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "33e873d3503cce282d4964b28dfd531fb74651d87b16e08389a0969957f857a6"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.3.1/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "90f0e344e75d805240fcb217cdca50b92d71109078778869d7923fa3f1a7e13d"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.3.1/txtx-linux-arm64.tar.gz"
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