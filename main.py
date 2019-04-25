import pandas as pd
import numpy as np
from IPython.display import display
import seaborn as sns
sns.set()
import matplotlib.pyplot as plt
import folium
from folium.plugins import FastMarkerCluster
from branca.colormap import LinearColormap
import os

map1 = folium.Map(location=[40.723204, -73.923018], tiles='OpenStreetMap', zoom_start=11.5)
map1.save('map.html')