FROM fedora:39

LABEL author        Paul Podgorsek
LABEL description   The CLI for Ansible AWX / Tower, made easily available in a container image.

ENV AWX_CLI_GID                   1000
ENV AWX_CLI_UID                   1000
ENV AWX_CLI_VIRTUAL_ENVIRONMENT   awxvenv
ENV AWX_CLI_WORK_DIR              /opt/awx-cli

ENV AWX_KIT_VERSION               23.8.0

# Python 3.9 is required because AWX needs distutils
RUN dnf upgrade -y \
  && dnf install -y python3.9 python3-pip \
  && dnf clean all

# Create directory for the work files
RUN mkdir ${AWX_CLI_WORK_DIR} \
  && chown ${AWX_CLI_UID}:${AWX_CLI_GID} ${AWX_CLI_WORK_DIR}

WORKDIR ${AWX_CLI_WORK_DIR}

USER ${AWX_CLI_UID}:${AWX_CLI_GID}

# Ansible AWX

RUN python3.9 -m venv ${AWX_CLI_VIRTUAL_ENVIRONMENT} \
  && source ${AWX_CLI_WORK_DIR}/${AWX_CLI_VIRTUAL_ENVIRONMENT}/bin/activate \
  && pip install awxkit==${AWX_KIT_VERSION}

COPY scripts/ansible-awx.sh /usr/bin/awx

CMD [ /usr/bin/awx ]
