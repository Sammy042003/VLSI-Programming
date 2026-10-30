## Boolean Expression & VHDL Logic

* **Boolean Equation**: $Y = A \cdot B$
* **VHDL Concurrent Assignment**: `Y <= A and B;`
* **Verilog Dataflow & Gate-Level Logic**: `always_comb Y = A & B; (or assign Y = A & B;)`
* **Operating Behavior**: Output `Y` is driven high (`'1'`) only when both inputs `A` and `B` are simultaneously high (`'1'`).

## 2-Input AND Gate Truth Table

| Input `A` | Input `B` | Output `Y` |
| :---: | :---: | :---: | 
| `'0'` | `'0'` | `'0'` | 
| `'0'` | `'1'` | `'0'` |
| `'1'` | `'0'` | `'0'` | 
| `'1'` | `'1'` | `'1'` | 
