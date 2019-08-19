{ pkgs ? import <nixpkgs> {} }:
with pkgs;
callPackage ./. {}
