# openstack-kolla-swift-health-exporter

[swift-health-exporter](https://github.com/sapcc/swift-health-exporter) packaged for [OpenStack Kolla](https://docs.openstack.org/kolla/latest/index.html).

## Install

The swift-health-exporter can be installed alongside any swift-proxy-server container using the [Ansible role](./ansible-role/). An integration into HAProxy is not implemented yet, so running and scraping multiple instances of the exporter will result in metric data duplication.

An example playbook could look like this:
```yaml
- name: Install swift-health-exporter
  hosts: monitoring
  become: true
  roles:
    - role: swift-health-exporter
```

The long-term goal would be to integrate this into kolla-ansible, rather than deploying the exporter separately.

## Build

### Development

Build image:
```sh
podman build -t swift-health-exporter .
```

### GitHub Workflow

![build-images](https://github.com/nimbolus/openstack-kolla-swift-health-exporter/actions/workflows/build.yml/badge.svg)

Go to [Actions](https://github.com/nimbolus/openstack-kolla-swift-health-exporter/actions/workflows/build.yml) and click on `Run workflow`.

Images are pushed to [quay.io/nimbolus/openstack-kolla-swift-health-exporter](https://quay.io/repository/nimbolus/openstack-kolla-swift-health-exporter).
