import pandas as pd

df = pd.read_sas("/mnt/data/analysis_data/adsl.sas7bdat", encoding='latin-1')

df.to_csv('/mnt/data/analysis_data/adsl_test.csv') 