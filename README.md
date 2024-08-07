# AnimeList 

Application mobile permettant d'avoir le référencement de tous les animés existants. Il est possible de faire une recherche par filtre.
L'application permet de mettre en favoris les animés pour qu'ils soient consultables hors-ligne. Le front fait appel à une API déjà existante.

# Lancement de l'application

dart run build_runner build --delete-conflicting-outputs

flutter run 

# Visualisation

## Page accueil

La navbar permet par ordre de 1- acceder aux favoris, 2- page precedente, 3- page suivante, 4- filtrer les animes

<img src="public/accueil_refresh.jpg" width="150"/>
<img src="public/accueil_pas_internet.jpg" width="150"/>
<img src="public/accueil.jpg" width="150"/>
<img src="public/acceuil_aucune_données.jpg" width="150"/>

## Page info

En cliquant sur le coeur, on peut mettre en favoris l'anime

<img src="public/infos.jpg" width="150"/>


## Page Filtre

filtre du score moyen , type de média, nom de l'animé, trier dans l'ordre (croissant et décroissant du titre, ou croissant ou décroissant de la moyenne)

<img src="public/filtre.jpg" width="150"/>

## Page Favoris

Retirer des favoris un animé et annoter un animé avec un texte sans contrainte de taille.

<img src="public/favoris_aucune_données.jpg" width="150"/>
<img src="public/favoris_liste.jpg" width="150"/>
<img src="public/favoris_infos.jpg" width="150"/>

# API utilisée

## Docs

https://docs.api.jikan.moe/#tag/anime/operation/getAnimeSearch

## Requete basique

https://api.jikan.moe/v4/anime


# Organisation du projet

- Cubit: regroupe toutes les blocs/cubit du projet avec leurs states

- Views: Regroupe les vues principales de l'application

- Widget: Tous les widgets réutilisables dans l'appli

- Services: Tous les appels dans l'appli, il en existe deux:
	- Les appels à l'API (récupére les animes ...) 
	- Les appels à la base de données locale (Animés mis en favoris)
