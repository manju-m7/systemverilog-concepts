# Shallow Copy in SystemVerilog

## Overview

A shallow copy creates a new object and copies all first-level properties from the source object to the destination object.

```systemverilog
pkt2 = new pkt1;
```

When a class contains nested objects, only the object handles are copied. The nested objects themselves are not duplicated.

As a result, both objects share the same nested object instance.

---

## Key Point

- Primitive variables (int, bit, string, etc.) are copied to the new object.
- Nested class objects are **not copied**.
- Only the handles of nested objects are copied.
- Changes made to a shared nested object are visible through both object handles.

---

## Observation

In this example:

- `addr` and `data` belong to the `Packet` object.
- `hdr` is a nested `Header` object.

After performing a shallow copy:

- Modifying `addr` and `data` in `p1` does not affect `p2`.
- Modifying `hdr.id` in `p1` is reflected in `p2`.

This happens because both `p1` and `p2` reference the same `Header` object.

---

## Learning Outcome

After this exercise, I understood:

- The difference between copying object data and copying object handles.
- How nested objects behave during a shallow copy.
- Why deep copy is required when complete object independence is needed.

---

## Simulation Output

![Simulation Output](output.png)

---

## Reference

ChipVerify – SystemVerilog Copying Objects

https://chipver:ify.com/systemverilog/systemverilog-copying-objects
