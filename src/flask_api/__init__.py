from contextlib import suppress

from flask import Flask, request

from config import Config

def create_app(mode: str = 'test'):
    app = Flask(__name__)

    app.config.from_object(config.Config())

    if mode == 'test':
        app.config.update({
            "TESTING": True,
        })
    
    # from qpoc_api.services import send_to_queue

    @app.route("/events/<name>", methods=['POST'])
    def post_then_queue(name: str):

        if data := request.data:
            with suppress(Exception):
                ce = from_queue_message(data)
        
        if 'ce' not in locals():
            ce = SimpleCloudEvent()
        
        # for fun, set the source to name
        ce.source = name

        # post to queue
        Queue.send_to_queue(to_queue_message(ce))

        return to_queue_message(ce), 201

    @app.route("/stream/<name>", methods=['POST'])
    def stream_then_queue(name: str):

        def really_big_return():

            if data := request.data:
                with suppress(Exception):
                    ce = from_queue_message(data)
            
            if 'ce' not in locals():
                ce = SimpleCloudEvent()
            
            # for fun, set the source to name
            ce.source = name

            # send back something that takes time
            yield to_queue_message(ce)

            # post to queue
            Queue.send_to_queue(to_queue_message(ce))
        
        return stream_with_context(really_big_return()), 201

    return app
