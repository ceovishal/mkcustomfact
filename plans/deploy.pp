# Plan to deploy a code environment
# @param environment - environment to deploy
plan bna::deploy (
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

  $result = run_task('bna::deploy', $puppet_cm,
    environment => $_environment,
  )

  return $result
}
