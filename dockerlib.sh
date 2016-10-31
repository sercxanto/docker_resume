# Checks if a docker image is installed in the system
#
# Returns 0 if installed, 1 if not installed
#
# Usage: is_image_installed repo tag 
is_docker_image_installed()
{
    local _repo=$1
    local _tag=$2
    
    local _shell_options=$-
    set +e
    local _imagename=$(docker images ${_repo} | grep $_tag)
    # Restore -e
    set -$_shell_options
    if [ -z "$_imagename" ]; then
        return 1
    else
        return 0
    fi
}

