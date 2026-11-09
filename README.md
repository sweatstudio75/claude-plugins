# claude-plugins

Marketplace de plugins Claude personnelle, utilisable depuis Claude Code et Cowork.

## Plugins

| Plugin | Rôle |
| --- | --- |
| [`adhd-mode`](plugins/adhd-mode) | Réponses adaptées à un lecteur TDAH : action d'abord, étapes numérotées, une seule étape concrète pour finir. Actif par défaut. |

## Installation

Claude Code :

```bash
claude plugin marketplace add https://git.jnsfr.com/jnsfr/claude-plugins.git
claude plugin install adhd-mode@jnsfr
```

Cowork : **Customize → Plugins → Add → Add marketplace**, puis l'URL du dépôt.

## adhd-mode

Le hook `SessionStart` injecte les règles de `skills/adhd-mode/SKILL.md` à chaque début de session, et de nouveau après un `/clear`, une reprise ou une compaction. Il n'y a rien à taper.

- Désactiver pour la session : « stop adhd mode » ou « normal mode ».
- Réactiver : `/adhd-mode:adhd-mode`.
- Désactiver durablement : `claude plugin disable adhd-mode@jnsfr`, ou **Disable plugin** dans Cowork.

Différences avec l'original :

1. Les digressions restent supprimées, sauf un risque réel (sécurité, production, perte de données, coût, action irréversible). Il est signalé en une seule ligne qui commence par « ⚠️ ».
2. L'état n'est rappelé que dans un travail en plusieurs étapes ou sur plusieurs tours, pas dans un échange court.
3. Les estimations de temps sont données en minutes.
4. Les règles s'appliquent quelle que soit la langue de la conversation.
5. Le mode est actif par défaut, sans fichier drapeau à créer.

## Crédits et licence

`adhd-mode` est adapté de [i-have-adhd](https://github.com/ayghri/i-have-adhd) d'Ayoub Ghriss ([@ayghri](https://github.com/ayghri)). Le texte des règles en reprend une grande partie.

Licence MIT, voir [LICENSE](LICENSE). Elle conserve le copyright d'origine.
