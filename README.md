# Sonar Puppet Module for Boxen

Installs the Sonar version of your choosing, as long as it
exists in the [archive](http://dist.sonar.codehaus.org/).

## Usage

```
class {'sonar':
    version => '4.1.2',
  }
```

## Required Puppet Modules

* `boxen`
* `stdlib`

## Development

Write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
