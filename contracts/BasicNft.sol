// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//IMP DOT:
// how this nft will look actually. this will be done by URI. the json file that URI has contains a attribute image which will point to the image of the nft.
// THE NFT WILL BE STORED ON DEVENTRALISED STORAGE. SO THAT WHEN THE CENTRALIZED STORAGE GOES DOWN OR ANY MALACIOUS THING HAPPEN THE NFT IS SAFE FROM THAT. GOOGLE CLOUD IS A CENTRALIZED ONE. 
//the link of the image should come from a decentralized storage. like ipfs. in this nft we are using ipfs. 
//to implement erc721 we need to have certain functions. either we can write them by our own. or we can use openzeppelin library. which is used below. 
//command to use open is npm install @openzeppelin/contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 { // this is part is to **inherit** the erc721 contract.
    string public constant TOKEN_URI =//this is public constant because this is never gonna change
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";//this is the link of the image of the nft. this is the link of the json file. this is the link of the metadata of the nft.
    uint256 private s_tokenCounter;

    constructor() ERC721("Dogie", "DOG") {// the inherited ERC721 takes a name and a symbol. 
        s_tokenCounter = 0;
    }

    function mintNft() public {
    
        _safeMint(msg.sender, s_tokenCounter);//the safe mint function is inherited from ERC721. it takes two arguments. the address of the person who is minting the token and the token id. // minting the token means owning the token.
        //tokenid is needed to distinguish between different tokens on the same smart contract.
        s_tokenCounter = s_tokenCounter + 1;//everytime we mint a nft we increment the token counter.
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return TOKEN_URI;//this returns the token uri. which is the link of the json file.
    }

    function getTokenCounter() public view returns (uint256) {//this simply returns the token counter.
        return s_tokenCounter;
    }
}