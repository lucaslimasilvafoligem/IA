from pydantic import BaseModel
from fastapi import FastAPI
import joblib
import uvicorn

app = FastAPI()

# Definindo o modelo de dados de entrada
class DadosEntrada(BaseModel):
    horas_estudo: float

modelo = joblib.load("modelo_regressao_linear.pkl")

# Criar classe que terá os dados do request body para a API
@app.post("/previsao")
def previsao(data: DadosEntrada):
    y_pred = modelo.predict([[data.horas_estudo]])[0].astype(int)
    return {"previsao": y_pred.tolist()}
