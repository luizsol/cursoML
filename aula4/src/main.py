import data_processor as dp
import recommendation as rec
import numpy as np

processor = dp.DataProcessor()
print processor.data

print processor.simi(0, 1)

print processor.simi(3, 1)

print processor.simi(4, 1)

recomend = rec.Recommendation()

print recomend.get_non_watched_movies(1)