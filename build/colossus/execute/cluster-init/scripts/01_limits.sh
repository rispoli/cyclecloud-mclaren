#!/bin/bash -x

#-- shouldn't need this anymore with new image.. but: 
#-- bugged this here: https://github.com/Azure/azhpc-images/issues/5

configure_system()
{
	# set limits for HPC apps
	cat << EOF >> /etc/security/limits.conf
*               hard    memlock         unlimited
*               soft    memlock         unlimited
*               hard    nofile          65535
*               soft    nofile          65535
*               hard    stack           unlimited
*               soft    stack           unlimited
EOF
}

configure_system_stack()
{
	# set limits for HPC apps
	cat << EOF >> /etc/security/limits.conf
*               hard    stack           unlimited
*               soft    stack           unlimited
EOF
}

configure_system_stack
