class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.2.8/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "6e52a4670a8fc48698c91a7fbc1cd95029490f3333fba6da0264258081838f62"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.2.8/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "7043eb0692a09da1424459bdebf38951dab45fdab0b1627a587af1926b881589"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.2.8/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "df9e1381b525e7c2742e1996d7098732860b5dda754321287f10a2e7a2b93b1d"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.2.8/txtx-linux-arm64.tar.gz"
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