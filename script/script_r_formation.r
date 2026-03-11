# =============================================================================
# INITIATION À L'ANALYSE DES DONNÉES AVEC R
# Formation théorique | Étienne Proulx | Université Laval
# Session : 11 mars 2026
# =============================================================================

# Ce script accompagne la formation et contient tous les exemples vus en classe.
# Il est conçu pour être exécuté étape par étape.

# =============================================================================
# 1. PRÉPARATION ET PACKAGES
# =============================================================================

# Installation (si nécessaire)
# install.packages("tidyverse")
# install.packages("wordcloud")

# Chargement des bibliothèques
library(tidyverse) # Inclut ggplot2, dplyr, readr, etc.
library(wordcloud) # Pour l'analyse qualitative

# =============================================================================
# 2. FONDATIONS : OBJETS ET CALCULS
# =============================================================================

# R comme calculatrice
(10 + 5) * 2
sqrt(16)
2^3

# Création d'objets 
film_prefere <- "Dune"
annee_sortie <- 2021
note_imdb <- 8.0

# Vecteurs (Groupes de valeurs)
films <- c("Dune", "Oppenheimer", "Barbie")
annees <- c(2021, 2023, 2023)
notes <- c(8.0, 8.3, 6.8)

# Statistiques de base sur vecteurs
mean(notes)   # Moyenne
length(films) # Nombre d'éléments

# Types de données et conversion
class(notes) # "numeric"
notes_mixtes <- c(8.0, 7.5, "6.8") # Le texte "6.8" force tout en texte
class(notes_mixtes) # "character"

# Conversion pour pouvoir calculer
notes_numeriques <- as.numeric(notes_mixtes)
mean(notes_numeriques)

# =============================================================================
# 3. NOTRE PREMIER TABLEAU (DATA FRAME)
# =============================================================================

cinema <- data.frame(
  titre = c("Dune", "Oppenheimer", "Barbie", "Drame", "Drame"),
  note = c(8.0, 8.3, 6.8, 7.4, 7.6),
  genre = c("Sci-Fi", "Biographie", "Comédie", "Drame", "Drame")
)

# Exploration
dim(cinema)   # Dimensions
names(cinema) # Noms des colonnes
str(cinema)   # Structure détaillée

# Accès aux colonnes
cinema$titre
mean(cinema$note)

# =============================================================================
# 4. CHARGEMENT ET NETTOYAGE (TITANIC)
# =============================================================================

# Chargement des données
# Assurez-vous d'avoir le fichier dans un dossier 'data'
# titanic <- read.csv("data/titanic.csv")
titanic <- read.csv("https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv")

# Nettoyage avec dplyr
titanic <- titanic %>%
  # 1. Gérer les valeurs manquantes (NA)
  mutate(Age = ifelse(is.na(Age), median(Age, na.rm = TRUE), Age)) %>%
  # 2. Renommer pour la clarté
  rename(survie = Survived, classe = Pclass, sexe = Sex) %>%
  # 3. Créer de nouvelles variables
  mutate(groupe_age = ifelse(Age < 18, "Enfant", "Adulte"),
         taille_famille = Siblings.Spouses.Aboard + Parents.Children.Aboard + 1)

# =============================================================================
# 5. ANALYSE QUANTITATIVE (DPLYR & GGPLOT2)
# =============================================================================

# Grouper et résumer
stats_classe <- titanic %>%
  group_by(classe) %>%
  summarise(
    nb_passagers = n(),
    taux_survie = mean(survie) * 100
  )

# Graphique : Histogramme (Distribution)
ggplot(titanic, aes(x = Age)) +
  geom_histogram(bins = 20, fill = "#003875", color = "white") +
  labs(title = "Distribution de l'âge", x = "Âge", y = "Effectif") +
  theme_minimal()

# Graphique : Nuage de points (Relation)
ggplot(titanic, aes(x = Age, y = Fare, color = factor(survie))) +
  geom_point(alpha = 0.6, size = 3) +
  scale_color_manual(values = c("#C31E39", "#28a745")) +
  labs(title = "Âge vs Prix du billet", color = "Survécu") +
  theme_minimal()

# =============================================================================
# 6. ANALYSE QUALITATIVE (NUAGE DE MOTS)
# =============================================================================

# Données fictives pour l'exemple
mots <- c("R", "Analyse", "Données", "Sociologie", "Science Politique", 
          "Statistiques", "Université", "Laval", "Recherche", "Tableau")
freq <- c(100, 80, 75, 60, 55, 50, 45, 40, 35, 30)

# Générer le nuage
wordcloud(words = mots, freq = freq, min.freq = 1,
          max.words = 50, random.order = FALSE, 
          colors = brewer.pal(8, "Dark2"))

# =============================================================================
# 7. SAUVEGARDE
# =============================================================================

# Sauvegarder le dernier graphique
# ggsave("resultat_final.png", width = 10, height = 6)

# Sauvegarder les données nettoyées
# write.csv(titanic, "data/titanic_propre.csv", row.names = FALSE)

# =============================================================================
# FIN DU SCRIPT - Université Laval 2026
# =============================================================================
