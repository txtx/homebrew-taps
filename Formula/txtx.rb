class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.4.2/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "4d0ac920a20dbd995c563ddf552959e6494844d75960f774b252d963765472a9"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.4.2/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "e3860c293f2e99d089abe7dae0758e84f361579593451f5cefabedb15e12422f"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.4.2/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "f385d64ef20c3568e1e62cd8f3b29dd68a11bd7aa143f86a5eec20d299601214"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.4.2/txtx-linux-arm64.tar.gz"
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