# plante.io - Contexte projet

## Vision

`plante.io` est une application qui transforme les plantes d'interieur en compagnons vivants que l'on peut suivre, faire progresser et voir grandir dans le temps.

L'idee centrale est simple : l'utilisateur prend en photo ses plantes, l'application les identifie, leur donne une fiche de suivi, puis les fait evoluer au fil des soins, des nouvelles photos et des signes reels de croissance.

Le produit se situe entre :

- une app de reconnaissance de plantes
- un journal de croissance
- un Tamagotchi calme et reel
- une collection type creature/Pokemon
- un assistant de soin personnalise

## Proposition de valeur

Pour les personnes qui ont des plantes chez elles, `plante.io` rend le soin plus motivant, plus affectif et plus visuel.

Au lieu de seulement recevoir des rappels d'arrosage, l'utilisateur voit ses plantes progresser, gagner de l'XP, debloquer des stades de maturite, et construire une histoire photo dans le temps.

## Experience cible

1. L'utilisateur ajoute une plante.
2. Il prend ou importe une photo.
3. L'application propose une identification : espece, famille, nom courant.
4. L'utilisateur valide ou corrige.
5. Il donne un nom a sa plante.
6. La plante rejoint sa collection.
7. Au fil du temps, l'utilisateur ajoute de nouvelles photos.
8. L'application detecte ou aide a confirmer des progres : nouvelle feuille, croissance, floraison, rempotage, bouture, meilleure sante.
9. La plante gagne de l'XP et change de stade.

## MVP web app

Le premier objectif est de construire une web app simple, testable rapidement, probablement avec Rails.

Fonctionnalites prioritaires :

- compte utilisateur
- creation d'une plante
- upload d'une photo
- nom personnalise de la plante
- espece renseignee manuellement dans un premier temps
- fiche plante
- galerie/timeline de photos
- niveau et XP simples
- journal d'evenements : arrosage, rempotage, nouvelle feuille, observation
- tableau de bord avec toutes les plantes

Fonctionnalites IA possibles dans un second temps :

- identification automatique de l'espece depuis une photo
- detection de signes de sante
- comparaison entre deux photos
- suggestion de stade de maturite
- generation de conseils de soin personnalises

## Positionnement IA

L'IA doit etre utile sans etre magique au debut.

Approche recommandee :

- commencer avec des champs manuels et des validations utilisateur
- ajouter une couche d'assistance IA ensuite
- garder l'utilisateur dans la boucle quand la certitude est faible
- eviter de promettre une mesure parfaite de la croissance ou de la maturite

Exemple :

- "Je pense que c'est un Monstera deliciosa. Tu confirmes ?"
- "On dirait qu'une nouvelle feuille est apparue depuis la derniere photo."
- "Ta plante semble avoir gagne en volume, veux-tu lui attribuer un bonus de croissance ?"

## Gamification

La gamification doit rester douce et compatible avec le rythme naturel des plantes.

Idees :

- XP pour les actions de soin
- bonus pour les nouvelles photos
- bonus pour les signes de croissance
- badges : premiere nouvelle feuille, premiere bouture, rempotage, floraison
- stades : bouture, jeune pousse, plante etablie, plante mature, plante majestueuse
- raretes ou traits speciaux, uniquement si cela sert l'attachement utilisateur

Attention : eviter de rendre l'app anxiogène. Les plantes poussent lentement, parfois elles stagnent, et c'est normal.

## Objets principaux

### User

Represente une personne qui utilise l'application.

Champs possibles :

- email
- password
- name
- avatar

### Plant

Represente une plante appartenant a un utilisateur.

Champs possibles :

- user_id
- nickname
- species_name
- common_name
- description
- level
- xp
- growth_stage
- acquired_at
- location_name

### PlantPhoto

Represente une photo ajoutee a une plante.

Champs possibles :

- plant_id
- image
- taken_at
- notes
- ai_analysis_status
- ai_species_guess
- ai_health_summary

### PlantEvent

Represente un evenement dans la vie de la plante.

Champs possibles :

- plant_id
- event_type
- title
- notes
- xp_delta
- occurred_at

Types possibles :

- watering
- misting
- repotting
- pruning
- new_leaf
- flowering
- propagation
- photo_update
- observation

## Stack envisagee

Stack initiale naturelle pour le profil projet :

- Ruby on Rails
- PostgreSQL
- Active Storage pour les photos
- Tailwind CSS
- Hotwire/Turbo pour aller vite
- React seulement pour les interactions qui le justifient

Option possible :

- Rails API + React frontend plus tard, si l'interface devient vraiment riche
- React Native ou Expo plus tard pour mobile

Recommandation actuelle :

Commencer avec un Rails monolithique moderne, Tailwind et Hotwire. C'est le chemin le plus rapide pour valider le produit, les modeles et les workflows avant d'investir dans une app mobile.

## Ambiance produit

Le produit doit etre :

- doux
- vivant
- calme
- collectionnable
- un peu ludique
- jamais culpabilisant

L'application doit donner envie d'ouvrir sa collection de plantes comme on regarde un petit monde qui pousse chez soi.

## Questions ouvertes

- Le produit est-il d'abord un journal personnel ou une collection sociale ?
- Les plantes peuvent-elles etre partagees publiquement ?
- Y aura-t-il des classements, ou faut-il eviter la competition ?
- Comment gerer les plantes malades sans rendre l'experience triste ou punitive ?
- Quelle precision IA est necessaire pour que le produit soit fun ?
- Faut-il une dimension calendrier/rappels des le MVP ?
- Le nom final est-il `plante.io` ou un nom plus disponible juridiquement ?

## Premiere roadmap

### Phase 1 - Prototype Rails

- initialiser le projet Rails
- installer Tailwind
- creer les modeles User, Plant, PlantPhoto, PlantEvent
- construire les pages principales
- permettre l'upload de photos
- calculer XP et niveaux simplement

### Phase 2 - Experience produit

- designer la fiche plante
- ajouter les stades de croissance
- ajouter un journal visuel
- creer quelques badges
- ameliorer le dashboard collection

### Phase 3 - IA assistee

- identifier l'espece depuis une photo
- proposer un resume de sante
- suggerer des evenements detectes
- comparer deux photos dans le temps

### Phase 4 - Mobile

- transformer les apprentissages web en app mobile
- evaluer Expo/React Native
- garder Rails comme backend si le modele marche bien

## Principe directeur

Construire d'abord un produit attachant et utile avec peu d'IA, puis ajouter l'IA la ou elle augmente vraiment la magie.
