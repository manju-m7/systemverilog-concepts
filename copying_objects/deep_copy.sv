// Header class containing a single member variable
class Header;

  // Header ID
  int id;

  // Constructor
  function new(int id);
    this.id = id;
  endfunction

endclass


// Packet class containing primitive variables
// and a nested Header object
class Packet;

  // Packet fields
  int addr;
  int data;

  // Nested object
  Header hdr;

  // Constructor
  function new(int addr, int data, int id);

    // Create a new Header object
    hdr = new(id);

    // Initialize packet fields
    this.addr = addr;
    this.data = data;

  endfunction


  // Deep copy function
  // Copies data from source packet to destination packet
  function void copy(Packet p);

    // Copy primitive variables
    this.addr = p.addr;
    this.data = p.data;

    // Copy nested object data
    this.hdr.id = p.hdr.id;

  endfunction


  // Display packet contents
  function void display(string name);

    $display("[%s] addr = 0x%0h data = 0x%0h id = %0d",
              name, addr, data, hdr.id);

  endfunction

endclass


module tb;

  Packet p1, p2;

  initial begin

    // Create first packet
    p1 = new(32'haaaa_bbbb, 32'h1111_2222, 10);

    p1.display("p1");

    // Create second packet
    p2 = new(1, 2, 3);

    // Perform deep copy
    p2.copy(p1);

    p2.display("p2");

    // Modify original packet
    p1.addr   = 32'hcccc_bbbb;
    p1.data   = 32'h3333_4444;
    p1.hdr.id = 20;

    // Display both packets
    p1.display("p1");
    p2.display("p2");

  end

endmodule