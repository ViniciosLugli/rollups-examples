
variable "TAG" {
  default = "devel"
}

variable "DOCKER_ORGANIZATION" {
  default = "cartesi"
}

target "dapp" {
  # default context is "."
  # default dockerfile is "Dockerfile"
}

target "server" {
  tags = ["${DOCKER_ORGANIZATION}/dapp:echo-ts-${TAG}-server"]
}

target "console" {
  tags = ["${DOCKER_ORGANIZATION}/dapp:echo-ts-${TAG}-console"]
}

target "machine" {
  tags = ["${DOCKER_ORGANIZATION}/dapp:echo-ts-${TAG}-machine"]
}
