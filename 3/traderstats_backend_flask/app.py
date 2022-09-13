from flask import Flask, request, jsonify
from flaskext.mysql import MySQL
from flask_cors import CORS
from flask_restful import Resource, Api
from controllers.mt_controller import *
from controllers.user_controller import *


def create_app():
    _app = Flask(__name__)
    api = Api(_app)
    CORS(_app)

    accounts_endpoint = '/account/'
    mt_base_endpoint = accounts_endpoint + 'meta-trader/'

    with _app.app_context():
        _app.config.from_mapping(
            DEBUG=True, Testing=True
        )
        user_controller = UserController
        api.add_resource(RegisterUser, '/signup')
        api.add_resource(LoginUser, '/login')
        api.add_resource(AccountDetails, mt_base_endpoint + 'details')
        api.add_resource(Symbols, mt_base_endpoint + 'symbols')
        api.add_resource(MarketBook, mt_base_endpoint + 'market-book')
        api.add_resource(ActiveOrders, mt_base_endpoint + '/active-orders')
        api.add_resource(OrdersHistory, mt_base_endpoint + '/orders-history')
        api.add_resource(DealsHistory, mt_base_endpoint + '/deals-history')
        api.add_resource(TradePositions, mt_base_endpoint + '/trade-positions')

    return _app


if __name__ == '__main__':
    app = create_app()
    # app.app_context().push()
    app.run()
