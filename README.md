# Initiation à l'analyse des données avec R

[![Website](https://img.shields.io/badge/website-live-brightgreen)](https://username.github.io/R_intro_fss)
[![Quarto](https://img.shields.io/badge/Made%20with-Quarto-blue)](https://quarto.org)

Formation théorique d'introduction à R dispensée à la Faculté des sciences sociales de l'Université Laval.

## 📋 Description

Cet atelier est conçu pour les débutantes et débutants en analyse de données et vise à introduire l'usage de R, un puissant logiciel pour l'analyse statistique.

### Objectifs de la formation

- Introduction à l'interface RStudio
- Apprentissage des concepts de base de R (objets, fonctions, packages)
- Import et manipulation de données
- Analyse descriptive et visualisation
- Bonnes pratiques en programmation R

### Contenu abordé

- L'analyse descriptive
- La représentation graphique des données
- La compréhension et la représentation des mesures telles que la moyenne, l'écart type et la variance
- Pour les données qualitatives, des techniques comme le nuage de mots

## 🚀 Accès rapide

- **[Présentation complète](https://etienneprx.github.io/R_intro_fss/slides.html)** - Slides interactifs
- **[Exercices pratiques](https://etienneprx.github.io/R_intro_fss/exercices.html)** - Mise en pratique

## 📁 Structure du projet

```
R_intro_fss/
├── index.qmd           # Présentation principale (slides)
├── exercices.qmd       # Exercices pratiques
├── _quarto.yml         # Configuration Quarto
├── data/              
│   └── etudiants_exemple.csv  # Données d'exemple
├── docs/               # Site web généré (GitHub Pages)
└── README.md           # Ce fichier
```

## 🛠️ Prérequis techniques

### Installation requise

1. **R** (version 4.0+) : [Télécharger R](https://cran.r-project.org/)
2. **RStudio** : [Télécharger RStudio](https://posit.co/download/rstudio-desktop/)

### Packages R essentiels

```r
# Installer les packages nécessaires
install.packages(c("readr", "dplyr", "ggplot2", "knitr"))
```

## 🏗️ Développement local

### Cloner le projet

```bash
git clone https://github.com/username/R_intro_fss.git
cd R_intro_fss
```

### Générer le site

Avec Quarto installé :

```bash
quarto render
```

Ou depuis RStudio, utiliser le bouton "Render" dans l'interface.

### Prévisualiser localement

```bash
quarto preview
```

## 📅 Informations sur la formation

- **Date** : 26 septembre 2025
- **Horaire** : 9h à 12h (théorique) | 13h à 15h (pratique)
- **Format** : Hybride (Zoom + présentiel)
- **Lieu** : BNF-4285, Université Laval
- **Public** : Étudiantes et étudiants des cycles supérieurs

## 👨‍🏫 Formateur

**Étienne Proulx**  
Université Laval - Faculté des sciences sociales

## 📞 Contact

Pour toute question relative à la formation :
- **Email** : appui-reussite.flsh@ulaval.ca
- **Centre d'appui à la réussite** : Bibliothèque de l'Université Laval, Pavillon Jean-Charles-Bonenfant, local 4186

## 📄 Licence

Ce matériel pédagogique est mis à disposition sous licence Creative Commons.

## 🤝 Contribution

Les suggestions d'amélioration sont les bienvenues ! N'hésitez pas à ouvrir une issue ou proposer une pull request.

---

*Formation développée dans le cadre des activités du Centre d'appui à la réussite de la Faculté des lettres et des sciences humaines de l'Université Laval.*