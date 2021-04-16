User Jupyter Notebook in windows using Linux env

jupyter notebook --no-browser --port 1234

ssh -NL 1234:localhost:1234

ssh -N -f -L localhost:1234:localhost:1234 -p 22 yunfan@ali01

Add kernel into Jupyter Notebook

**ipython kernel install --name "local-venv" --user**
