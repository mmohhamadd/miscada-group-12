import pyvista as pv
import os
import http.server
import socketserver
import imageio
import matplotlib.pyplot as plt
from PIL import Image
import numpy as np

def update_plot(file):
    plt.clf()
    grid = pv.read(file)
    fig = grid.plot(show_scalar_bar=False, show_axes=False, screenshot=True)
    im = Image.fromarray(np.uint8(fig))
    return im


# Get a list of all files in the directory
BASE_DIR = os.path.join( os.path.dirname('__file__'), '..' )
directory = BASE_DIR + '/build/src/app/data/'
files = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

# Create a plotter object to plot and animate
print("creating animation ...")
files.sort(key = len)
data = [update_plot(directory + files[i]) for i in range(len(files))]
print(data)
imageio.mimsave(BASE_DIR + '/simulation/animation.gif', data)


class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def translate_path(self, path):
        requested_path = path[1:]  # Remove the leading '/'
        return os.path.join(BASE_DIR + '/simulation/', requested_path)

# serving the animation and files
PORT = 5050
Handler = CustomHTTPRequestHandler
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("checkout the simulation animation at http://localhost:5050/animation.gif")
    httpd.serve_forever()