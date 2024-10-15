class Txtx < Formula
    desc "CLI tool for managing contract deployments on any blockchain"
    homepage "https://github.com/txtx/txtx"
    license "Apache-2.0"
    head "https://github.com/txtx/txtx.git", branch: "main"

    on_macos do
        if Hardware::CPU.intel?            
            url "https://github.com/txtx/txtx/releases/download/v0.1.11/txtx-darwin-x64.tar.gz"
            # sha for macos_x64
            sha256 "c65ef6052d180c52671cb46085bf6b17363cbe0e7026c2d634af7a9c6ede6fc0"
        elsif Hardware::CPU.arm?
            url "https://github.com/txtx/txtx/releases/download/v0.1.11/txtx-darwin-arm64.tar.gz"
            # sha for macos_arm64
            sha256 "4191567c514f57c2b60d0989120939c51dc33de88cfa21774207d1296043dc24"
        end
    end

    on_linux do
        if Hardware::CPU.intel?
            url "https://github.com/txtx/txtx/releases/download/v0.1.11/txtx-linux-x64.tar.gz"
            # sha for linux_x64
            sha256 "ee619c573fc07857f2c7d8c4dde522877cc24953d86f34470c0c63b4ffdc5316"
        # elsif Hardware::CPU.arm?
        #     url "https://github.com/txtx/txtx/releases/download/v0.1.11/txtx-linux-arm64.tar.gz"
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