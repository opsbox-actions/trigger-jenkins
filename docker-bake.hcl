variable "VERSION" {
  default = "main"
}

variable "FIXID" {
  default = "1"
}

group "default" {
  targets = ["trigger-jenkins"]
}

target "trigger-jenkins" {
    labels = {
        "cloud.opsbox.author" = "seanly"
        "cloud.opsbox.image.name" = "trigger-jenkins"
        "cloud.opsbox.image.version" = "${VERSION}"
        "cloud.opsbox.image.fixid" = "${FIXID}"
    }
    dockerfile = "Dockerfile"
    context  = "./"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["seanly/toolset:trigger-jenkins-${VERSION}-${FIXID}"]
    output = ["type=image,push=true"]
}
