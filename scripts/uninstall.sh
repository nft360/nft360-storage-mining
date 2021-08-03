#!/bin/bash

uninstall()
{
	if [ -f /usr/bin/nft360 ]; then
		batch_exec exec_docker_rm
		batch_exec exec_docker_rmi
		local chain_data_dir=$(cat $installdir/config.json | jq -r '.chain_data_dir')
		[ -d "$chain_data_dir" ] && rm -r $chain_data_dir
		local teaclave_data_dir=$(cat $installdir/config.json | jq -r '.teaclave_data_dir')
		[ -d "$teaclave_data_dir" ] && rm -r $teaclave_data_dir
		local ipfs_data_dir=$(cat $installdir/config.json | jq -r '.ipfs_data_dir')
		[ -d "$ipfs_data_dir" ] && rm -r $ipfs_data_dir
		rm /usr/bin/nft360
	fi

	rm -rf $installdir

	log_success "---------------Uninstall nft360 node sucess---------------"
}

