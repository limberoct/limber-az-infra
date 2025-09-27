from django.http import HttpResponse
from django.shortcuts import render
import datetime

def hello_world(request):
    html = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Hello World Django App</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .container {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
                text-align: center;
                max-width: 500px;
            }
            h1 {
                color: #333;
                font-size: 2.5em;
                margin-bottom: 20px;
            }
            p {
                color: #666;
                font-size: 1.2em;
                margin: 10px 0;
            }
            .info {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 5px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🎉 Hello World! 🎉</h1>
            <p>Welcome to your Django app running on Docker in Azure!</p>
            <div class="info">
                <p><strong>Server Time:</strong> {}</p>
                <p><strong>Status:</strong> Running successfully</p>
                <p><strong>Framework:</strong> Django + Docker</p>
                <p><strong>Cloud:</strong> Microsoft Azure</p>
            </div>
        </div>
    </body>
    </html>
    """.format(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S UTC"))
    
    return HttpResponse(html)