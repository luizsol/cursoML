import data_processor as dp
import numpy as np

class Recommendation(object):
    """docstring for Recommendation"""
    def __init__(self, path=None, data=None):
        super(Recommendation, self).__init__()
        if data:
            self.data = data
        else:
            self.data = "../data/data1.python"

    @property
    def data(self):
        return self.dp.data

    @data.setter
    def data(self, value):
        if isinstance(value, dp.DataProcessor):
            self.dp = dp.DataProcessor()
        elif isinstance(value, str):
            self.dp = dp.DataProcessor(path = value)
        elif isinstance(value, np.matrix):
            self.dp = dp.DataProcessor(data = value)
        else:
            raise ValueError("Invalid data type")

    def get_non_watched_movies(self, client_idx):
        return self.dp.get_zeros(client_idx, dimension=0)

    def recommend(self, client_idx):
        return 0
