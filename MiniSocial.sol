// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {

    // Structure Post : un message + l'adresse de l'auteur
    struct Post {
        string message;
        address author;
    }
  // Tableau dynamique qui stocke tous les posts publiés
    Post[] public posts;  
    // Fonction de publication : crée un Post et l'ajoute au tableau
    function publishPost(string memory _message) public {
        Post memory newPost = Post(_message, msg.sender);
        posts.push(newPost);
    }
    // Fonction de consultation : retourne le message et l'auteur d'un post
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Index invalide");
        Post memory p = posts[index];
        return (p.message, p.author);
    }
    // Retourne le nombre total de messages publiés
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}