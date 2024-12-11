# swift-heath-exporter packaged for OpenStack Kolla

[swift-health-exporter](https://github.com/sapcc/swift-health-exporter) packaged for [OpenStack Kolla](https://docs.openstack.org/kolla/latest/index.html).

## Build

### Development

Prepare image:
```sh
podman build -t swift-health-exporter .
```

### GitHub Workflow

![build-images](https://github.com/nimbolus/openstack-kolla-swift-health-exporter/actions/workflows/build.yml/badge.svg)

Go to [Actions](https://github.com/nimbolus/openstack-kolla-swift-health-exporter/actions/workflows/build.yml) and click on `Run workflow`.

Images are pushed to [quay.io/nimbolus/openstack-kolla-swift-health-exporter](https://quay.io/organization/nimbolus/openstack-kolla-swift-health-exporter).
