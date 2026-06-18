// Abstract (virtual) base class
// Objects cannot be created directly from this class.
virtual class BaseClass;

  int data;

  // Base class constructor
  function new();
    data = 32'hc0de_c0de;
  endfunction

endclass


// Derived class inherits from BaseClass
class ChildClass extends BaseClass;

  // Child class constructor
  function new();

    // Override the value initialized by the base class
    data = 32'hfade_fade;

  endfunction

endclass


module tb;

  ChildClass child;

  initial begin

    // Create object of derived class
    child = new();

    // Display data member
    $display("data = 0x%0h", child.data);

  end

endmodule
