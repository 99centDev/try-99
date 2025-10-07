# Godot Top-Down Action - Refactor

Este proyecto es un prototipo para un juego de acción Top-Down en Godot.

El objetivo principal ha sido refactorizar el control del personaje a una Máquina de Estados (State Machine) para hacerlo más robusto y escalable.

## Acciones Actuales

*   **Movimiento**: Movimiento en 8 direcciones.
*   **Dash**: Un movimiento rápido de evasión con cooldown.
*   **Ataque**: Al presionar el click, se activa un área de ataque.
*   **Detección de Daño**: El enemigo tiene una `Hurtbox` que, al entrar en contacto con el `AttackArea` del jugador, lo pone en estado "Hurt".

## Contexto Técnico

El jugador (`Player.tscn`) utiliza un nodo `StateMachine` para gestionar sus estados. La lógica de cada estado (Idle, Run, Dash, Attack) está separada en su propio script dentro de `scripts/player/`. La lógica común a todos los estados se encuentra en `scripts/player/player_state_base.gd`.

## Próximos Pasos (TODO)

- [ ] Implementar estado de **Cubrirse** (Cover).
- [ ] (Futuro) Implementar mecánica de **Parry**.