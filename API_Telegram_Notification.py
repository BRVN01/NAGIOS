#!/usr/bin/env python3

# URL da API = "https://api.telegram.org/bot"
# Token do bot = "639965788:AAFAgHCsLgqyDscWGjJKz2zXmdz4LR0a79I"
# Query de envio de mensagens = "/sendMessage?chat_id="
# ID do grupo = "315653225"
# query para enviar a mensagem = "&text="

# Sintax = $UrlAPI$Token$QueryEnv$PegaIP_ID$QueryText
# https://api.telegram.org/bot639965788:AAFAgHCsLgqyDscWGjJKz2zXmdz4LR0a79I/sendMessage?chat_id=315653225&text=oi

from requests.exceptions import HTTPError
import requests
import sys

groudip = sys.argv[1]
token = sys.argv[2]
DESCR = sys.argv[3]

def log(arquivo_log, menssagem, groudip, token):

    menssagem = ("Group ID: " + groudip + "  Token: " + token + '\n' + menssagem + '\n' + '\n')

    try:
        log = open(arquivo_log)

    except FileNotFoundError:

        log = open(arquivo_log, 'w')
        a = log.write(menssagem)
        log.close()

    else:
        arquivo = open(arquivo_log, 'r')
        conteudo = arquivo.readlines()
        conteudo.append(menssagem)

        arquivo = open(arquivo_log, 'w')
        arquivo.writelines(conteudo)

        arquivo.close()


def verify_error_connection(consulta):

    try:
        consulta.raise_for_status()

    except HTTPError:
        print('\nHTTP error occurred. Check your bot token and bot id (can use group id to which your bot belongs)\n')
        log('telegram_env.log', 'HTTP error occurred. Check your bot token and bot id (can use group id to which your bot belongs)')
        sys.exit(12)

    except Exception:
        print('\nOther error occurred\n')
        log('telegram_env.log', 'Other error occurred')
        sys.exit(12)


def api(group_id, Token, arquivo_log, DESCR):
    UrlAPI = "https://api.telegram.org/bot"
    QueryEnv = "/sendMessage?chat_id="
    QueryText = "\&text="

    MSG = 'Notification:' + DESCR
    MSG = MSG.replace(r'\n', '\n')
    get_api = requests.get(UrlAPI + Token + QueryEnv + group_id + QueryText + MSG)
    verify_error_connection(get_api)

    log(arquivo_log, MSG, groudip, token)


a = api(groudip, token, '/var/log/icinga/telegram.log', DESCR)
# a = api('-274508757', '909408437:AAFOsjr1-xyM3dzvQPBc7awseEXagN-qQdY', 'telegram_env.log', 'Description')
