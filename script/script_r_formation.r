# =============================================================================
# INITIATION À L'ANALYSE DES DONNÉES AVEC R
# Formation théorique | Étienne Proulx | Université Laval
# =============================================================================

# Ce script accompagne la présentation et contient tous les exemples de code
# Il est organisé par sections correspondant aux slides de la présentation

# =============================================================================
# 1. INSTALLATION ET CONFIGURATION
# =============================================================================

# IMPORTANT : Avant de commencer, assurez-vous d'avoir installé :
# - R : https://cran.r-project.org/
# - RStudio : https://www.rstudio.com/products/rstudio/download/

# Installation des packages nécessaires (à faire UNE SEULE FOIS)
# Décommentez les lignes ci-dessous si vous devez installer ces packages

# install.packages("tidyverse")  # Collection de packages pour l'analyse
# install.packages("readxl")     # Pour lire les fichiers Excel
# install.packages("janitor")    # Pour nettoyer les données

# Chargement des packages (à faire à CHAQUE session R)
library(ggplot2)  # Pour les graphiques
library(dplyr)    # Pour manipuler les données
library(readr)    # Pour importer des données

# =============================================================================
# 2. R COMME CALCULATRICE - PREMIERS PAS
# =============================================================================

# Opérations de base
2 + 3
10 * 5
15 / 3
sqrt(16)

# Un peu plus complexe
(10 + 5) * 2
2^3  # puissance

# =============================================================================
# 3. CRÉER NOS PREMIERS OBJETS
# =============================================================================

# Créer des objets simples avec l'opérateur <-
film_prefere <- "Dune"
annee_sortie <- 2021
note_imdb <- 8.0

# Voir le contenu des objets (ils apparaissent aussi dans Environment)
film_prefere
annee_sortie
note_imdb

# =============================================================================
# 4. LES VECTEURS : GROUPES DE VALEURS
# =============================================================================

# Créer des vecteurs avec la fonction c() (combine)
films <- c("Dune", "Oppenheimer", "Barbie", "The Zone of Interest", "Killers of the Flower Moon")
annees <- c(2021, 2023, 2023, 2023, 2023)
notes_imdb <- c(8.0, 8.3, 6.8, 7.4, 7.6)

# Explorer nos vecteurs
films
length(films)     # nombre d'éléments
mean(notes_imdb)  # note moyenne

# =============================================================================
# 5. TYPES DE DONNÉES - ATTENTION AUX PIÈGES !
# =============================================================================

# Vérifier le type de nos objets
class(notes_imdb)     # numérique - parfait pour calculer
class(films)          # caractère (texte)
class(c(TRUE, FALSE)) # logique

# PIÈGE FRÉQUENT : coercition automatique
notes_mixtes <- c(8.0, 7.5, "6.8")  # un chiffre écrit en texte
notes_mixtes
class(notes_mixtes)  # tout devient du texte !

# Impossible de calculer maintenant
# mean(notes_mixtes)  # Ceci produira une erreur !

# SOLUTION : convertir les types
notes_numeriques <- as.numeric(notes_mixtes)
notes_numeriques
class(notes_numeriques)
mean(notes_numeriques)  # Maintenant ça marche !

# =============================================================================
# 6. NOTRE PREMIER TABLEAU DE DONNÉES (DATA FRAME)
# =============================================================================

# Un data frame = tableau avec lignes et colonnes
cinema <- data.frame(
  titre = c("Dune", "Oppenheimer", "Barbie", "The Zone of Interest", "Killers of the Flower Moon"),
  annee = c(2021, 2023, 2023, 2023, 2023),
  note = c(8.0, 8.3, 6.8, 7.4, 7.6),
  genre = c("Sci-Fi", "Biographie", "Comédie", "Drame", "Drame")
)

# Regarder notre tableau
cinema

# =============================================================================
# 7. EXPLORER UN DATA FRAME
# =============================================================================

# Informations générales
dim(cinema)       # dimensions (lignes x colonnes)
nrow(cinema)      # nombre de lignes
ncol(cinema)      # nombre de colonnes
names(cinema)     # noms des colonnes

# Aperçu du contenu
head(cinema, 3)   # premières lignes
str(cinema)       # structure détaillée

# =============================================================================
# 8. ACCÉDER AUX COLONNES
# =============================================================================

# Méthode 1 : Avec le symbole $ (RECOMMANDÉ)
cinema$titre
cinema$note
mean(cinema$note)  # note moyenne

# Méthode 2 : Avec les crochets [ ]
cinema[, "titre"]              # par nom
cinema[, 1]                    # par position
cinema[, c("titre", "genre")]  # plusieurs colonnes

# =============================================================================
# 9. LES FONCTIONS : NOS OUTILS
# =============================================================================

# Fonctions statistiques essentielles
mean(cinema$note)      # note moyenne
median(cinema$note)    # note médiane
sd(cinema$note)        # écart-type
min(cinema$note)       # note minimale
max(cinema$note)       # note maximale

# Résumé complet d'une variable
summary(cinema$note)

# Compter les occurrences
table(cinema$genre)    # combien de films par genre ?

# =============================================================================
# 10. GESTION DES DOSSIERS ET FICHIERS
# =============================================================================

# Voir où travaille R en ce moment
getwd()  # "get working directory" = obtenir le dossier de travail

# Voir les fichiers dans le dossier actuel
list.files()

# IMPORTANT : Organisez votre projet comme ceci :
# Mon_Projet_R/
#   ├── code/              # tous vos scripts R
#   ├── data/              # tous vos fichiers CSV, Excel
#   ├── graphs/            # vos graphiques exportés
#   └── outputs/           # vos résultats et rapports

# Changer le dossier de travail (REMPLACEZ par votre propre chemin !)
# setwd("C:/Documents/Mon_Projet_R")   # Windows
# setwd("/Users/nom/Documents/Mon_Projet_R")  # Mac

# Vérifier que ça a marché
# getwd()

# =============================================================================
# 11. CHARGER DE VRAIES DONNÉES - TITANIC
# =============================================================================

# ÉTAPE 1 : Téléchargez les données Titanic
# Lien : https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv
# Sauvegardez le fichier dans votre dossier data/

# ÉTAPE 2 : Chargez les données (ajustez le chemin selon votre organisation)
# titanic <- read.csv("data/titanic.csv")

# Pour cette démonstration, nous utilisons l'URL directe
titanic <- read.csv("https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv")

# Premier coup d'œil
head(titanic, 3)

# =============================================================================
# 12. EXPLORER LA STRUCTURE DES DONNÉES
# =============================================================================

# Informations de base
dim(titanic)          # dimensions (lignes x colonnes)
names(titanic)        # noms des colonnes
nrow(titanic)         # nombre de lignes
ncol(titanic)         # nombre de colonnes

# Structure complète des données
str(titanic)

# Aperçu moderne avec glimpse (dplyr)
library(dplyr)
glimpse(titanic)

# =============================================================================
# 13. RÉSUMÉ STATISTIQUE DES VARIABLES
# =============================================================================

# Résumé statistique de toutes les variables
summary(titanic)

# Ce résumé nous révèle :
# - Moyennes, médianes, quartiles pour les variables numériques
# - Fréquences pour les variables catégorielles
# - Présence de valeurs manquantes (NA's)

# =============================================================================
# 14. GÉRER LES VALEURS MANQUANTES
# =============================================================================

# Compter les valeurs manquantes par colonne
colSums(is.na(titanic))

# Compter les NA dans une colonne spécifique
sum(is.na(titanic$Age))

# Voir quels passagers ont un âge manquant
head(titanic[is.na(titanic$Age), ])

# NOTE : na.rm = TRUE dans les fonctions statistiques ignore les valeurs manquantes

# =============================================================================
# 15. ANALYSE DES VARIABLES INDIVIDUELLES
# =============================================================================

# Variables catégorielles : compter les occurrences
table(titanic$Survived)    # survivants
table(titanic$Pclass)      # classes
table(titanic$Sex)         # sexe

# En pourcentages
prop.table(table(titanic$Survived)) * 100

# Variables numériques
mean(titanic$Age, na.rm = TRUE)     # âge moyen
median(titanic$Age, na.rm = TRUE)   # âge médian
sd(titanic$Age, na.rm = TRUE)       # écart-type
range(titanic$Age, na.rm = TRUE)    # min et max

# Statistiques sur le prix du billet
summary(titanic$Fare)

# =============================================================================
# 16. ANALYSE CROISÉE DE VARIABLES
# =============================================================================

# Croiser deux variables catégorielles
table(titanic$Pclass, titanic$Survived)

# Ajouter les noms de lignes/colonnes pour clarté
table(Classe = titanic$Pclass, Survécu = titanic$Survived)

# =============================================================================
# 17. MANIPULATION DES DONNÉES AVEC DPLYR
# =============================================================================

# Charger dplyr (ou tidyverse)
library(dplyr)

# Le "pipe" operator %>% permet d'enchaîner les opérations
# Lisez %>% comme "puis" ou "ensuite"

# =============================================================================
# 18. SÉLECTIONNER DES COLONNES
# =============================================================================

# Garder seulement certaines colonnes
titanic_simple <- titanic %>%
  select(Survived, Pclass, Sex, Age, Fare)

head(titanic_simple, 3)

# =============================================================================
# 19. FILTRER DES LIGNES
# =============================================================================

# Filtrer les passagers de première classe
premiere_classe <- titanic %>%
  filter(Pclass == 1)

nrow(premiere_classe)  # combien de passagers ?

# Filtres multiples
adultes_survie <- titanic %>%
  filter(Age >= 18, Survived == 1)

nrow(adultes_survie)

# Opérateurs de filtre : ==, !=, >, <, >=, <=, %in%

# =============================================================================
# 20. CRÉER DE NOUVELLES VARIABLES
# =============================================================================

# Créer une variable catégorielle âge
titanic <- titanic %>%
  mutate(groupe_age = ifelse(Age < 18, "Enfant", "Adulte"))

table(titanic$groupe_age)

# Créer plusieurs variables en une fois
titanic <- titanic %>%
  mutate(
    prix_eleve = ifelse(Fare > 50, "Cher", "Abordable"),
    taille_famille = Siblings.Spouses.Aboard + Parents.Children.Aboard + 1
  )

# Visualiser les nouvelles variables
titanic %>%
  select(groupe_age, prix_eleve, taille_famille) %>%
  head()

# =============================================================================
# 21. NETTOYAGE DE DONNÉES AVANCÉ
# =============================================================================

# Remplacer les valeurs manquantes dans Age par la médiane
titanic <- titanic %>%
  mutate(Age = ifelse(is.na(Age),                    # SI l'âge est manquant
                      median(Age, na.rm = TRUE),      # ALORS utiliser la médiane
                      Age))                           # SINON garder l'âge original

# Vérifier que le remplacement a fonctionné
sum(is.na(titanic$Age))  # devrait être 0

# Standardiser les noms de colonnes (optionnel)
titanic <- titanic %>%
  rename(
    survie = Survived,
    classe = Pclass,
    sexe = Sex
  )

# =============================================================================
# 22. GROUPER ET RÉSUMER
# =============================================================================

# Statistiques par groupe
titanic %>%
  group_by(classe) %>%
  summarise(
    nb_passagers = n(),
    nb_survivants = sum(survie),
    taux_survie = round(mean(survie) * 100, 1),
    age_moyen = round(mean(Age, na.rm = TRUE), 1)
  )

# Groupements multiples : analyser par classe ET sexe
resume_complet <- titanic %>%
  group_by(classe, sexe) %>%
  summarise(
    nb_passagers = n(),
    taux_survie = round(mean(survie) * 100, 1),
    .groups = "drop"  # évite les warnings
  )

resume_complet

# =============================================================================
# 23. GRAPHIQUES AVEC GGPLOT2
# =============================================================================

# Charger ggplot2
library(ggplot2)

# =============================================================================
# 24. GRAPHIQUES EN BARRES
# =============================================================================

# Nombre de passagers par classe
ggplot(titanic, aes(x = factor(classe))) +
  geom_bar()

# Même graphique, mais plus joli
ggplot(titanic, aes(x = factor(classe))) +
  geom_bar(fill = "steelblue", color = "white") +
  labs(
    title = "Répartition des passagers par classe",
    x = "Classe", 
    y = "Nombre de passagers"
  ) +
  theme_minimal()

# =============================================================================
# 25. GRAPHIQUES EMPILÉS : DEUX VARIABLES
# =============================================================================

# Survivants par classe (barres empilées)
ggplot(titanic, aes(x = factor(classe), fill = factor(survie))) +
  geom_bar() +
  labs(
    title = "Survivants par classe sur le Titanic",
    x = "Classe", 
    y = "Nombre de passagers",
    fill = "Survécu"
  ) +
  theme_minimal()

# =============================================================================
# 26. GRAPHIQUES EN PROPORTIONS
# =============================================================================

# Proportions plutôt que nombres absolus
ggplot(titanic, aes(x = factor(classe), fill = factor(survie))) +
  geom_bar(position = "fill") +
  labs(
    title = "Taux de survie par classe",
    x = "Classe", 
    y = "Proportion",
    fill = "Survécu"
  ) +
  theme_minimal()

# =============================================================================
# 27. HISTOGRAMMES : DISTRIBUTION D'UNE VARIABLE
# =============================================================================

# Distribution des âges
ggplot(titanic, aes(x = Age)) +
  geom_histogram(bins = 20, fill = "lightblue", color = "white", alpha = 0.7) +
  labs(
    title = "Distribution des âges sur le Titanic",
    x = "Âge", 
    y = "Nombre de passagers"
  ) +
  theme_minimal()

# =============================================================================
# 28. NUAGES DE POINTS
# =============================================================================

# Relation âge-prix du billet
ggplot(titanic, aes(x = Age, y = Fare)) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Âge vs Prix du billet",
    x = "Âge", 
    y = "Prix du billet"
  ) +
  theme_minimal()

# Ajouter la survie comme couleur
ggplot(titanic, aes(x = Age, y = Fare, color = factor(survie))) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Âge vs Prix du billet selon la survie",
    x = "Âge", 
    y = "Prix du billet",
    color = "Survécu"
  ) +
  theme_minimal()

# =============================================================================
# 29. SAUVEGARDER NOTRE TRAVAIL
# =============================================================================

# Sauvegarder le dernier graphique
# ggsave("age_prix_survie.png", width = 10, height = 6)

# Sauvegarder des données nettoyées
# write.csv(titanic, "titanic_nettoye.csv", row.names = FALSE)

# Sauvegarder nos résultats d'analyse
# write.csv(resume_complet, "analyse_survie_classe_sexe.csv", row.names = FALSE)

# =============================================================================
# 30. EXERCICES PRATIQUES POUR LES ÉTUDIANTS
# =============================================================================

# EXERCICE 1 : Analyse de base
# 1. Créez un graphique en barres du nombre de passagers par sexe
# 2. Calculez l'âge moyen des hommes et des femmes séparément

# EXERCICE 2 : Analyse avancée
# 1. Créez une nouvelle variable "adulte_enfant" (seuil : 16 ans)
# 2. Analysez le taux de survie par groupe d'âge et par sexe
# 3. Créez un graphique approprié pour visualiser ces résultats

# EXERCICE 3 : À vous de jouer !
# 1. Explorez la variable "taille_famille"
# 2. Les familles nombreuses avaient-elles plus de chances de survie ?
# 3. Créez un graphique pour illustrer votre réponse

# =============================================================================
# AIDE-MÉMOIRE : FONCTIONS ESSENTIELLES
# =============================================================================

# EXPLORATION :
# - str(), summary(), glimpse(), head(), names()
# - class(), typeof(), length(), nrow(), ncol()

# STATISTIQUES :
# - mean(), median(), sd(), min(), max(), range()
# - table(), prop.table()

# MANIPULATION (dplyr) :
# - select(), filter(), mutate(), group_by(), summarise()

# GRAPHIQUES (ggplot2) :
# - ggplot(), aes()
# - geom_bar(), geom_histogram(), geom_point()
# - labs(), theme_minimal()

# =============================================================================
# RESSOURCES POUR CONTINUER
# =============================================================================

# Documentation :
# - ?fonction (ex: ?mean)
# - help.search("mot-clé")

# Sites web :
# - R Documentation : https://www.rdocumentation.org/
# - RStudio Cheatsheets : https://posit.co/resources/cheatsheets/
# - R for Data Science : https://r4ds.hadley.nz/

# Communauté :
# - Stack Overflow (tag: r)
# - RStudio Community : https://community.rstudio.com/

# =============================================================================
# FIN DU SCRIPT
# =============================================================================

# Félicitations ! Vous avez maintenant les bases pour :
# 1. Charger et explorer des données
# 2. Les nettoyer et les manipuler
# 3. Faire des analyses descriptives
# 4. Créer des visualisations
# 5. Sauvegarder vos résultats

# N'hésitez pas à expérimenter avec vos propres données !
# La pratique est la clé pour maîtriser R.

print("🎉 Script terminé avec succès ! Bonne analyse ! 🎉")