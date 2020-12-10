#!/bin/bash
declare -r DOTFILES_UTILS_URL="https://github.com/GeeksHubsAcademy/dotfilegeeks/blob/master/utils.sh"

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



download() {

    local url="$1"
    local output="$2"

    #if command -v "curl" &> /dev/null; then

    #    curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

     #   return $?

    #elif command -v "wget" &> /dev/null; then

        wget -qO "$output" "$url" 
        #     │└─ write output to file
        #     └─ don't show output

        return $?
    #fi

    #return 1

}
download_utils() {
    echo "Descargando utils ->" "$DOTFILES_UTILS_URL"
    download "$DOTFILES_UTILS_URL" "/home" 
    return 1

}




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
        echo "localizado"
        . $(dirname "$0")/utils.sh || exit 1
    else
        echo "no localizado"
        download_utils || exit 1
    fi

    e_header "Iniciando Instalación" || exit 1
    local os_name="$(get_os)"
     verify_os \
        || exit 1

}

main "$0"
 