# This is a basic workflow to help you get started with Actions

name: EDK2 Redmi Note 10 Pro

# Controls when the action will run. Triggers the workflow on push or pull request
# events but only for the master branch
on:
  push:
    branches: [master]
  pull_request:
    branches: [master]

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    name: Image Build
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Install requires packages
        run: |
          sudo apt-get update
          sudo apt-get -y install build-essential uuid-dev clang llvm iasl nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git gettext

      - name: Build device Redmi Note 10 Pro
        run: |
          ./build_common.sh
          ./sweetbuild.sh

      - name: Upload a Build Artifact
        uses: actions/upload-artifact@v3
        with: # Artifact name
          name: Redmi Note 10 Pro
          # A file, directory or wildcard pattern that describes what to upload
          path: ./*.img
