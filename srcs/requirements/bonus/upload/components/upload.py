import os
from flask import Flask, request
from html import escape

app = Flask(__name__)
UPLOAD_DIR = "/uploads"


@app.route("/upload/", methods=["POST"])
def upload():
    file = request.files["file"]
    file.save(os.path.join(UPLOAD_DIR, file.filename))
    return "upload successful"


@app.route("/files", methods=["GET"])
def files():
    files = os.listdir(UPLOAD_DIR)

    html = "<h1>Uploaded Files</h1>"

    for f in files:
        path = os.path.join(UPLOAD_DIR, f)

        html += f"<h3>{f}</h3>"

        # try reading as text (Makefile, code, etc.)
        try:
            with open(path, "r", errors="ignore") as file:
                content = file.read(10000)

            html += f"""
            <pre style="background:#111;color:#0f0;padding:10px;">
{escape(content)}
            </pre>
            """

        except:
            html += "<p>Cannot display file</p>"

        html += "<hr>"

    return html


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9443)
