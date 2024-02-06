{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "bw-launcher";

  runtimeInputs = [ pkgs.bemenu pkgs.jq pkgs.rbw ];

  text = ''
    set -euo pipefail
    IFS=$'\n\t'
# Creator: Robert Buchberger <robert@buchberger.cc>
#                            @robert@spacey.space
#
# Select an item from bitwarden with wofi, return value for passed query
# Dependencies: rbw installed and configured
#
# Usage: rbw-menu [query]
#   query: "code" or anything on the login object; username, password, totp, etc
#     - code will return a TOTP code
#     - anything else will return the value of the query
#   default: username

    rbw unlocked &> /dev/null || rbw unlock

    query=''${1:-username}

    chosen_item=$(
      # If RBW_MENU_COMMAND is set, use it to filter the list.
      if declare -p RBW_MENU_COMMAND >&/dev/null; then
        eval "rbw list | $RBW_MENU_COMMAND"
      else # use wofi
        rbw list | bemenu -i --prompt "$query"
      fi
    )

# Exit if user didn't select anything
    declare -p chosen_item >&/dev/null || exit 1

    case "$query" in
    code)
      rbw code "$chosen_item"
      ;;
    *)
      # Select chosen item from vault, return login.query
      rbw get "$chosen_item" --raw | jq --join-output ".data.$query"
      ;;
    esac
  '';
}
