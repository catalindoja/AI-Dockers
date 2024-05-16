#!/usr/bin/env bash

ollama serve &
ollama list

model_name="mistral"
ollama pull $model_name
