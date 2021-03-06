#!/bin/bash

banner(){
    printf "  ____                                     _      \n"
    printf " |  _ \ ___ _ __ _ __ ___         ___ __ _| | ___ \n"
    printf " | |_) / _ \ '__| '_ \` _ \ _____ / __/ _\` | |/ __|\n"
    printf " |  __/  __/ |  | | | | | |_____| (_| (_| | | (__ \n"
    printf " |_|   \___|_|  |_| |_| |_|      \___\__,_|_|\___|\n\n"
}

table(){
    clear

    printf "\n\n[+] MANAGMENT : \n"
    printf "\n[\e[31mA\e[97m]-ADMINISTRATOR             [\e[31mVAL\e[97m]-View Audit Log            [\e[31mMC\e[97m]-Manage Channels"
    printf "\n[\e[31mMS\e[97m]-Manage Server            [\e[31mMR\e[97m]-Manage Roles               [\e[31mMN\e[97m]-Manage Nickname"
    printf "\n[\e[31mME\e[97m]-Manage Emojis            [\e[31mMW\e[97m]-Manage Webhooks            [\e[31mMM\e[97m]-Manage Mesages"
    printf "\n[\e[31mMUM\e[97m]-Mute Members            [\e[31mMOM\e[97m]-Move Members              [\e[31mKM\e[97m]-Kick Members"
    printf "\n[\e[31mBM\e[97m]-Ban Members"
    printf "\n\n[+] MESSAGES : \n"
    printf "\n[\e[31mRM\e[97m]-Read Messages            [\e[31mSTTSM\e[97m]-Send TTS Messages       [\e[31mRMH\e[97m]-Read Messages History"    
    printf "\n[\e[31mUEE\e[97m]-Use External Emojis     [\e[31mSM\e[97m]-Send Messages              [\e[31mCII\e[97m]-Create Instant Invite"
    printf "\n[\e[31mEL\e[97m]-Enable Links             [\e[31mAF\e[97m]-Attach Files               [\e[31mMEV\e[97m]-Mention @everyone"
    printf "\n[\e[31mAR\e[97m]-Add Reactions"
    printf "\n\n[+] OTHER : \n"
    printf "\n[\e[31mCN\e[97m]-Change Nickname          [\e[31mC\e[97m]-Connect                     [\e[31mS\e[97m]-Speak"
    printf "\n[\e[31mDM\e[97m]-Deafen Members           [\e[31mUVA\e[97m]-Use Voice Activity        [\e[31mPS\e[97m]-Priority Speaker"
    printf "\n\n[+] TEMPLATES : \n"
    printf "\n[\e[31mT1\e[97m]-All                      [\e[31mT2\e[97m]-All Without Admin"
    printf "\n[\e[31mT3\e[97m]-Manager                  [\e[31mT4\e[97m]-Messager"
}

cleanner(){
    if [[ -f '.check' ]]; then
        rm .check
    fi
}

over(){
    clear 
    printf "\n[+] Invite link : "
    printf "\e[31mhttps://discordapp.com/oauth2/authorize?client_id=$ID&scope=bot&permissions=$result\e[97m\n\n"
    cleanner
    exit
}

main(){

    cleanner 

    result=0;
    printf "\n\n[+] ID : "
    read ID

    while [[ $perms != 'done' ]]; do
        table
        printf "\n\n\n[+] Rights to add type \e[31mdone\e[97m when you have all rights : \n"
        printf " => "
        read perms

        if [[ -f src/$perms ]]; then
            check=$(grep -Fxq "$perms" .check; echo $?);

            if [[ $check == *'0'* ]]; then
                printf "\n[+] You already added this right\n"
            else
                perm="$(cat src/$perms)";
                result="$(echo $(($result+$perm)))";
                echo $perms >> .check
            fi
        else
            if [[ $perms == 'T1' ]]; then
                let "result=2146958847"
                over
            fi
            if [[ $perms == 'T2' ]]; then
                let "result=2146958839"
                over
            fi
            if [[ $perms == 'T3' ]]; then
                let "result=2035294398"
                over
            fi
            if [[ $perms == 'T4' ]]; then
                let "result=257088"
                over
            fi
            if [[ $perms == 'done' ]]; then
                over
            fi
            printf "[+] ERROR \e[31m$perms\e[97m doesn't exists\n\n"
        fi

    done
}

clear
banner
main
