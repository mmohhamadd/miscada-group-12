import pyvista as pv
import os
import http.server
import socketserver

pv.start_xvfb()

# Get a list of all files in the directory
directory = '/app/data/'
files = [f for f in os.listdir(directory) if os.path.isfile(
    os.path.join(directory, f))]
files = sorted(files, key=len)

# Create a plotter object to plot and animate
print("creating animation ...")
plotter = pv.Plotter()
mesh = pv.read('/app/data/output_0.vtk')
plotter.add_mesh(mesh)
plotter.open_gif('/app/data/animation.gif', fps=10)

# Loop over all frames
for i in range(len(files)):
    try:
        i = i*100
        mesh = pv.read(f'/app/data/output_{i}.vtk')
        plotter.clear()
        plotter.add_mesh(mesh)

        # Write this frame to the GIF
        plotter.write_frame()
    except:
        continue


plotter.close()


class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def translate_path(self, path):
        base_dir = '/app/data/'
        requested_path = path[1:]
        return os.path.join(base_dir, requested_path)


# serving the animation and files
PORT = 5050
Handler = CustomHTTPRequestHandler
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("checkout the simulation animation at http://localhost:5050/animation.gif")
    httpd.serve_forever()
