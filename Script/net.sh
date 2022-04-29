#!/bin/bash
set -xe
function net_default_iface {
 sudo ip -4 route list 0/0 | awk '{ print $5; exit }'
}
cat > /opt/openstack-helm-infra/tools/gate/devel/multinode-vars.yaml <<EOF
kubernetes_network_default_device: $(net_default_iface)
EOF