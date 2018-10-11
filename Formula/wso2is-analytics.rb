class Wso2isAnalytics < Formula
  desc "WSO2 Identity Server Analytics 5.7.0"
  homepage "https://wso2.com/identity-and-access-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-analytics-5.7.0.zip"
  sha256 "74dff66b9d5474b95758ce799d3894eb32923269b2031da2342e581aff9620f5"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2is-analytics"
    version = "5.7.0"
    profiles = %w[dashboard worker manager]

    puts "Installing WSO2 Indentity Server Analytics #{version}..."
    profiles.each do |profile|
      bin.install "bin/#{product}-#{version}-#{profile}" => "#{product}-#{version}-#{profile}"
    end

    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun the following commands to start each profile of the WSO2 Indentity Server Analytics #{version}.\n"
    profiles.each do |profile|
      puts "\t#{profile}".ljust(21) + ": #{product}-#{version}-#{profile}"
    end
    puts "\ncheers!!"
  end
end
