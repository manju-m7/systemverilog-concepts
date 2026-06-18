class Packet;

  // Random variable
  rand bit [3:0] mode;

  // Constraint block
  // Restricts mode to values between 3 and 6
  constraint c_mode {
    mode > 2;
    mode <= 6;
  }

endclass


module tb;

  Packet pkt = new();

  initial begin

    // Generate random values multiple times
    for (int i = 0; i < 5; i++) begin

      // Randomize object while satisfying constraints
      assert(pkt.randomize())
        else $fatal(1, "Randomization failed");

      $display("mode = %0d", pkt.mode);

    end
  end

endmodule