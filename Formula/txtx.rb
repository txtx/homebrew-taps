class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.5.0/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "149dd3b2528d1d6f76a750a197d23cacfb2232ad4db64496b11b5940b7b8a493"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.5.0/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "be9d17f54a0e2dd7123f84d30957d396f49a2ac26877a41c2c4ae7da4801d283"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.5.0/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "c6f28e4254fc53990dd1ad5fed60338f9d50f871b6431ee0ee59a2c8db91c1ac"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.5.0/txtx-linux-arm64.tar.gz"
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