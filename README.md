# Ansible AWX CLI container

## Table of contents

- [What is it?](#what-is-it)
- [Versioning](#versioning)
- [Running the container](#running-the-container)
- [Continuous integration](#continuous-integration)
  - [Azure DevOps](#azure-devops)
- [Please contribute!](#please-contribute)

---

<a name="what-is-it"></a>

## What is it?

This repository contains the CLI for Ansible AWX / Tower, made easily available in a container image.

The container image can be found on the [Docker Hub](https://hub.docker.com/r/ppodgorsek/ansible-awx-cli).

<a name="versioning"></a>

## Versioning

The versioning of this project follows the one of the official [awxkit library](https://pypi.org/project/awxkit/).

<a name="running-the-container"></a>

## Running the container

This container can be run using the following command:

    docker run --rm \
      -t docker.io/ppodgorsek/ansible-awx-cli:latest \
      awx {{ CLI arguments }}

For example, triggering a job template can be done as follows:

    docker run --rm \
      -t docker.io/ppodgorsek/ansible-awx-cli:latest \
      awx job_templates launch 'Job name CHANGEME' --conf.host='https://changeme' --conf.token='changeme' --filter=status --monitor -f human

All official AWX CLI arguments can be used. The complete list can be found in [AWX CLI's official documentation](https://docs.ansible.com/ansible-tower/latest/html/towercli/reference.html).

<a name="continuous-integration"></a>

## Continuous integration

<a name="azure-devops"></a>

### Azure DevOps

It is possible to run the project within an Azure DevOps pipeline by relying on a simple script, as [the `Docker@2` task](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/docker-v2) currently only allows to build and push images:

    - script: |
        docker run --rm -t docker.io/ppodgorsek/ansible-awx-cli:latest awx {{ CLI arguments }}
      displayName: Ansible AWX

<a name="please-contribute"></a>

## Please contribute!

Have you found an issue? Do you have an idea for an improvement? Feel free to contribute by submitting it on [the GitHub project](https://github.com/ppodgorsek/ansible-awx-cli/issues).
