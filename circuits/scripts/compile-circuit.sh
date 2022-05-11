#!/bin/bash

cd ../circom

if [ -f ./build/powersOfTau28_hez_final_10.ptau ]; then
  cd build
  echo "powersOfTau28_hez_final_10.ptau already exists. Skipping."
else
  echo 'Downloading powersOfTau28_hez_final_10.ptau'

  mkdir build

  cd build

  wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
fi

# compile circom circuit using snarkjs
echo "Compiling NftMint.circom..."

if [ -f ./NftMint.r1cs ]; then
  echo "circuit is already compiled"
else
  circom ../circom/NftMint.circom --r1cs --wasm --sym -o
  snarkjs r1cs info NftMint.r1cs
fi
