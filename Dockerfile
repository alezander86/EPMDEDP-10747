FROM epamedp/edp-jenkins-base-agent:1.0.26
USER root
ENV latest_kubectl=1.25.2
ENV helm_version=3.10.0
ENV hadolint_version=2.10.0
#Updating kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${latest_kubectl}/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& mv ./kubectl /usr/local/bin/kubectl
#Installing helm
RUN curl -LO https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz \
&& tar -zxvf helm-v${helm_version}-linux-amd64.tar.gz \
&& mv linux-amd64/helm /usr/local/bin/helm
#Installing cm-push
RUN helm plugin install https://github.com/chartmuseum/helm-push
#Intalling hadolint 
RUN curl -LO https://github.com/hadolint/hadolint/releases/download/v${hadolint_version}/hadolint-Linux-x86_64 \
&& chmod +x ./hadolint-Linux-x86_64 \
&& chown jenkins hadolint-Linux-x86_64 \
&& mv hadolint-Linux-x86_64 /usr/local/bin/hadolint
#Installing tfenv
RUN git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv \
&& ln -s ~/.tfenv/bin/* /usr/local/bin
USER jenkins