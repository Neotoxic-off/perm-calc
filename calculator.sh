#/bin/bash

banner(){
    printf "  ____                                     _      \n"
    printf " |  _ \ ___ _ __ _ __ ___         ___ __ _| | ___ \n"
    printf " | |_) / _ \ '__| '_ \` _ \ _____ / __/ _\` | |/ __|\n"
    printf " |  __/  __/ |  | | | | | |_____| (_| (_| | | (__ \n"
    printf " |_|   \___|_|  |_| |_| |_|      \___\__,_|_|\___|\n\n"
}
table(){
    clear

    printf "\n[+] MANAGMENT --------------------------------------------\n"
    printf "\n[\e[31mA\e[97m]-ADMINISTRATOR"
    printf "             [\e[31mVAL\e[97m]-View Audit Log"
    printf "            [\e[31mMC\e[97m]-Manage Channels"
    printf "\n[\e[31mMS\e[97m]-Manage Server"
    printf "            [\e[31mMR\e[97m]-Manage Roles"
    printf "               [\e[31mMN\e[97m]-Manage Nickname"
    printf "\n[\e[31mME\e[97m]-Manage Emojis"
    printf "            [\e[31mMW\e[97m]-Manage Webhooks"
    printf "            [\e[31mMM\e[97m]-Manage Mesages"
    printf "\n[\e[31mMUM\e[97m]-Mute Members"
    printf "            [\e[31mMOM\e[97m]-Move Members"
    printf "              [\e[31mKM\e[97m]-Kick Members"
    printf "\n[\e[31mBM\e[97m]-Ban Members"
    printf "\n\n[+] MESSAGES -------------------------------------------- \n"
    printf "\n[\e[31mRM\e[97m]-Read Messages"
    printf "            [\e[31mSTTSM\e[97m]-Send TTS Messages"
    printf "       [\e[31mRMH\e[97m]-Read Messages History"
    printf "\n[\e[31mUEE\e[97m]-Use External Emojis"
    printf "     [\e[31mSM\e[97m]-Send Messages"
    printf "              [\e[31mCII\e[97m]-Create Instant Invite"
    printf "\n[\e[31mEL\e[97m]-Enable Links"
    printf "             [\e[31mAF\e[97m]-Attach Files"
    printf "               [\e[31mMEV\e[97m]-Mention @everyone"
    printf "\n[\e[31mAR\e[97m]-Add Reactions"
    printf "\n\n[+] OTHER -------------------------------------------- \n"
    printf "\n[\e[31mCN\e[97m]-Change Nickname"
    printf "           [\e[31mC\e[97m]-Connect"
    printf "                    [\e[31mS\e[97m]-Speak"
    printf "\n[\e[31mDM\e[97m]-Deafen Members"
    printf "            [\e[31mUVA\e[97m]-Use Voice Activity"
    printf "       [\e[31mPS\e[97m]-Priority Speaker"
}

main(){
    result=0;

    printf "\n\n[+] ID : "
    read ID

    while [[ $perms != 'done' ]]; do
        table
        printf "\n\n\n[+] Rights to add type \e[31mdone\e[97m when you have all rights : \n"
        printf "=> "
        read perms

        if [[ -f src/$perms ]]; then
            perm="$(cat src/$perms)"
            result="$(echo $(($result+$perm)))"
        else
            if [[ $perms == 'done' ]]; then
                clear
                printf "[+] Invite link :\n\n"
                printf "\e[31mhttps://discordapp.com/oauth2/authorize?client_id=$ID&scope=bot&permissions=$result\e[97m\n"
                exit
            fi
            clear
            printf "[+] ERROR << $perms >> doesn't exists\n\n"
            sleep 3s
        fi

    done
}

clear
banner
main