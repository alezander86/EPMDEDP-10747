Create a Dockerfile according to the following requirements:

* as a basic image use epamedp/edp-jenkins-base-agent:1.0.26
* update kubectl to the latest stable version
* install helm 3
* install helm-push plugin
* install hadolint
* install tfenv

# docker run --rm -i hadolint/hadolint < Dockerfile | tee hadolint_lint.txt