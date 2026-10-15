import pandas as pd
import sqlite3
from pathlib import Path
BASE_DIR = Path(__file__).resolve().parent.parent
CSV_PATH = BASE_DIR / "data" / "raw" / "telco_churn.csv"
DB_PATH = BASE_DIR / "data" / "processed" / "churn.db"


def load_data(csv_path):
    df = pd.read_csv(csv_path)
    df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
    nan_count = df['TotalCharges'].isna().sum()
    print(f"NaN в TotalCharges: {nan_count}")
    df = df.dropna(subset=['TotalCharges'])
    return df

def save_to_db(df, db_path):
    conn = sqlite3.connect(db_path)
    df.to_sql('customers', conn, if_exists='replace', index=False)
    conn.close()

if __name__ == "__main__":
    df = load_data(CSV_PATH)
    save_to_db(df, DB_PATH)
    print(f"Загружено {len(df)} строк в {DB_PATH}")
