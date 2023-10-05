
import requests

def send_to_telegram(message):
    #Generate by bothfather
    apiToken = '6626427275:AAG25ALfKv6GPXv73pvi0v-fiEIrZGoAkwY'
    #Send one message by curl and find the id
    chatID = '960062146'
    apiURL = f'https://api.telegram.org/bot{apiToken}/sendMessage'

    try:
        response = requests.post(apiURL, json={'chat_id':chatID, 'text': message})
        print(response.text)
    except Exception as e:
        print(e)

send_to_telegram("You know, its nice to have me!")
