# =============================================================================
# EXERCICES DE MISE EN PRATIQUE - ANALYSE DE DONNÉES AVEC R
# Formation théorique | Université Laval | 11 mars 2026
# =============================================================================

# INSTRUCTIONS :
# 1. Complétez les zones marquées "# À COMPLÉTER"
# 2. Exécutez votre code ligne par ligne (Ctrl+Entrée ou Cmd+Entrée)
# 3. Consultez les solutions sur le site web en cas de besoin

# JEU DE DONNÉES :
# Nous utiliserons 'donnees_pays.csv' (données mondiales Gapminder 1952-2007)

# =============================================================================
# PRÉPARATION
# =============================================================================

# 1. Charger les bibliothèques nécessaires
library(readr)
library(dplyr)
library(ggplot2)

# 2. Importer les données
# Assurez-vous que le fichier est dans votre dossier de travail
donnees <- read_csv("data/donnees_pays.csv")

# 3. Vérification rapide
dim(donnees)
head(donnees)

# =============================================================================
# EXERCICE 1 : OBJETS ET VECTEURS
# =============================================================================

# 1. Créez un objet 'pays_prefere' (type texte)
# À COMPLÉTER
pays_prefere <- 

# 2. Créez un vecteur 'continents' contenant les 5 noms de continents
# À COMPLÉTER
continents <- 

# 3. Créez un vecteur 'populations' (valeurs numériques au choix)
# À COMPLÉTER
populations <- 

# 4. Vérifiez le type de vos objets avec class()
# À COMPLÉTER


# =============================================================================
# EXERCICE 2 : EXPLORATION DU JEU DE DONNÉES
# =============================================================================

# 1. Affichez les noms des colonnes du tableau 'donnees'
# À COMPLÉTER


# 2. Obtenez un résumé statistique complet des variables
# À COMPLÉTER


# 3. Comptez le nombre de pays uniques dans le dataset
# Indice : utilisez length(unique(donnees$country))
# À COMPLÉTER


# =============================================================================
# EXERCICE 3 : MANIPULATION AVEC DPLYR
# =============================================================================

# Objectif : Créer un sous-ensemble pour l'année 2007

# 1. Filtrez pour l'année 2007, sélectionnez pays/continent/lifeExp, 
#    et triez par espérance de vie décroissante.
# À COMPLÉTER
donnees_2007 <- donnees %>%
  filter(year == ) %>%
  select() %>%
  arrange()

# Visualisez les 6 premiers résultats
head(donnees_2007)

# =============================================================================
# EXERCICE 4 : ANALYSES PAR GROUPE
# =============================================================================

# 1. Calculez l'espérance de vie moyenne par continent en 2007
# À COMPLÉTER
resultat_groupe <- donnees %>%
  filter(year == 2007) %>%
  group_by() %>%
  summarise(moyenne_vie = )

print(resultat_groupe)

# =============================================================================
# EXERCICE 5 : VISUALISATION DE DONNÉES
# =============================================================================

# 1. Histogramme du PIB par habitant en 2007
# À COMPLÉTER
ggplot(donnees %>% filter(year == 2007), aes(x = )) +
  geom_histogram(bins = 20, fill = "#003875", color = "white") +
  labs(title = "Distribution du PIB (2007)") +
  theme_minimal()

# 2. Nuage de points : PIB vs Espérance de vie (avec couleurs par continent)
# À COMPLÉTER
ggplot(donnees %>% filter(year == 2007), 
       aes(x = , y = , color = )) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Relation PIB - Espérance de vie") +
  theme_minimal()

# =============================================================================
# FIN DE L'EXERCICE
# =============================================================================
# Félicitations ! Vous avez complété votre première analyse de données avec R.
