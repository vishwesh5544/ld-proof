from datetime import datetime

import MetaTrader5 as mt5


class MetaTraderService:

    def __init__(self):
        self.all_trade_positions = None
        self.mt5 = mt5.initialize()
        self.symbols = None
        self.account_info = None
        self.market_book = None
        self.active_orders = None
        self.open_positions = None
        self.deals_history = None
        self.orders_history = None
        # self.initialize_mt5()

    def get_account_details(self):
        self.account_info = mt5.account_info()._asdict()
        return self.account_info

    def get_symbols(self):
        self.symbols = mt5.symbols_get()._asdict()
        return self.symbols

    def get_market_book(self):
        self.market_book = mt5.market_book_get('EURUSD')
        return self.market_book

    def get_active_orders(self):
        self.active_orders = mt5.orders_get()._asdict()
        return self.active_orders

    def get_orders_history(self):
        self.orders_history = mt5.history_orders_get(datetime(2022, 7, 1), datetime.now())
        return self.orders_history

    def get_deals_history(self):
        self.deals_history = mt5.history_deals_get()
        return self.deals_history

    def get_all_trade_positions(self):
        self.all_trade_positions = mt5.positions_get()
        return self.all_trade_positions


    def initialize_mt5(self):
        if not mt5.initialize():
            print("mt5 initialization failed, error code = ", mt5.last_error())
            quit()
        else:
            print("mt5 initialized")
