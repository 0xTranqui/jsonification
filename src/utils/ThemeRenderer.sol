// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {Strings} from "../../lib/openzeppelin-contracts/contracts/utils/Strings.sol";
import {Base64} from "../../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

/// NFT metadata library for rendering metadata associated with editions
library ThemeRenderer {

    // function createMetadataEdition(
    //     string memory name,
    //     string memory description,
    //     string memory imageURI,
    //     string memory animationURI,
    //     uint256 tokenOfEdition,
    //     uint256 editionSize
    // ) internal pure returns (string memory) {
    //     string memory _tokenMediaData = tokenMediaData(
    //         imageURI,
    //         animationURI
    //     );
    //     bytes memory json = createMetadataJSON(
    //         name,
    //         description,
    //         _tokenMediaData,
    //         tokenOfEdition,
    //         editionSize
    //     );
    //     return encodeMetadataJSON(json);
    // }

    // function encodeContractURIJSON(
    //     string memory name,
    //     string memory description,
    //     string memory imageURI,
    //     string memory animationURI,
    //     uint256 royaltyBPS,
    //     address royaltyRecipient
    // ) internal pure returns (string memory) {
    //     bytes memory imageSpace = bytes("");
    //     if (bytes(imageURI).length > 0) {
    //         imageSpace = abi.encodePacked('", "image": "', imageURI);
    //     }
    //     bytes memory animationSpace = bytes("");
    //     if (bytes(animationURI).length > 0) {
    //         animationSpace = abi.encodePacked('", "animation_url": "', animationURI);
    //     }

    //     return
    //         string(
    //             encodeMetadataJSON(
    //                 abi.encodePacked(
    //                     '{"name": "',
    //                     name,
    //                     '", "description": "',
    //                     description,
    //                     // this is for opensea since they don't respect ERC2981 right now
    //                     '", "seller_fee_basis_points": ',
    //                     Strings.toString(royaltyBPS),
    //                     ', "fee_recipient": "',
    //                     Strings.toHexString(uint256(uint160(royaltyRecipient)), 20),
    //                     imageSpace,
    //                     animationSpace,
    //                     '"}'
    //                 )
    //             )
    //         );
    // }



    //     string memory backgroundString,
    //     string memory primaryHex,
    //     string memory secondaryHex,
    //     string memory tertiaryHex,
    //     string memory highlightHex,
    //     string memory navigation,
    //     string memory heading,
    //     string memory subHeading,
    //     string memory body,
    //     string memory caption,
    //     string memory colorHex,
    //     uint256 spread,
    //     uint256 mainRadius,
    //     uint256 buttonRadius
    function encodeThemeJSON(
        string memory backgroundString,
        string memory primaryHex,
        string memory secondaryHex,
        string memory tertiaryHex
    ) internal pure returns (string memory) {
        // bytes memory imageSpace = bytes("");
        // if (bytes(imageURI).length > 0) {
        //     imageSpace = abi.encodePacked('", "image": "', imageURI);
        // }
        // bytes memory animationSpace = bytes("");
        // if (bytes(animationURI).length > 0) {
        //     animationSpace = abi.encodePacked('", "animation_url": "', animationURI);
        // }

        return
            string(
                encodeMetadataJSON(
                    abi.encodePacked(
                        '{"background": "',
                        backgroundString,
                        '", "primaryHex": "',
                        primaryHex,
                        '", "secondaryHex": ',
                        secondaryHex,
                        ', "tertiaryHex": "',
                        tertiaryHex,
                        '"}'
                    )
                )
            );        
            // string(
            //     encodeMetadataJSON(
            //         abi.encodePacked(
            //             '{"name": "',
            //             name,
            //             '", "description": "',
            //             description,
            //             // this is for opensea since they don't respect ERC2981 right now
            //             '", "seller_fee_basis_points": ',
            //             Strings.toString(royaltyBPS),
            //             ', "fee_recipient": "',
            //             Strings.toHexString(uint256(uint160(royaltyRecipient)), 20),
            //             imageSpace,
            //             animationSpace,
            //             '"}'
            //         )
            //     )
            // );
    }    

    // /// Function to create the metadata json string for the nft edition
    // /// @param name Name of NFT in metadata
    // /// @param description Description of NFT in metadata
    // /// @param mediaData Data for media to include in json object
    // /// @param tokenOfEdition Token ID for specific token
    // /// @param editionSize Size of entire edition to show
    // function createMetadataJSON(
    //     string memory name,
    //     string memory description,
    //     string memory mediaData,
    //     uint256 tokenOfEdition,
    //     uint256 editionSize
    // ) internal pure returns (bytes memory) {
    //     bytes memory editionSizeText;
    //     if (editionSize > 0) {
    //         editionSizeText = abi.encodePacked(
    //             "/",
    //             Strings.toString(editionSize)
    //         );
    //     }
    //     return
    //         abi.encodePacked(
    //             '{"name": "',
    //             name,
    //             " ",
    //             Strings.toString(tokenOfEdition),
    //             editionSizeText,
    //             '", "',
    //             'description": "',
    //             description,
    //             '", "',
    //             mediaData,
    //             'properties": {"number": ',
    //             Strings.toString(tokenOfEdition),
    //             ', "name": "',
    //             name,
    //             '"}}'
    //         );
    // }

    /// Encodes the argument json bytes into base64-data uri format
    /// @param json Raw json to base64 and turn into a data-uri
    function encodeMetadataJSON(bytes memory json)
        internal
        pure
        returns (string memory)
    {
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(json)
                )
            );
    }

    // /// Generates edition metadata from storage information as base64-json blob
    // /// Combines the media data and metadata
    // /// @param imageUrl URL of image to render for edition
    // /// @param animationUrl URL of animation to render for edition
    // function tokenMediaData(
    //     string memory imageUrl,
    //     string memory animationUrl
    // ) internal pure returns (string memory) {
    //     bool hasImage = bytes(imageUrl).length > 0;
    //     bool hasAnimation = bytes(animationUrl).length > 0;
    //     if (hasImage && hasAnimation) {
    //         return
    //             string(
    //                 abi.encodePacked(
    //                     'image": "',
    //                     imageUrl,
    //                     '", "animation_url": "',
    //                     animationUrl,
    //                     '", "'
    //                 )
    //             );
    //     }
    //     if (hasImage) {
    //         return string(abi.encodePacked('image": "', imageUrl, '", "'));
    //     }
    //     if (hasAnimation) {
    //         return
    //             string(
    //                 abi.encodePacked('animation_url": "', animationUrl, '", "')
    //             );
    //     }

    //     return "";
    // }


    // function createTheme(
    //     string memory backgroundString,
    //     string memory primaryHex,
    //     string memory secondaryHex,
    //     string memory tertiaryHex,
    //     string memory highlightHex,
    //     string memory navigation,
    //     string memory heading,
    //     string memory subHeading,
    //     string memory body,
    //     string memory caption,
    //     string memory colorHex,
    //     uint256 spread,
    //     uint256 mainRadius,
    //     uint256 buttonRadius
    // ) internal pure returns (string memory) {
    //     bytes memory json = createThemeJSON(
    //         backgroundString,
    //         primaryHex,
    //         secondaryHex,
    //         tertiaryHex,
    //         highlightHex,
    //         navigation,
    //         heading,
    //         subHeading,
    //         body,
    //         caption,
    //         colorHex,
    //         spread,
    //         mainRadius,
    //         buttonRadius
    //     );
    //     return encodeThemeJSON(json);
    // }

    // function createThemeJSON(
    //     string memory backgroundString,
    //     string memory primaryHex,
    //     string memory secondaryHex,
    //     string memory tertiaryHex,
    //     string memory highlightHex,
    //     string memory navigation,
    //     string memory heading,
    //     string memory subHeading,
    //     string memory body,
    //     string memory caption,
    //     string memory colorHex,
    //     uint256 spread,
    //     uint256 mainRadius,
    //     uint256 buttonRadius
    // ) internal pure returns (bytes memory) {
    //     return 
    //         abi.encodePacked(
    //             '{"background": "',
    //             backgroundString,
    //             " ",
    //             'colors:" {"primaryHex": ',
    //             primaryHex,
    //             ', "secondaryHex": "',
    //             secondaryHex,
    //             ', "tertiaryHex": "',
    //             tertiaryHex,
    //             ', "highlightHex": "',
    //             highlightHex,
    //             '"}, ',
    //             'fonts:" {"navigation" : ',
    //             navigation,
    //             ', "heading": "',
    //             heading,
    //             ', "subHeading": "',
    //             subHeading,
    //             ', "body": "',
    //             body,
    //             ', "caption": "',
    //             caption,
    //             '"}, ',
    //             'dropShadow:" {"colorHex": ',
    //             colorHex,
    //             ', "spread": "',
    //             Strings.toString(spread),
    //             "px"'"}, ',
    //             'cornerRadius:" {"mainRadius": ',
    //             Strings.toString(mainRadius),
    //             "px"', "buttonRadius": "',
    //             Strings.toString(buttonRadius),
    //             "px"'"}}'
    //     );
    // }    

    // /// Encodes the argument json bytes into base64-data uri format
    // /// @param json Raw json to base64 and turn into a data-uri
    // function encodeThemeJSON(bytes memory json)
    //     internal
    //     pure
    //     returns (string memory)
    // {
    //     return
    //         string(
    //             abi.encodePacked(
    //                 "data:application/json;base64,",
    //                 Base64.encode(json)
    //             )
    //         );
    // }    
}