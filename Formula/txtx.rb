class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.0.1-beta.0/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "b56ac066af6cde1e046efaefd3a52a14122ac74a88dc60000acbf1ea4ccbf3c9"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.0.1-beta.0/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "0bf12718d9d2adba3b0b4e967b4b531b4f011eb09afe4f36bbd93f3aae618705"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.0.1-beta.0/txtx-linux-x64-glibc.tar.gz"
            # sha for linux_x64
            sha256 "eb7ecf4602269c822da1274bbf4b0e785757fe7c8e67c41b79d831cb1b4accbe"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.0.1-beta.0/txtx-linux-arm64.tar.gz"
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