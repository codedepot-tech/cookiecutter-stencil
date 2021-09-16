import os, shutil, sys
from subprocess import call, run, Popen

SANDBOX_DIR = os.path.realpath(os.path.curdir)
PROJECT_DIR = os.path.join(SANDBOX_DIR, '{{cookiecutter.project_name}}')
FRONTEND_DIR = os.path.join(PROJECT_DIR, 'src')
BACKEND_DIR = os.path.join(PROJECT_DIR, 'backend')

project_js_deps = "{{cookiecutter.project_js_deps}}"
project_js_dev_deps = "{{cookiecutter.project_dev_deps}}"
default_js_deps = "(space seperated) BUILTINS ARE.. graphql apollo-client"
default_js_dev_deps = "(space seperated) BUILTINS ARE.. nodejs npm yarn stencil"


if project_js_deps == default_js_deps:
  project_js_deps = default_js_deps.split(' ')[4:]
else:
  project_js_deps = project_js_deps.split(' ')
  project_js_deps += default_js_deps[4:]

if project_js_dev_deps == default_js_dev_deps:
  project_js_dev_deps = default_js_dev_deps.split(' ')[4:]
else:
  project_js_dev_deps = project_js_dev_deps.split(' ')
  project_js_dev_deps += default_js_dev_deps.split(' ')[4:]

# print(f"{default_js_deps}")
# print(f"{project_js_deps}")
# print("")
# print(f"{default_js_dev_deps}")
# print(f"{project_js_dev_deps}")

# sys.exit(0)
git_commands = [
  'git init'.split(' '),
  'git add .'.split(' '),
  # 'git commit -m \"init\" '.split(' ')
]



if __name__ == '__main__':

  call('npm init stencil'.split(' '))

  for x in ['flake.nix', '.envrc', '.gitignore', 'README.md', 'LICENSE']:
    shutil.move(f'{x}', f'./{{cookiecutter.project_name}}/{x}')

  os.chdir(PROJECT_DIR)
  os.mkdir(".direnv")

  for dep in project_js_deps:
    call(f'npm install {dep}'.split(' '))

  for ddep in project_js_dev_deps:
    call(f'npm install --save-dev {ddep}'.split(' '))

  call('npm install'.split(' '))

  # call('npm audit fix'.split(' '))

  # git commands
  for cmd in git_commands:
    call(cmd)

  # call('nix develop'.split(' '))
