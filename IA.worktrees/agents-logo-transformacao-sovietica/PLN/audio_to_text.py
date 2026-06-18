import speech_recognition as sr
from pydub import AudioSegment
import os

def audio_to_text(audio_file_path):

    recognizer = sr.Recognizer()

    # Converte o áudio para o formato WAV, se necessário
    if not audio_file_path.endswith(".wav"):
        sound = AudioSegment.from_file(audio_file_path)
        audio_file_path = "temp.wav"
        sound.export(audio_file_path, format="wav")

    # Carrega o arquivo de áudio
    with sr.AudioFile(audio_file_path) as source:
        audio = recognizer.record(source)  # lê o áudio do arquivo

    # Tenta reconhecer o áudio usando o Google Web Speech API
    try:
        text = recognizer.recognize_google(audio, language="pt-BR")
        print("Texto reconhecido:")
        print(text)
        return text
    except sr.UnknownValueError:
        print("Google Web Speech API não conseguiu entender o áudio.")
    except sr.RequestError as e:
        print(f"Erro ao solicitar resultados do serviço de reconhecimento de fala: {e}")

    # Remove o arquivo temporário
    if os.path.exists("temp.wav"):
        os.remove("temp.wav")

# Exemplo de uso
audio_file_path = "WhatsApp Ptt 2024-09-05 at 11.56.33.ogg"
audio_to_text(audio_file_path)
