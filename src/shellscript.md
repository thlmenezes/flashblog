# Boas práticas

# ENV

- Usar env para encontrar interpretador

```bash
#!/usr/bin/env sh
```

# Cabeçalho

```bash
#=========================================================|
#AUTHOR
#  Thales 'thaleslim' Menezes <thalesmenezes@cjr.org.br>
#
#NAME
#  CJREnv.sh
#
#MINI DESCRIPTION
#  CJR environment setup for linux
#
#DESCRIPTION
#  Lorem ipsum
#
#LICENSE
#  GPLv3 <gitlab.com/thaleslim/CJREnv/license.txt>
#
#WEBSITE
#  https://thaleslim.github.io/flashblog/CJREnvScript
#
#SOURCE
#  https://gitlab.com/thaleslim/CJREnv
#
#CHANGELOG
#  (VERSION 1.0) [...]
#=========================================================|
```

# Caixas

```bash
#========================= VARIABLES
#========================= TESTS
#========================= FUNCTIONS
#========================= START
```

# CHMOD

```bash
chmod +x script.sh
```

# TESTES

```bash
#========================= TESTS
#IS_ROOT?
[["$UID" -ne '0']] && { echo "ONLY ROOT."; exit 1; }
```

# ROOT

- Não é interessante usar `sudo`, principalmente dentro do script; melhor requerer que seja root (`su`)

# /etc/os-release

```bash
#========================= LIBS
source /etc/os-release #WHICH DISTRO?
#========================= TESTS
# bash support regex
# if [[ "$NAME" =~ (s|S)lackware ]]; then
if [[ "$NAME" == 'Slackware' ]]; then
	# code
fi
```

# VARIÁVEIS

- evitar MAIÚSCULAS para não confundir com SHELL VARS

```bash
#========================= VARIABLES
dir_usr_bin='/usr/bin'
i3_dir_home="${HOME}/.config/i3/"
```

# FUNÇÕES

- DICA: _ & UPPER para explicitar funções

```bash
#========================= FUNCTIONS
function _STATUS_RETURN() {
	return 1
}
```

# COMENTÁRIO

- meia linha - curtíssimo
- uma linha - curto
- bloco - extenso

# RETORNO/STATUS

```bash
#========================= FUNCTIONS
function _LIST_DIR() {
	ls /usr/bin && return 0 || return 1
}

_LIST_DIR || echo "FATAL ERROR"

log_curl='/var/log/script.sh.log'

if ! curl ifconfig.me 2>"$log_curl"; then
	echo "vish, deu erro no curl ..."
	echo "log em $log_curl"
	exit 1
fi
```

# sh

- shell mais antigo e mais compatível

Extensão .sh não é obrigatória

Cabeçalho(#!) diferencia scripts de textos normais

[ShellScript Curso básico](https://www.youtube.com/playlist?list=PLCHxQu_V7ZinTvwd6VO98LGDPQhUJ_rsV)

[ShellScript](https://www.youtube.com/playlist?list=PLCHxQu_V7ZimJuY-WJiCulJabcXsPZv9a)

[POSIX Shell manual](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html)

[Sh manual](https://pubs.opengroup.org/onlinepubs/9699919799/)

https://man.cx/sh
https://man.cx/bash