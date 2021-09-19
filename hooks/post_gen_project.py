import os, shutil, sys
from subprocess import call, run, Popen







if __name__ == '__main__':

  call(f'npm init'.split(' '))
  call('npm install --save-exact stencil'.split(' '))