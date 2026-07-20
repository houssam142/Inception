FROM debian:bookworm


RUN apt update && \
	apt install -y \
	python3-pip \
	python3.11-venv \
	npm \
	python3 && \
	rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /setup.sh

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt --break-system-packages

COPY components/upload.py /upload.py

RUN mkdir -p /uploads

RUN chmod +x /setup.sh

EXPOSE 9443

ENTRYPOINT ["/setup.sh"]
