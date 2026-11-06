## Boolean Expression & VHDL Logic

- **Boolean Equation**: $Y = A + B$
- **VHDL Concurrent Assignment**: `Y <= A or B;`
- **Verilog Dataflow & Gate-Level Logic**: `always_comb Y = A | B; (or assign Y = A | B;)`
- **Operating Behavior**: Output `Y` is driven high (`'1'`) when at least one of the inputs `A` or `B` (or both) is high (`'1'`).

## 2-Input OR Gate Truth Table

| Input `A` | Input `B` | Output `Y` |
| :---: | :---: | :---: |
| `'0'` | `'0'` | `'0'` |
| `'0'` | `'1'` | `'1'` |
| `'1'` | `'0'` | `'1'` |
| `'1'` | `'1'` | `'1'` |

