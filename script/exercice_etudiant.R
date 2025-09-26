# =============================================================================
# EXERCICES PRATIQUES - INITIATION À R
# Formation théorique | Étienne Proulx | Université Laval
# =============================================================================

# 📋 INSTRUCTIONS :
# 1. Lisez les instructions pour chaque exercice
# 2. Complétez les zones marquées "# À COMPLÉTER"
# 3. Exécutez votre code ligne par ligne (Ctrl+Entrée)
# 4. Vérifiez vos résultats et consultez les solutions sur le site si besoin

# 📖 DONNÉES :
# Nous utiliserons le fichier 'donnees_pays.csv' qui contient des données sur
# l'espérance de vie, la population et le PIB de différents pays (1952-2007)

# =============================================================================
# PRÉPARATION : DÉFINIR LE DOSSIER DE TRAVAIL ET CHARGER LES DONNÉES
# =============================================================================

# IMPORTANT : Assurez-vous d'avoir placé les fichiers dans le même dossier :
# - exercice_etudiant.R (ce script)
# - donnees_pays.csv (les données)

# 1. Vérifiez votre dossier de travail actuel
# À COMPLÉTER - utilisez getwd() pour voir où R travaille actuellement
getwd()

# 2. Si nécessaire, changez vers le bon dossier
# Décommentez et modifiez la ligne suivante avec le chemin vers votre dossier :
# setwd("C:/Users/VotreNom/Desktop/MonDossier")  # Windows
# setwd("/Users/VotreNom/Desktop/MonDossier")    # Mac
# setwd("/home/VotreNom/Desktop/MonDossier")     # Linux

# 3. Vérifiez que les fichiers sont présents
# À COMPLÉTER - utilisez list.files() pour voir les fichiers dans le dossier
list.files()

# Vous devriez voir 'donnees_pays.csv' dans la liste !

# 4. Chargez les packages nécessaires
# À COMPLÉTER - chargez readr pour lire les fichiers CSV
library(readr)

# À COMPLÉTER - chargez dplyr pour manipuler les données
library(dplyr)

# À COMPLÉTER - chargez ggplot2 pour les graphiques
library(ggplot2)

# 5. Chargez les données depuis le fichier CSV
# À COMPLÉTER - utilisez read_csv() pour charger 'donnees_pays.csv'
donnees <- read_csv("donnees_pays.csv")

# Avez vous un message d'erreur?? Si oui, réfléchissez au chemin d'accès vers le fichier

# Vérifiez que les données sont bien chargées
print("✅ Données chargées avec succès !")
print(paste("Nombre de lignes:", nrow(donnees)))
print(paste("Nombre de colonnes:", ncol(donnees)))

# =============================================================================
# EXERCICE 1 : PREMIERS PAS AVEC LES OBJETS
# =============================================================================

# Objectif : Créer des objets et vecteurs pour vous familiariser avec R

# 1. Créez un objet 'pays_prefere' avec le nom de votre pays favori
# À COMPLÉTER
pays_prefere <-

# 2. Créez un vecteur 'continents' avec les 5 continents principaux
# Indice : utilisez la fonction c() pour combiner plusieurs valeurs
# À COMPLÉTER
continents <-

# 3. Créez un vecteur 'populations' avec des populations fictives (en millions)
# Exemple : c(100, 200, 300, 400, 500)
# À COMPLÉTER
populations <-

# 4. Vérifiez les types de données avec class()
# À COMPLÉTER - vérifiez le type de pays_prefere
class(pays_prefere)

# À COMPLÉTER - vérifiez le type de continents
class()

# À COMPLÉTER - vérifiez le type de populations
class()



# =============================================================================
# EXERCICE 2 : EXPLORER LE DATASET
# =============================================================================

# Objectif : Explorer les données que nous avons chargées

# Les données sont déjà chargées dans l'objet 'donnees' !


# 1. Explorez la structure des données
# À COMPLÉTER - utilisez dim() pour voir les dimensions


# À COMPLÉTER - utilisez head() pour voir les premières lignes


# À COMPLÉTER - utilisez str() pour voir la structure détaillée


# À COMPLÉTER - utilisez summary() pour voir le résumé statistique


# 2. Identifiez les variables disponibles
# À COMPLÉTER - utilisez names() pour voir les noms des colonnes


# =============================================================================
# EXERCICE 3 : ANALYSE DESCRIPTIVE
# =============================================================================

# Objectif : Analyser les variables avec des fonctions statistiques

# 1. Calculez l'espérance de vie moyenne mondiale
# Indice : utilisez mean() avec donnees$lifeExp
# À COMPLÉTER
esperance_moyenne <-

# 2. Trouvez le PIB par habitant minimum et maximum
# Indice : utilisez min() et max() avec donnees$gdpPercap
# À COMPLÉTER - PIB minimum
pib_min <-

# À COMPLÉTER - PIB maximum
pib_max <-

# 3. Comptez combien de pays uniques sont dans le dataset
# Indice : utilisez length(unique()) avec donnees$country
# À COMPLÉTER
nombre_pays <-

# 4. Identifiez les années disponibles dans les données
# À COMPLÉTER - utilisez unique() avec donnees$year


# À COMPLÉTER - utilisez sort(unique()) pour les avoir en ordre



# =============================================================================
# EXERCICE 4 : MANIPULATION AVEC DPLYR
# =============================================================================

# Objectif : Filtrer, sélectionner et transformer les données

# Chargez le package dplyr
# À COMPLÉTER


# 1. Filtrez les données pour l'année 2007 seulement
# Indice : donnees %>% filter(year == 2007)
# À COMPLÉTER
donnees_2007 <- donnees %>%


# 2. Sélectionnez uniquement les colonnes pays, continent et espérance de vie
# Indice : utilisez select(country, continent, lifeExp)
# À COMPLÉTER
donnees_select <- donnees_2007 %>%


# 3. Créez une nouvelle variable 'esperance_vie_mois' (en mois au lieu d'années)
# Indice : utilisez mutate(esperance_vie_mois = lifeExp * 12)
# À COMPLÉTER
donnees_mois <- donnees_select %>%


# 4. Triez les pays par espérance de vie décroissante
# Indice : utilisez arrange(desc(lifeExp))
# À COMPLÉTER
donnees_triees <- donnees_mois %>%


# Visualisez le résultat
head(donnees_triees)

# =============================================================================
# EXERCICE 5 : ANALYSES PAR GROUPE
# =============================================================================

# Objectif : Utiliser group_by() et summarise() pour des analyses par continent

# 1. Calculez l'espérance de vie moyenne par continent en 2007
# Indice : group_by(continent) %>% summarise(esperance_moy = mean(lifeExp))
# À COMPLÉTER
esperance_continent <- donnees %>%
  filter(year == 2007) %>%



# Visualisez le résultat
print(esperance_continent)

# 2. Trouvez le PIB par habitant médian par continent
# Indice : utilisez median() au lieu de mean()
# À COMPLÉTER
pib_continent <- donnees %>%
  filter(year == 2007) %>%



# Visualisez le résultat
print(pib_continent)

# 3. Comptez le nombre de pays par continent
# Indice : utilisez summarise(nombre_pays = n())
# À COMPLÉTER
nb_pays <- donnees %>%
  filter(year == 2007) %>%



# Visualisez le résultat
print(nb_pays)

# 4. Identifiez le continent avec la plus haute espérance de vie moyenne
# Indice : utilisez arrange(desc(esperance_moy)) %>% head(1)
# À COMPLÉTER
continent_max_esperance <- esperance_continent %>%



# Visualisez le résultat
print(continent_max_esperance)

# =============================================================================
# EXERCICE 6 : VISUALISATIONS
# =============================================================================

# Objectif : Créer des graphiques pour explorer les tendances

# Chargez le package ggplot2
# À COMPLÉTER


# Préparez les données pour 2007
donnees_2007 <- donnees %>% filter(year == 2007)

# 1. Créez un graphique en barres de l'espérance de vie par continent
# Structure :
# donnees %>%
#   group_by(continent) %>%
#   summarise(esperance_moy = mean(lifeExp)) %>%
#   ggplot(aes(x = continent, y = esperance_moy)) +
#   geom_col() +
#   labs(title = "Titre", x = "X", y = "Y")

# À COMPLÉTER
graphique_barres <- donnees_2007 %>%







# Affichez le graphique
print(graphique_barres)

# 2. Créez un histogramme du PIB par habitant en 2007
# Structure : ggplot(data, aes(x = variable)) + geom_histogram()
# À COMPLÉTER
histogramme_pib <- ggplot(donnees_2007, aes()) +




# Affichez le graphique
print(histogramme_pib)

# 3. Créez un nuage de points PIB vs espérance de vie
# Structure : ggplot(data, aes(x = var1, y = var2)) + geom_point()
# À COMPLÉTER
nuage_points <- ggplot(donnees_2007, aes()) +




# Affichez le graphique
print(nuage_points)

# 4. Ajoutez des couleurs par continent au nuage de points
# Indice : ajoutez 'color = continent' dans aes()
# À COMPLÉTER
nuage_couleurs <- ggplot(donnees_2007, aes()) +




# Affichez le graphique
print(nuage_couleurs)

# =============================================================================
# EXERCICE BONUS : ANALYSE TEMPORELLE
# =============================================================================

# Objectif : Explorer l'évolution dans le temps

# 1. Calculez l'évolution de l'espérance de vie moyenne mondiale par année
# À COMPLÉTER
evolution_annuelle <- donnees %>%



# Visualisez le résultat
print(evolution_annuelle)

# 2. Identifiez le pays avec la plus forte croissance d'espérance de vie (1952-2007)
# Indice : filtrez pour 1952 et 2007, puis calculez la différence
# À COMPLÉTER
croissance_pays <- donnees %>%
  filter(year %in% c(1952, 2007)) %>%





# Visualisez les premiers résultats
print(head(croissance_pays))

# 3. Créez un graphique linéaire de l'évolution du PIB moyen par continent
# Structure : geom_line() au lieu de geom_point()
# À COMPLÉTER
evolution_pib <- donnees %>%







# Affichez le graphique
print(evolution_pib)

# =============================================================================
# 🎉 FÉLICITATIONS !
# =============================================================================

# Vous avez terminé tous les exercices !
# N'hésitez pas à :
# - Expérimenter avec d'autres variables
# - Essayer de nouveaux types de graphiques
# - Explorer d'autres datasets avec data()
# - Consulter les solutions sur le site web si besoin

# 📚 RESSOURCES UTILES :
# - Aide R : ?nom_fonction (ex: ?mean)
# - Documentation ggplot2 : https://ggplot2.tidyverse.org/
# - Cheat sheets RStudio : https://www.rstudio.com/resources/cheatsheets/