#!/bin/bash


 echo '
 ______  _______  _______  _        _______ 
(  ____ \(  ____ \(  ____ \| \    /\(  ____ \
| (    \/| (    \/| (    \/|  \  / /| (    \/
| |      | (__    | (__    |  (_/ / | (_____ 
| | ____ |  __)   |  __)   |   _ (  (_____  )
| | \_  )| (      | (      |  ( \ \       ) |
| (___) || (____/\| (____/\|  /  \ \/\____) |
(_______)(_______/(_______/|_/    \/\_______)
 '                                                                                                                                                             




verify_os()
{
    local os_name="$(get_os)"
    local os_version = "$(get_os_version)"
    e_header "$os_name" "-->" "$os_version"
}


main() 
{
   
 

    # Ensure that the following actions
    # are made relative to this file's path.

    echo "Archivo " $(dirname $(readlink -f $0))
    
    if  [ -x "utils.sh" ]; then
        . $(dirname "$0")/utils.sh || exit 1
    fi

    e_header "Iniciando Instalación" || exit 1
    local os_name="$(get_os)"
     verify_os \
        || exit 1

}

main "$0"
 