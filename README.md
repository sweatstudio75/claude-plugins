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

Cowork : **Customize → Plugins → Add → Add marketplace**, puis `https://github.com/sweatstudio75/claude-plugins`.

Le dépôt GitHub est un miroir en lecture seule : Cowork ne lit pas le Gitea, qui refuse l'accès anonyme. Un `git push` depuis claude-agent part vers les deux dépôts. Depuis un autre poste, il n'atteint que Gitea.

## adhd-mode

Le hook `SessionStart` injecte les règles de `skills/adhd-mode/SKILL.md` à chaque début de session, et de nouveau après un `/clear`, une reprise ou une compaction. Il n'y a rien à taper.

- Désactiver pour la session : « stop adhd mode » (ce mode seulement) ou « normal mode » (tous les modes de sortie, ponytail compris).
- Réactiver : `/adhd-mode:adhd-mode`.
- Désactiver durablement : `claude plugin disable adhd-mode@jnsfr`, ou **Disable plugin** dans Cowork.

Avec [ponytail](https://github.com/DietrichGebert/ponytail), les deux modes restent actifs ensemble : ponytail décide quoi construire, adhd-mode décide de la forme de la réponse. Chacun a son interrupteur, « stop adhd mode » ou « stop ponytail ».

Différences avec l'original :

1. Les digressions restent supprimées, sauf un risque réel (sécurité, production, perte de données, coût, action irréversible). Chaque risque distinct tient sur une ligne qui commence par « ⚠️ », 2 lignes au maximum par réponse.
2. L'état n'est rappelé que dans un travail en plusieurs étapes ou sur plusieurs tours, pas dans un échange court.
3. Les estimations de temps sont données en minutes.
4. Les règles s'appliquent quelle que soit la langue de la conversation.
5. Le mode est actif par défaut, sans fichier drapeau à créer.

## Crédits et licence

`adhd-mode` est adapté de [i-have-adhd](https://github.com/ayghri/i-have-adhd) d'Ayoub Ghriss ([@ayghri](https://github.com/ayghri)). Le texte des règles en reprend une grande partie.

Licence MIT, voir [LICENSE](LICENSE). Elle conserve le copyright d'origine.
