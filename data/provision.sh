#!/bin/bash

yum update
yum upgrade -y

mkdir -p /app/gitlab && cd /app/gitlab
wget --content-disposition https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/6/gitlab-ce-12.5.3-ce.0.el6.x86_64.rpm/download.rpm > /dev/null
rpm -i /app/gitlab/gitlab-ce-12.5.3-ce.0.el6.x86_64.rpm