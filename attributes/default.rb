#
# Cookbook Name:: chef-sbt
# Attribute File:: default
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

default['sbt']['version'] = '0.13.8'
default['sbt']['java_options'] = '-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M'
default['sbt']['java_cookbook'] = 'openjdk'

case node['platform']
when 'smartos'
  default['sbt']['path'] = '/opt/local'
when 'ubuntu'
	default['sbt']['path'] = '/usr/local'
end
