# ============LICENSE_START======================================================= 
# org.onap.vvp/gitlab
# ===================================================================
# Copyright © 2017 AT&T Intellectual Property. All rights reserved.
# ===================================================================
#
# Unless otherwise specified, all software contained herein is licensed
# under the Apache License, Version 2.0 (the “License”);
# you may not use this software except in compliance with the License.
# You may obtain a copy of the License at
#
#             http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
#
# Unless otherwise specified, all documentation contained herein is licensed
# under the Creative Commons License, Attribution 4.0 Intl. (the “License”);
# you may not use this documentation except in compliance with the License.
# You may obtain a copy of the License at
#
#             https://creativecommons.org/licenses/by/4.0/
#
# Unless required by applicable law or agreed to in writing, documentation
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ============LICENSE_END============================================
#
# ECOMP is a trademark and service mark of AT&T Intellectual Property.
# Docker options
## Prevent Postgres from trying to allocate 25% of total memory
#
postgresql['shared_buffers'] = '1MB'
gitlab_rails['gitlab_email_enabled'] = false
# Manage accounts with docker
manage_accounts['enable'] = false
# Get hostname from shell
external_url ENV.fetch('EXTERNAL_URL', 'https://development.d2ice.att.io')
# Load custom config from environemt variable: GITLAB_OMNIBUS_CONFIG
# Load configuration stored in /etc/gitlab/gitlab.rb
gitlab_rails['rate_limit_requests_per_period'] = 50
gitlab_workhorse['api_limit'] = 0
gitlab_rails['rate_limit_period'] = 60
unicorn['worker_processes'] = 4
unicorn['worker_timeout'] = 120
nginx['worker_processes'] = 4
from_file("/etc/gitlab/gitlab.rb")
