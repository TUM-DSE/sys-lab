with import <nixpkgs> {}; 

let 
  my-python = pkgs.python3;
  # jinja2 is required to build Coyote. 
  python-with-my-packages = my-python.withPackages (p: with p; 
  [
    jinja2
  ]);
in
pkgs.mkShell {
  name = "my-packages";
  runScript = "bash";

  buildInputs = with pkgs; [
    coreutils
    git 
    boost

    cmake
    nasm
    binutils

    # linux.dev
    usbutils
    pciutils

    # python packages
    python3
    python-with-my-packages
  ];  
  shellHook = ''
    PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
    # the other env-vars
  '';
}

