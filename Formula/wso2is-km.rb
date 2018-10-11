class Wso2isKm < Formula
  desc "WSO2 Identity Server as a Key Manager 5.7.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-km-5.7.0.zip"
  sha256 "52f70ff6b97bdf56cea2b1e4bd591d84ffeb12b80ff0b4236e7d3776cf9fda13"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2is-km"
    version = "5.7.0"

    puts "Installing WSO2 Server as a Key Manager #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Server as a Key Manager #{version}."
    puts "\ncheers!!"
  end
end
