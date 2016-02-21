require 'spec_helper'

sbt = `which sbt`.strip
sbt_jar = `which sbt-launch.jar`.strip

describe command("java -jar #{sbt_jar} \"sbt-version\" | tail -1 | awk \'{print $2}\' | grep 0.13.8") do
  its(:stdout) { should contain('0.13.8') }
  its(:exit_status) { should eq 0 }
end

describe file("#{sbt}") do
	it { should contain 'sbt-launch.jar'}
end

describe file("#{sbt_jar}") do
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
	it { should be_mode 755 }
end
