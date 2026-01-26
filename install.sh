#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]                TOOLS PTERODACTYL [+]${NC}"
  echo -e "${BLUE}[+]                  © Ikann                [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${RED}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "script ini di buat untuk mempermudah dalam install panel, theme, protect"
  echo -e "dilarang keras untuk dikasih gratis."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@ikanngeming"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "@ikann"
  sleep 4
  clear
}

install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ BERHASIL                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]              INSTALL JQ GAGAL                   [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}

check_ip_whitelist() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]            LICENSY RAFATHAR CODE (IP)          [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  MY_IP=$(curl -s --max-time 10 ifconfig.me)

  if [ -z "$MY_IP" ]; then
    echo -e "${RED}❌ Gagal mengambil IP VPS${NC}"
    exit 1
  fi

  echo -e "${YELLOW}IP VPS ANDA : $MY_IP${NC}"

  RAW_URL="https://raw.githubusercontent.com/sandyparadox59-alt/felixbetates/refs/heads/main/gmbs/gg.json"

  json=$(curl -fsS --max-time 10 "$RAW_URL") || json=""
  if [ -z "$json" ]; then
    echo -e "${RED}❌ Gagal mengakses daftar IP whitelist${NC}"
    exit 1
  fi

  valid=$(echo "$json" | jq -r --arg ip "$MY_IP" '.ips[] | select(. == $ip)')

  if [ -n "$valid" ]; then
    echo -e "${GREEN}✅ AKSES BERHASIL (IP TERDAFTAR)${NC}"
  else
    echo -e "${RED}❌ IP TIDAK TERDAFTAR${NC}"
    echo -e "${GREEN}Silakan beli akses ke Ikann{NC}"
    echo -e "${YELLOW}TELEGRAM : @ikanngeming${NC}"
    echo -e "${YELLOW}WHATSAPP : 6285765183832${NC}"
    echo -e "${YELLOW}HARGA : 10K${NC}"
    echo -e "${YELLOW}© Ikann${NC}"
    exit 1
  fi

  clear
}

display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${BLUE}        _,gggggggggg.                                     ${NC}"
  echo -e "${BLUE}    ,ggggggggggggggggg.                                   ${NC}"
  echo -e "${BLUE}  ,ggggg        gggggggg.                                 ${NC}"
  echo -e "${BLUE} ,ggg'               'ggg.                                ${NC}"
  echo -e "${BLUE}',gg       ,ggg.      'ggg:                               ${NC}"
  echo -e "${BLUE}'ggg      ,gg'''  .    ggg       Tools pterodactyl  ${NC}"
  echo -e "${BLUE}gggg      gg     ,     ggg      ------------------------  ${NC}"
  echo -e "${BLUE}ggg:     gg.     -   ,ggg       • Telegram : t.me/ikanngeming     ${NC}"
  echo -e "${BLUE} ggg:     ggg._    _,ggg        • Creadit  : Ikann ${NC}"
  echo -e "${BLUE} ggg.    '.'''ggggggp           • Support by Ikann  ${NC}"
  echo -e "${BLUE}  'ggg    '-.__                                           ${NC}"
  echo -e "${BLUE}    ggg                                                   ${NC}"
  echo -e "${BLUE}      ggg                                                 ${NC}"
  echo -e "${BLUE}        ggg.                                              ${NC}"
  echo -e "${BLUE}          ggg.                                            ${NC}"
  echo -e "${BLUE}             b.                                           ${NC}"
  echo -e "                                                                     "
  echo -e "BERIKUT LIST INSTALL :"
  echo "1. Install panel"
  echo "0. Exit"
  echo -e "Masukkan pilihan 1/2/0:"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_panel
      ;;
    0)
      echo "Berhasil keluar dari script"
      clear
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
