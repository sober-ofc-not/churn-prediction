# Churn Prediction

Проект по прогнозированию оттока клиентов телеком-компании.

## Стек
Python 3.11, SQL (SQLite), pandas, NumPy, scikit-learn, Jupyter, Matplotlib.

## Структура
- `data/raw/` — исходные данные
- `sql/` — SQL-скрипты для аналитики
- `notebooks/` — Jupyter-ноутбуки (EDA, моделирование)
- `src/` — скрипты обучения и API
- `models/` — сохранённые модели

## Установка
```bash
python3.11 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
