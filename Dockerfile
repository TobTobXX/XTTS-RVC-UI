# Use an official Python runtime as a parent image
# Python 3.11 is not supported by fairseq
# https://github.com/facebookresearch/fairseq/issues/5012
FROM docker.io/python:3.10

# Install PyTorch with CUDA 12.4 support
RUN pip install --no-cache-dir --pre \
	torch==2.6.0.dev20241008+cu124 \
	torchaudio==2.5.0.dev20241008+cu124 \
	--index-url https://download.pytorch.org/whl/nightly/cu124

# Set the working directory in the container
WORKDIR /app

COPY requirements.txt ./

# Install other Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

ENV HOST="::1"
ENV PORT="5000"

VOLUME /app/models
VOLUME /app/rvcs
VOLUME /app/voices

CMD ["bash", "start.sh" ]
