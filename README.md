# XTTS-RVC-UI
This is a simple UI that utilize's [Coqui's XTTSv2](https://github.com/coqui-ai/TTS) paired with RVC functionality to improve output quality.

Fork from https://github.com/Vali-98/XTTS-RVC-UI, but adapted for Docker.

# Usage
This project is run with Docker.

Example:
```
docker run \
    -e HOST="0.0.0.0" \
    -e PORT=5000 \
    -p 5000:5000 \
    --gpus all \
    -v ./xtts/models:/app/models \
    -v ./xtts/rvcs:/app/rvcs \
    -v ./xtts/voices:/app/voices \
    --name xtts-rvc-ui \
    ghcr.io/tobtobxx/xtts-rvc-ui:master
```
