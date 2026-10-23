## Boolean Expression & VHDL Logic

* **Boolean Equation**: $Y = A \cdot B$
* **VHDL Concurrent Assignment**: `Y <= A and B;`
* **Operating Behavior**: Output `Y` is driven high (`'1'`) only when both inputs `A` and `B` are simultaneously high (`'1'`).

## 2-Input AND Gate Truth Table

The table below maps the standard `STD_LOGIC` signal values to the physical slide switches (`SW0`, `SW1`), user LED (`LD0`), and testbench simulation windows:

| Input `A` (`SW0`) | Input `B` (`SW1`) | Output `Y` (`LD0`) |
| :---: | :---: | :---: | 
| `'0'` | `'0'` | `'0'` | 
| `'0'` | `'1'` | `'0'` |
| `'1'` | `'0'` | `'0'` | 
| `'1'` | `'1'` | `'1'` | 
