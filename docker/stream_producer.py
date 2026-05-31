import time
import json
import pandas as pd
from azure.eventhub import EventHubProducerClient, EventData

CONNECTION_STR = "Endpoint=sb://esehamd0d6tpw3ft70uybc.servicebus.windows.net/;SharedAccessKeyName=key_bc3cdbf5-8151-4fff-a896-f2cb57c31322;SharedAccessKey=mRqGnP0yD5lFtfFA3q6cUsrr1DFv0JjgM+AEhDNPWmw=;EntityPath=esehamd0d6tpw3ft70uybc_eh"
EVENT_HUB_NAME = "esehamd0d6tpw3ft70uybc_eh"

def stream_to_fabric():
    try:
        df = pd.read_csv('data/hotel_raw_stream.csv')
    except FileNotFoundError:
        print("Error: 'data/hotel_raw_stream.csv' file not found!")
        return

    print("Establishing connection to Microsoft Fabric...")
    try:
        producer = EventHubProducerClient.from_connection_string(
            conn_str=CONNECTION_STR, 
            eventhub_name=EVENT_HUB_NAME
        )
        
        print("Data streaming started... Sending events to Fabric.")
        with producer:
            for index, row in df.iterrows():
                data_payload = row.to_dict()
                event_data = EventData(json.dumps(data_payload))
                producer.send_batch([event_data])
                print(f"Success: Sent hotel data -> {data_payload.get('hotel', 'Unknown Hotel')}")
                time.sleep(1)
    except Exception as e:
        print(f"Error occurred while sending data: {e}")

if __name__ == "__main__":
    stream_to_fabric()
