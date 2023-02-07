/* Alta3 Research | rzfeeser@alta3.com
   Packer - Example template using HCL to build an Ubuntu Docker image */


/* Packer Block - Contains Packer settings, including Packer version
                  as well as the required plugins. Anyone can write a plugin (GoLang)
                  Alta3 Research has an introduction to GoLang course (5 days) */
packer {
  required_plugins {
    // The Docker Builder (plugin) - built, maintained, and distributed by HashiCorp
    docker = {
      version = ">= 0.0.7"
      // only necessary when requiring a plugin outside the HashiCorp domain
      source = "github.com/hashicorp/docker"
    }
  }
}


/* Source Block - Configures the builder plugin, which is invoked by the Build Block. In the following example,
                  the Builder TYPE is "docker", and the Builder NAME is "ubuntu". */
// source "TYPE" "NAME"
source "docker" "ubuntu" {
  image  = "ubuntu:xenial" //
  commit = true
}


/* Build Block - This is what to do with the Docker container after it launches. In more detailed examples, we can use the Provision Block and Post-Process Block to add additional provisioning steps. */
build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu" // matches source "docker" "ubuntu" {}
  ]
}

