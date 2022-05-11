pragma circom 2.0.3;

include "../node_modules/circomlib/circuits/Poseidon.circom"

template NftMint() {

  // public input signals
  signal input address; // address of the user
  signal input hash; // hash of the pre-image

  // public output signals
  signal output nullifier; // ouput hash or nullifier

  // private input signal 
  signal input pre_image; // password 


  component preimageHash = Poseidon(1);
  preimageHash.inputs[0] <== pre_image;

  // comparing hash of the preimage to the hash provided
  preimageHash.out === hash;

  component nullifierHash = Poseidon(2)

  nullifierHash.inputs[0] <== address;
  nullifierHash.inputs[1] <== preimage;

  //comparing the constructed nullifier hash to the nullifier hash provided
  //stop the double standing of the hash
  nullifierHash.out === nullifier;

}

component main = NftMint();