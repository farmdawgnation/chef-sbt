#
# Cookbook Name:: chef-sbt
# Recipe:: default
#
# Copyright 2013 Matt Farmer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file "/usr/local/bin/sbt-launch.jar" do
  source "http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/#{node[:sbt][:version]}/sbt-launch.jar"
  action :create

  not_if "java -jar /usr/local/bin/sbt-launch.jar \"sbt-version\" | tail -1 | awk '{print $2}' | grep '#{node[:sbt][:version]}'"
end

execute "sudo chown root:root /usr/local/bin/sbt-launch.jar"
execute "sudo chmod 0755 /usr/local/bin/sbt-launch.jar"

template "/usr/local/bin/sbt" do
  source "sbt.erb"
  variables({
    :java_options => node[:sbt][:java_options]
  })

  action :create

  owner "root"
  group "root"
  mode 0755
end
