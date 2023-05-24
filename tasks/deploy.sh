#!/bin/sh

# Puppet Task Name: deploy
#
# This is where you put the shell code for your task.
#
# You can write Puppet tasks in any language you want and it's easy to
# adapt an existing Python, PowerShell, Ruby, etc. script. Learn more at:
# https://puppet.com/docs/bolt/0.x/writing_tasks.html
#
# Puppet tasks make it easy for you to enable others to use your script. Tasks
# describe what it does, explains parameters and which are required or optional,
# as well as validates parameter type. For examples, if parameter "instances"
# must be an integer and the optional "datacenter" parameter must be one of
# portland, sydney, belfast or singapore then the .json file
# would include:
#   "parameters": {
#     "instances": {
#       "description": "Number of instances to create",
#       "type": "Integer"
#     },
#     "datacenter": {
#       "description": "Datacenter where instances will be created",
#       "type": "Enum[portland, sydney, belfast, singapore]"
#     }
#   }
# Learn more at: https://puppet.com/docs/bolt/0.x/writing_tasks.html#ariaid-title11
#

plan mkcustomfact::deploy (
  String $environment,
) {
  # r10k corrects invalid branches names
  $_environment = regsubst($environment, '\W', '_', 'G')

  # first we figure out Puppet CM
  $query_results = puppetdb_query('resources[certname] { type = "Class" and title = "Puppet_enterprise::Master::Code_manager" }')
  unless $query_results.length == 1 {
    fail("Failed to determine CodeManager: ${query_results}")
  }
  $puppet_cm = $query_results[0]['certname']

  $result = run_task('mkcustomfact::deploy', $puppet_cm,
    environment => $_environment,
  )

  return $result
}
