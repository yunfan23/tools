## User Jupyter Notebook in windows using Linux env
```bash
jupyter notebook --no-browser --port 1234
ssh -NL 1234:localhost:1234
ssh -N -f -L localhost:1234:localhost:1234 -p 22 yunfan@ali01
```
## Add kernel into Jupyter Notebook
```
ipython kernel install --name "local-venv" --user**
```
## ssh a session and change to specific directory
```bash
ssh -t yunfan@ntu-02 "cd /home/yunfan/workarea ; bash --login"
```
- `-t` Force pseudo-terminal allocation \
- `bash --login` use your configs as a login shell