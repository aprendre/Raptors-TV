# Raptors TV

Une application Flutter pour découvrir des documentaires gratuits sur les rapaces disponibles sur YouTube.

## Fonctionnalités

- **Classification thématique** : Les vidéos sont classées par catégories de rapaces (Aigles, Faucons, Vautours, Rapaces nocturnes, etc.)
- **Dossier spécial Félix Rodríguez de la Fuente** : Une section dédiée à l'émission "El Hombre y la Tierra" avec un focus sur les épisodes traitant des rapaces
- **Barre de recherche** : Filtrez les vidéos par mots-clés
- **Navigation par onglets** : Accédez facilement aux différentes catégories
- **Intégration YouTube** : Accédez directement aux vidéos sur YouTube

## Structure du projet

```
lib/
├── main.dart                 # Point d'entrée de l'application
├── models/
│   ├── category.dart         # Modèle de données pour les catégories
│   └── video.dart            # Modèle de données pour les vidéos
├── screens/
│   └── home_screen.dart      # Écran principal avec navigation par onglets
├── services/
│   └── video_service.dart    # Service pour charger les données JSON
├── widgets/
│   └── video_card.dart       # Widget pour afficher une vidéo
└── utils/
    └── app_constants.dart    # Constantes de l'application

assets/
└── data/
    └── videos.json           # Données des vidéos et catégories
```

## Installation

### Prérequis

- Flutter SDK (version 3.0.0 ou supérieure)
- Dart SDK (inclus avec Flutter)
- Un éditeur de code (VS Code, Android Studio, etc.)

### Étapes d'installation

1. **Clonez le dépôt** :
   ```bash
   git clone https://github.com/votre-username/raptors_tv.git
   cd raptors_tv
   ```

2. **Installez les dépendances** :
   ```bash
   flutter pub get
   ```

3. **Lancez l'application** :
   ```bash
   flutter run
   ```

## Compilation en APK

Pour générer un fichier APK prêt pour la distribution :

```bash
flutter build apk --release
```

Le fichier APK sera généré dans le dossier `build/app/outputs/flutter-apk/app-release.apk`.

## Compilation en IPA (iOS)

Pour générer un fichier IPA pour iOS :

```bash
flutter build ios --release
```

## Dépendances

- **flutter** : Framework Flutter
- **cupertino_icons** : Icônes iOS
- **url_launcher** : Pour ouvrir les liens YouTube

## Données

Les données des vidéos sont stockées dans le fichier `assets/data/videos.json`. Vous pouvez ajouter, modifier ou supprimer des vidéos en éditant ce fichier JSON.

### Format du JSON

```json
[
  {
    "category": "Nom de la catégorie",
    "videos": [
      {
        "id": "ID_VIDEO_YOUTUBE",
        "title": "Titre de la vidéo",
        "url": "https://www.youtube.com/watch?v=ID",
        "thumbnail": "https://img.youtube.com/vi/ID/0.jpg",
        "duration": "HH:MM:SS"
      }
    ]
  }
]
```

## Architecture

L'application utilise une architecture simple basée sur :

- **Models** : Représentation des données (Category, Video)
- **Services** : Logique métier (chargement des données)
- **Screens** : Pages principales de l'application
- **Widgets** : Composants UI réutilisables

## Améliorations futures

- Intégration avec l'API YouTube Data v3 pour récupérer les vidéos en temps réel
- Système de favoris pour sauvegarder les vidéos préférées
- Historique de lecture
- Mode sombre
- Support multilingue
- Lecteur vidéo intégré

## Contribution

Les contributions sont bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

## Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## Auteur

Créé par **Manus AI** en 2026.

## Support

Pour toute question ou problème, veuillez ouvrir une issue sur GitHub.
