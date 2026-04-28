# plante.io - MVP Kanban

Document de travail pour suivre le MVP de `plante.io` ensemble.

## Legende

- `Must` : indispensable pour un MVP testable
- `Should` : important juste apres le coeur du MVP
- `Could` : utile plus tard, non bloquant

## Cible MVP

Le MVP est reussi si un utilisateur peut :

1. creer un compte
2. ajouter sa premiere plante avec une photo
3. comprendre la promesse du produit
4. voir une fiche plante vivante et motivante
5. revenir ajouter une photo ou un evenement

## Roadmap par sprint

| Sprint | Categorie | Element | Priorite | Statut | Notes |
|---|---|---|---|---|---|
| Sprint 1 | Auth | Inscription, connexion, recuperation mot de passe | Must | Done | Base en place |
| Sprint 1 | Fondation produit | Modeles `User`, `Plant`, `PlantPhoto`, `PlantEvent` | Must | Done | Base metier en place |
| Sprint 1 | Collection | Dashboard et liste des plantes | Must | Done | Premiere version live |
| Sprint 1 | Fiche plante | Page detail plante avec timeline simple | Must | Done | A raffiner |
| Sprint 1 | Creation | Ajout d'une plante avec photo initiale | Must | Done | Peut etre simplifie |
| Sprint 1 | Design system | UI mobile-first coherent Living Jungle OS | Must | In progress | Bonne base, finitions possibles mais socle coherent |
| Sprint 2 | Onboarding | Clarifier la proposition de valeur sur les ecrans d'entree | Must | Backlog | Message plus direct a ajouter |
| Sprint 2 | Activation | Reduire le flow "premiere plante" a moins de 2 minutes | Must | In progress | Flow simplifie, reste a valider en usage |
| Sprint 2 | Wow moment | Ecran ou etat celebratoire apres creation d'une plante | Must | Backlog | Gros levier d'activation |
| Sprint 2 | Gamification | Niveau, XP et stade plus lisibles | Must | Backlog | Deja amorce, pas encore verrouille |
| Sprint 2 | Empty states | Etats vides guides sur dashboard et collection | Should | Backlog | Important pour clarte |
| Sprint 3 | Retention | Ajout de photo recurrent depuis dashboard et fiche | Must | Backlog | Boucle de retour centrale |
| Sprint 3 | Journal | Quick actions pour arrosage, rempotage, nouvelle feuille | Must | Backlog | A faire en 1 tap |
| Sprint 3 | UX | CTA principal contextuel selon l'etat de la plante | Must | Backlog | "Next best action" |
| Sprint 3 | Timeline | Fusion claire photos + evenements | Must | Backlog | Plus utile que decorative |
| Sprint 3 | Relance | Rappels in-app simples | Should | Backlog | Suffisant pour tester le retour |
| Sprint 4 | IA | Suggestion d'espece depuis photo | Must | Backlog | Premiere magie utile |
| Sprint 4 | IA | Validation/correction simple de l'espece suggeree | Must | Backlog | Necessaire pour la confiance |
| Sprint 4 | Progression | Regles XP plus credibles basees sur photos + evenements | Must | Backlog | Eviter le cote arbitraire |
| Sprint 4 | Insights | Mini feedback utile sur l'evolution | Should | Backlog | "Nouvelle feuille probable" etc. |
| Sprint 4 | Robustesse | Etats d'erreur et fallback si l'IA doute | Must | Backlog | Aucun blocage utilisateur |
| Sprint 5 | QA | Parcours principal sans bug visible | Must | Backlog | Sprint de stabilisation |
| Sprint 5 | Produit | Demo data / seeds de demonstration | Must | Backlog | Pour tests utilisateurs |
| Sprint 5 | Analytics | Funnel MVP : inscription, premiere plante, retour | Must | Backlog | Pour piloter ensuite |
| Sprint 5 | Growth | Landing simple / waitlist / capture email | Should | Backlog | Option validation marche |
| Sprint 5 | Partage | Carte plante partageable | Could | Backlog | Sympa, pas critique |

## Vue kanban

### Backlog

- [ ] Clarifier la proposition de valeur sur les ecrans d'entree
- [ ] Simplifier le flow de creation de premiere plante
- [ ] Creer un wow moment post-creation
- [ ] Rendre niveau / XP / stade plus lisibles
- [ ] Ajouter des empty states guides
- [ ] Permettre l'ajout recurrent de photos
- [ ] Ajouter des quick actions d'evenements
- [ ] Afficher un CTA principal contextuel
- [ ] Fusionner proprement photos + evenements dans la timeline
- [ ] Ajouter des rappels in-app simples
- [ ] Integrer une suggestion d'espece par IA
- [ ] Permettre la validation / correction de l'espece
- [ ] Rendre le calcul d'XP plus credible
- [ ] Ajouter des mini insights sur l'evolution
- [ ] Gerer proprement les erreurs et doutes de l'IA
- [ ] Ajouter des seeds/demo data
- [ ] Instrumenter le funnel MVP
- [ ] Construire une landing / waitlist simple
- [ ] Ajouter une carte plante partageable

### This sprint

- [x] Finaliser le design system mobile-first sur les ecrans coeur
- [x] Clarifier la proposition de valeur sur les ecrans d'entree
- [x] Simplifier le flow de creation de premiere plante
- [x] Rendre niveau / XP / stade plus lisibles
- [x] Ajouter des empty states guides sur dashboard et collection

### In progress

- [ ] Polisher le design system mobile-first

### Done

- [x] Authentification de base
- [x] Modeles coeur du produit
- [x] Dashboard initial
- [x] Collection de plantes
- [x] Fiche plante initiale
- [x] Creation d'une plante avec photo

## Vue par categorie

### Fondation produit

- [x] Auth
- [x] Modeles de base
- [x] Navigation principale
- [x] Dashboard minimal

### Activation

- [ ] Proposition de valeur plus claire
- [ ] Creation premiere plante plus rapide
- [ ] Wow moment apres creation
- [ ] Empty states guides

### Experience plante

- [x] Fiche plante initiale
- [ ] Timeline plus utile
- [ ] Ajout de photo recurrent
- [ ] Evenements en 1 tap

### Gamification

- [x] Niveau / XP / stade de base
- [ ] Regles XP credibles
- [ ] Progression plus visible

### IA

- [ ] Suggestion d'espece
- [ ] Validation manuelle
- [ ] Feedback simple sur evolution
- [ ] Gestion des cas d'erreur

### Retention

- [ ] CTA contextuels
- [ ] Rappels in-app
- [ ] Boucle hebdo de mise a jour

### Growth & validation

- [ ] Demo data
- [ ] Analytics MVP
- [ ] Landing / waitlist
- [ ] Partage simple

## Notes de priorisation

Ce qu'on doit proteger coute que coute :

1. activation de la premiere plante
2. effet compagnon / attachement
3. boucle de retour photo + evenement
4. preuve de progression credible

Ce qu'on peut repousser sans regret :

- marketplace
- social feed
- diagnostic sante avance
- badges complexes
- app mobile native
- monetisation

## Focus Sprint 1

Objectif du sprint : poser un socle MVP propre, testable et comprehensible.

Definition of done du Sprint 1 :

- un nouvel utilisateur comprend la promesse en arrivant
- il peut creer un compte sans friction majeure
- il peut ajouter sa premiere plante rapidement
- il voit ensuite une collection et une fiche plante claires
- l'interface parait deja suffisamment premium pour etre testee

Perimetre retenu :

| Sujet | Priorite | Statut | Commentaire |
|---|---|---|---|
| Authentification | Must | Done | En place |
| Modeles coeur du produit | Must | Done | En place |
| Dashboard initial | Must | Done | Base ok, polish en cours |
| Collection de plantes | Must | Done | Base ok |
| Fiche plante initiale | Must | Done | Base ok, raffinement a venir |
| Creation d'une plante avec photo | Must | Done | A simplifier ensuite |
| Design system coherent | Must | In progress | Premier vrai chantier du sprint |
| Proposition de valeur claire | Must | Backlog | A faire sur auth / home |
| Empty states guides | Should | Backlog | Important pour les premiers tests |

Hors scope du Sprint 1 :

- IA de reconnaissance d'espece
- rappels in-app
- quick actions d'evenements
- analytics
- landing / waitlist
