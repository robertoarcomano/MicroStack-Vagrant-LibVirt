#!/usr/bin/env bats
@test "Instance Creation" {
  # 1. Load Environment variables to connect to Microstack
  source ./microstack.rc

  # 1 Download Centos 7 image in qcow2 format
  wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2

  # 2. Add Centos image to Microstack
  openstack image create --disk-format qcow2 --container-format bare --public --file ./CentOS-7-x86_64-GenericCloud.qcow2 centos7-image

  # 3. Create a new security group
  openstack security group create newgroup

  # 4. Launch instance
  openstack server create \
    --flavor m1.small \
    --image centos7-image \
    --nic net-id=test \
    --security-group newgroup \
    --key-name microstack myinstance

  # 4bis Wait for 1 minute
  sleep 60

  # 5. Check instance is running
  VALUE=`openstack server show myinstance|grep status|sed -r "s/\|//g"|awk '{print $2}'`
  [ "$VALUE" = "ACTIVE" ]
}