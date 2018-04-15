import numpy as np
import pandas as pd
import pickle

class DataProcessor(object):
    """docstring for DataProcessor"""
    def __init__(self, path=None, data=None):
        super(DataProcessor, self).__init__()
        if data:
            self.data = data
        elif path:
            self.load_data(path)
        else:
            self.load_data("../data/data1.python")

    def load_data(self, path):
        self.data = pickle.load(open(path, "rb"))

    def get_zeros(self, index, dimension=1):
        if dimension == 1:
            row = np.asarray(self.data[:, index].T)[0]
        else:
            row = np.asarray(self.data[index, :])[0]

        remove = []
        for i in xrange(0, len(row)):
            if row[i] == 0:
                remove.append(i)
        return remove


    def filter_lines(self, first_idx, second_idx, dimension=1):
        if dimension == 1:
            first_col = np.asarray(self.data[:, first_idx].T)[0]
            second_col = np.asarray(self.data[:, second_idx].T)[0]
        else:
            first_col = np.asarray(self.data[first_idx, :])[0]
            second_col = np.asarray(self.data[second_idx, :])[0]

        remove = []
        for i in xrange(0, len(first_col)):
            if first_col[i] == 0 or second_col[i] == 0:
                remove.append(i)

        first_col = np.delete(first_col, remove)
        second_col = np.delete(second_col, remove)

        return [first_col, second_col]

    def dist(self, first_idx, second_idx, remove_zeros=True, dimension=1):
        if remove_zeros:
            cols = self.filter_lines(first_idx, second_idx,
                                     dimension = dimension)
        else:
            if dimension == 1:
                cols = [np.asarray(self.data[:, first_idx].T)[0],
                        np.asarray(self.data[:, second_idx].T)[0]]
            else:
                cols = [np.asarray(self.data[first_idx, :])[0],
                        np.asarray(self.data[second_idx, :])[0]]

        return np.linalg.norm((cols[0] - cols[1]))

    def simi(self, first_col_idx, second_col_idx, remove_zeros=True,
             dimension=1):
        return 1./(1.+self.dist(first_col_idx, second_col_idx,
                                remove_zeros = remove_zeros,
                                dimension = dimension))