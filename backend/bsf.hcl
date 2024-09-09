
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "python3@3.12.2", "poetry@1.8.2"]
  runtime     = ["cacert@3.95"]
}

oci "pkgs" {
  name          = "m1xxos/todo-backend-base"
  layers        = ["split(packages.runtime)", "split(packages.dev)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
