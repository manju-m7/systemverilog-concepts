class ABC;

  // Random variable
  rand bit [3:0] mode;

  // Constraint declared inside the class
  constraint c_implicit;

  // Extern constraint declaration
  extern constraint c_explicit;

endclass


// Constraint definition outside the class
constraint ABC::c_implicit {
  mode > 2;
}

// Extern constraint definition
constraint ABC::c_explicit {
  mode <= 6;
}


module tb;

  ABC abc;

  initial begin

    abc = new();

    // Generate constrained random values
    for (int i = 0; i < 5; i++) begin

      abc.randomize();

      $display("mode = 0x%0h", abc.mode);

    end

  end

endmodule