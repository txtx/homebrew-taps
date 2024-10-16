class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.13/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "aa589b1e4d3ed926da56dc1b3697fff18f9802e29150506005dbe98e3f8a7f2d"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.13/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "1979e1e4f280cc991fd4e8fd6ddba50c2802cd88d71c99c5a2f3a1f2fbbc0aa3"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.13/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "7f998651bce09276b9a53695c15c0ef9c92ca2a20f151bf0fb9afc036a564927"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.13/txtx-linux-arm64.tar.gz"
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