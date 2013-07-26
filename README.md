## About

This project, **chef-sbt**, is a Chef Cookbook for SBT that downloads the sbt-launch.jar file directly from scala-sbt.org, and
configures it in your path manually. This tends to be preferable if you, like me, have come to
grow impatient with waiting for package managers to update their versions or would prefer to
manually control when your boxes move to a different version.

I've only enumerated support for Ubuntu and Debian in this cookbook, but it may work elsewhere
as well. Haven't done a lot of testing yet.

### Attributes

The chef-sbt cookbook recognizes the following attributes.

* `node['sbt']['version']` - The version of the sbt launcher you would like to use. Currently, this defaults to 0.12.4, the latest stable, but can be any version available in the [typesafe download repo](http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/).
* `node['sbt']['java_options']` - The JVM flags that should be passed to the JVM when sbt starts. Currently, this is defaulted to `-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M`, and that works well for me... but YMMV.

### Recipes

* **default** - This recipe will download the sbt-launch.jar of the version you specify to `/usr/local/bin`, create an executable script `sbt` in that same folder, set permissions on them, and make them owned by root.

### License / Contributions

This project is licensed under the Apache License 2.0. For details, see the LICENSE file at the top of this repository.
If you discover issues, I encourage you to open tickets on the GitHub issue tracker. Contributations are welcome from
all, but please adhere to code style and open a ticket before proceeding with your work.

## About the Author

My name is **Matt Farmer**. I'm a code bandit current slinging code on behalf of [Elemica](http://elemica.com), [Anchor Tab](http://anchortab.com), the [Lift Framework](http://liftweb.net), and a few other small outfits who are out to make the world a better place. I [tweet](http://twitter.com/farmdawgnation) regularly, and [blog](http://farmdawgnation.com) and little bit less so.
