# Objectif du TP
Variabiliser la variable 'ostemplate'

# Rendu du TP
## Fichiers modifiés
- [variables.tf](./fichiers/variables.tf)
- [nodes.yaml](./fichiers/nodes.yaml)
- [nodes.auto.tfvars.json](./fichiers/nodes.auto.tfvars.json)
- [container.tf](./fichiers/container.tf)


## Travail effectué

### variables.tf
- ajout de la clé 'ostemplate' à la variable **containers**

### nodes.yaml
- ajout de la clé 'ostemplate' dans les dictionnaires de la liste **containers**

### nodes.auto.tfvars.json
- ajout de la clé 'ostemplate' dans les dictionnaires de la liste **containers**

### container.tf
- variabiliser 'ostemplate'

## Vérifier l'effectivité
- charger les variables d'environnement à chaque session : `source passwords.env`
- valider la configuration : `./terraform validate`
- vérifier le plan : `./terraform plan`
- appliquer : `./terraform apply`
