SERVER_IP="$1"
CLIENT_TOKEN="$2"

NOMAD_UNINSTALL="https://raw.githubusercontent.com/Quok-it/Nomad-daemonized/refs/heads/main/uninstall.sh"
NOMAD_INSTALL="https://raw.githubusercontent.com/Quok-it/Nomad-daemonized/refs/heads/main/install.sh"
NETBIRD_UNINSTALL="https://raw.githubusercontent.com/Quok-it/netbirdDaemonized/refs/heads/main/uninstall.sh"
NETBIRD_INSTALL="https://raw.githubusercontent.com/Quok-it/netbirdDaemonized/refs/heads/main/install.sh"

#uninstall first, install after. Ensure perfection

download_and_run() {
  local url="$1"
  shift
  local params="$@"
  local temp_script
  temp_script=$(mktemp) || { echo "Failed to create temporary file."; exit 1; }

  # Download the script
  if ! curl -fsSL "$url" -o "$temp_script"; then
    echo "Error: Failed to download script from $url" >&2
    rm -f "$temp_script"
    exit 1
  fi

  # Execute the script
  bash "$temp_script" $params

  # Clean up
  rm -f "$temp_script"
}

# Uninstall netbird
echo "Uninstalling netbird..."
download_and_run "$NETBIRD_UNINSTALL"

# Uninstall nomad
echo "Uninstalling nomad..."
download_and_run "$NOMAD_UNINSTALL"

# Install netbird
echo "Installing netbird..."
download_and_run "$NETBIRD_INSTALL" "$CLIENT_TOKEN"

# Install nomad
echo "Installing nomad..."
download_and_run "$NOMAD_INSTALL" "$SERVER_IP"

# On success, welcome message

echo "
                                                .:=.
                                                :-*#+
                                                *-===.
                            :#%*:....=%#:.     .=   :=+
                        .=#:              =%%*.  -*.  -:
                        :#                   .   .:=-*:*.
                    .*:..                :*: :*=#
                    :=:+@*=      -:.+--===@*:%%#*:
                    .=-%@@%=*=.   =:%@%%%%@@@*:*=
                ---#%- .-=*=   +=%:       .+=-
                .*.=**.    -:  .*+#:         =@-
            .+:.+==     :-. *@*+-
=#:........**  .*= :%@%:- .=:=%:
    :#%%*=:..=#-   -*+:.*=.
                :-=-
                --=-
                -:*:
                =%#.
            :@@+.
                        
##########################################################
###############   WELCOME TO THE BUSH!!!   ###############
##########################################################
"
