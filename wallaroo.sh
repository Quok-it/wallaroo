

SERVER_IP="$1"
CLIENT_TOKEN="$2"

NOMAD_UNINSTALL="https://raw.githubusercontent.com/Quok-it/Nomad-daemonized/refs/heads/main/uninstall.sh"
NOMAD_INSTALL="https://raw.githubusercontent.com/Quok-it/Nomad-daemonized/refs/heads/main/install.sh"
NETBIRD_UNINSTALL="https://raw.githubusercontent.com/Quok-it/netbirdDaemonized/refs/heads/main/uninstall.sh"
NETBIRD_INSTALL="https://raw.githubusercontent.com/Quok-it/netbirdDaemonized/refs/heads/main/install.sh"

#uninstall first, install after. Ensure perfection

#uninstall netbird

curl -fSsSL $NETBIRD_UNINSTALL | bash

#uninstall nomad


curl -fSsSL $NOMAD_UNINSTALL | bash


#install netbird

curl -fSsSL $NETBIRD_INSTALL | bash -s -- $CLIENT_TOKEN


#install nomad

curl -fSsSL $NOMAD_INSTALL | bash -s -- $SERVER_IP

#on success, welcome to the bush

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
