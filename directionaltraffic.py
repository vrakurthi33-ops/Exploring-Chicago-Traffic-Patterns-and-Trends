import pandas as pd
import matplotlib.pyplot as plt
import numpy as np 
import os  
os.getcwd()
os.chdir('/Users/venkateshrakurthi/Desktop/580project')
os.getcwd()
traffic = pd.read_csv("traffic2.csv", sep=",")
#data cleaning
traffic.info()
traffic.head()
traffic.Fcount
traffic.Fcount.isna()
traffic.Fcount.dropna()
traffic.Fcount
traffic.Bcount
traffic.Bcount.isna()
traffic.Bcount.dropna()
traffic.Bcount
traffic = traffic.rename(columns={'Traffic Volume Count Location  Address': 'Tloc'})
print(traffic.columns) 
#finding the difference between directiions
traffic['Fcount'] = traffic['Fcount'].astype(int)
traffic['Bcount'] = traffic['Bcount'].astype(int)
traffic['Difference'] = traffic['Fcount'] - traffic['Bcount']
filtered_traffic = traffic[traffic['Difference'] > 7000]
sorted_traffic = filtered_traffic.sort_values(by='Difference', ascending=False)
#visualisation
plt.figure(figsize=(12, 6))
ax = plt.gca()
locations = sorted_traffic["Tloc"].unique()
x_positions = range(len(locations))
bar_width = 0.35
ax.bar(x_positions, sorted_traffic.groupby("Tloc")["Bcount"].sum(), width=bar_width, label="Bcount")
ax.bar([pos + bar_width for pos in x_positions], sorted_traffic.groupby("Tloc")["Fcount"].sum(), width=bar_width, label="Fcount")
ax.set_xticks(np.arange(len(locations)) + bar_width / 2)
ax.set_xticklabels(locations, ha="center")
plt.xlabel("Tloc")
plt.ylabel("Count")
plt.title("Traffic Volume Count Locations", fontweight='bold')
plt.legend()
plt.show()
