## 🔐 Cracker de Hash Personalizado (Shell Script)

Este projeto é um **script em Bash** desenvolvido para descobrir a senha original de um hash SHA1 gerado a partir da seguinte lógica de transformação:
senha → MD5 (hex string) → Base64 → SHA1 → hash final

---

## 🎯 Objetivo

Durante uma atividade prática de pentest, foi identificado que a aplicação utilizava uma lógica personalizada para gerar o hash de senhas. O objetivo deste script é automatizar a quebra desse hash com base em uma wordlist, utilizando a mesma lógica que a aplicação original.

---

## 🛠️ Requisitos

- Linux (ou WSL)
- Bash
- `md5sum`, `base64`, `sha1sum` (comandos padrão no Linux)
- Wordlist (`password.lst` do John the Ripper, por exemplo)

---

## 🚀 Como usar

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/soarespaullo/cracker.sh.git
   cd hash-cracker-shell
   ```
   
2. Dê permissão de execução ao script:

```
chmod +x cracker.sh
```

3. Edite o script (opcional):

Verifique ou altere o caminho para a wordlist (`WORDLIST`)

Verifique ou edite o valor do hash (`ALVO`)

4. Execute o script:

```
./cracker.sh
```

## 📦 Exemplo de Saída

╔═════════════════════════════════════════════════════════╗
║             🔐 CRACKER DE HASH PERSONALIZADO            ║
║             Lógica: MD5 (hex) → Base64 → SHA1           ║
╚═════════════════════════════════════════════════════════╝

[*] Iniciando ataque... (MD5 → Base64 → SHA1)
[+] SENHA ENCONTRADA: monkey

## 📚 Explicação Técnica

Etapas do script:

- Lê cada senha da wordlist

- Gera o hash MD5 da senha em string hexadecimal

- Codifica essa string hexadecimal em Base64

- Aplica SHA1 sobre a string resultante

- Compara com o hash fornecido

## 🔒 Observação de Segurança

Este projeto tem fins educacionais e deve ser utilizado apenas em ambientes de teste, laboratório ou CTFs.
Nunca use este tipo de ataque contra sistemas reais sem autorização explícita.

## 📄 Licença

MIT License. Livre para estudar, modificar e compartilhar.

## ✍️ Autor

Desenvolvido por [Seu Nome] — Aluno de Cibersegurança
