name              'chef-sbt'
maintainer        'Matt Farmer'
maintainer_email  'matt@frmr.me'
license           'Apache 2.0'
description       'Installs the sbt version you request from manual download.'
version            '0.0.1'

recipe 'sbt', 'Downloads and installs sbt in your path.'

%w{ubuntu debian}.each do |os|
  supports os
end

attribute 'sbt',
  :display_name => 'SBT',
  :description => 'Hash of SBT attributes',
  :type => 'hash'

attribute 'sbt/version',
  :display_name => 'SBT Version',
  :description => 'The version of SBT to install',
  :type => 'string',
  :default => '0.12.4'

attribute 'sbt/java_options',
  :display_name => 'SBT Java Options',
  :description => 'Java options passed to the JVM running SBT.',
  :type => 'string',
  :default => '-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M'
