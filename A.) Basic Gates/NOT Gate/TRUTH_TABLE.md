## Boolean Expression & VHDL Logic

- **Boolean Equation**: $Y = \overline{A}$ (or $Y = A'$)
- **VHDL Concurrent Assignment**: `Y <= not A;`
- **Verilog & SystemVerilog Dataflow / Gate-Level Logic**: `always_comb Y = ~A; (or assign Y = ~A; / not (Y, A);)`
- **Operating Behavior**: Output `Y` is driven high (`'1'`) when input `A` is low (`'0'`), and driven low (`'0'`) when input `A` is high (`'1'`).

## 1-Input NOT Gate Truth Table

| Input `A` | Output `Y` |
| :---: | :---: |
| `'0'` | `'1'` |
| `'1'` | `'0'` |
