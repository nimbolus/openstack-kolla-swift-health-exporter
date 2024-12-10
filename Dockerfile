ARG OPENSTACK_BASE_IMAGE="quay.io/openstack.kolla/swift-base"
ARG OPENSTACK_BASE_IMAGE_TAG="2024.1-rocky-9"
ARG SWIFT_HEALTH_EXPORTER_VERSION="v1.0.2"

FROM docker.io/golang:1.23 AS builder

ARG SWIFT_HEALTH_EXPORTER_VERSION

RUN git clone -b $SWIFT_HEALTH_EXPORTER_VERSION https://github.com/sapcc/swift-health-exporter.git /go/src/swift-health-exporter \
    && cd /go/src/swift-health-exporter \
    && make build/swift-health-exporter

FROM $OPENSTACK_BASE_IMAGE:$OPENSTACK_BASE_IMAGE_TAG

COPY --from=builder /go/src/swift-health-exporter/build/swift-health-exporter /usr/local/bin/swift-health-exporter

ARG SWIFT_HEALTH_EXPORTER_VERSION

LABEL maintainer "nimbolus Team (https://github.com/nimbolus)"
LABEL org.opencontainers.image.description "swift-health-exporter ($SWIFT_HEALTH_EXPORTER_VERSION) packaged for OpenStack Kolla"

EXPOSE 9520/tcp
