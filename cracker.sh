#!/bin/bash
#
# 🔐 Cracker de Hash Personalizado
#
# Descrição:
#   Script em Bash para quebrar hashes gerados com a lógica:
#   senha → MD5 (hex string) → Base64 → SHA1
#
# Uso:
#   ./cracker.sh
#
# Requisitos:
#   - Bash
#   - md5sum
#   - base64
#   - sha1sum
#   - Uma wordlist (ex: /usr/share/john/password.lst)
#
# Entrada:
#   O script compara o hash alvo com cada senha da wordlist,
#   aplicando a mesma lógica de transformação usada pela aplicação.
#
# Hash de exemplo:
#   806825f0827b628e81620f0d83922fb2c52c7136  (gerado a partir de "monkey")
#
# Autor:
#   Paulo Soares – Estudante de Cibersegurança
#
# Licença:
#   MIT License
#
# ⚠️ Uso educacional apenas. Não utilize em sistemas sem autorização explícita.
#
# === CORES ===
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

# === BANNER ===
clear
echo -e "${CYAN}"
echo "╔═════════════════════════════════════════════════════════╗"
echo "║             🔐 CRACKER DE HASH PERSONALIZADO            ║"
echo "║             Lógica: MD5 (hex) → Base64 → SHA1           ║"
echo "╚═════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

# === VARIÁVEIS ===
ALVO="806825f0827b628e81620f0d83922fb2c52c7136"
WORDLIST="/usr/share/john/password.lst"

# Verifica se a wordlist existe
if [[ ! -f "$WORDLIST" ]]; then
    echo -e "${RED}[!] Wordlist não encontrada: $WORDLIST${RESET}"
    exit 1
fi

echo -e "${BLUE}[*] Iniciando ataque... (MD5 → Base64 → SHA1)${RESET}"

# Loop pela wordlist
while IFS= read -r SENHA || [[ -n "$SENHA" ]]; do
    LIMPA=$(echo -n "$SENHA" | tr -d '\r\n')

    # 1. Gera MD5 em string hexadecimal
    MD5_HEX=$(echo -n "$LIMPA" | md5sum | awk '{print $1}')

    # 2. Aplica base64 na string hexadecimal
    BASE64_STRING=$(echo -n "$MD5_HEX" | base64)

    # 3. Aplica SHA1 na string base64
    SHA1_FINAL=$(echo -n "$BASE64_STRING" | sha1sum | awk '{print $1}')

    # 4. Compara com o hash fornecido
    if [[ "$SHA1_FINAL" == "$ALVO" ]]; then
        echo -e "${GREEN}[+] SENHA ENCONTRADA: ${LIMPA}${RESET}"
        exit 0
    fi
done < "$WORDLIST"

echo -e "${RED}[-] Senha não encontrada na wordlist.${RESET}"
