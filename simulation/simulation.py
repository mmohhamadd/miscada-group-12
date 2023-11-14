import pyvista as pv
import os
import http.server
import socketserver

pv.start_xvfb()

# Get a list of all files in the directory
BASE_DIR = os.path.join( os.path.dirname('__file__'), '..' )
directory = BASE_DIR + '/build/src/app/data/'
files = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]
files.sort(key = len)
# Create a plotter object to plot and animate
print("creating animation ...")
plotter = pv.Plotter()
mesh = pv.read(directory + 'output_0.vtk')
plotter.add_mesh(mesh)
plotter.open_gif(BASE_DIR + '/simulation/animation.gif')
# Loop over all frames
for file in files:
    mesh = pv.read(BASE_DIR + file)

    plotter.clear()
    plotter.add_mesh(mesh)

    # Write this frame to the GIF
    plotter.write_frame()
plotter.close()

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def translate_path(self, path):
        base_dir = directory
        requested_path = path[1:]  # Remove the leading '/'
        return os.path.join(base_dir, requested_path)

# serving the animation and files
PORT = 5050
Handler = CustomHTTPRequestHandler
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("checkout the simulation animation at http://localhost:5050/animation.gif")
    httpd.serve_forever()