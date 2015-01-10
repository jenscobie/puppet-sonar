class sonar($version) {

  $temp_dir = '/tmp'
  $distribution = "sonarqube-$version"
  $target_dir = '/usr/local'
  $actual_dir = "$target_dir/$distribution"
  $linked_dir = "/Library/sonar"
  $archive = "$distribution.zip"
  $download_url = "http://dist.sonar.codehaus.org/sonarqube-$version.zip"

  file { "$target_dir":
    ensure => "directory",
    recurse => true,
    notify => Exec['download-sonar']
  }

  exec { "download-sonar":
    command => "wget -q --timestamping -P $temp_dir $download_url",
    creates => "$temp_dir/$archive",
    notify => Exec['unpack-archive']
  }

  exec { 'unpack-archive':
    command => "cd $target_dir ; unzip $archive",
    creates => "$actual_dir/bin",
    notify => File["$linked_dir"]
  }

  file { "$linked_dir":
    ensure => 'link',
    target => "$actual_dir",
  }
}