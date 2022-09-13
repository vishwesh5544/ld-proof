import json

from flask import request, current_app as app, jsonify
from flask_restful import Resource, Api

from metatraderservice.mt_service import MetaTraderService


class AccountDetails(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()

    def get(self):
        return self.metaTraderService.get_account_details()


class Symbols(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()


class MarketBook(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()

    def get(self):
        return self.metaTraderService.get_market_book()


class ActiveOrders(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()

    def get(self):
        return self.metaTraderService.get_active_orders()


# tested-working
class OrdersHistory(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()

    def get(self):
        orders_history = self.metaTraderService.get_orders_history()
        orders_dictionary = {}
        i = 0
        for order in orders_history:
            orders_dictionary[i] = order._asdict()
            i += 1
        print(orders_history)
        return orders_dictionary


# tested-working
class TradePositions(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()

    def get(self):
        all_trade_positions = self.metaTraderService.get_all_trade_positions()
        positions_dictionary = {}
        i = 0
        for position in all_trade_positions:
            positions_dictionary[i] = position._asdict()
            i += 1
        return positions_dictionary


class DealsHistory(Resource):
    def __init__(self):
        with app.app_context():
            self.metaTraderService = MetaTraderService()

    def get(self):
        return self.metaTraderService.get_deals_history()
