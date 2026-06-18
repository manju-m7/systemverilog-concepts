// Abstract class
virtual class BaseClass;

  int data;

  // Pure virtual method
  // Must be implemented by every derived class
  pure virtual function int getData();

endclass


// Derived class
class ChildClass extends BaseClass;

  // Implementation of pure virtual method
  virtual function int getData();

    data = 32'hcafe_cafe;
    return data;

  endfunction

endclass


module tb;

  ChildClass child;

  initial begin

    // Create derived class object
    child = new();

    // Call implemented method
    $display("data = 0x%0h", child.getData());

  end

endmodule