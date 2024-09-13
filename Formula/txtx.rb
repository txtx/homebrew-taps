class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.5/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "bfb71d05553d88736cd2056560fb8335c49dc016eb7f629be2fae2fc70b72781"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.5/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "d7ad5d640990f4a256682b9dbd395b28de90ef7ae7ffba8eebe548bc36bf539d"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.5/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "7371d1ef62c3f8ded1cbca16ba33913196a3881c42bf11e13f89d0c5098179cb"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.5/txtx-linux-arm64.tar.gz"
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