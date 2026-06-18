// Nested class
class Header;
	int id;

	function new(int id);
    	this.id = id;
    endfunction
endclass


class Packet;

	int addr;
	int data;

	// Handle to Header object
	Header hdr;

	function new(int addr, int data, int id);

      // Create Header object
      hdr = new(id);

      this.addr = addr;
      this.data = data;

    endfunction

    function void display(string name);

      $display("[%s] addr=0x%0h data=0x%0h id=%0d",
               name, addr, data, hdr.id);

    endfunction

endclass


module tb;

  Packet p1, p2;

  initial begin

    // Create original Packet object
    p1 = new(32'haaaa_bbbb, 32'h1111_2222, 30);
    p1.display("p1");

    // Shallow copy using copy constructor
    p2 = new p1;
    p2.display("p2");

    // Modify original object
    p1.addr   = 32'hcccc_dddd;
    p1.data   = 32'h3333_4444;

    // Modify nested Header object
    p1.hdr.id = 15;

    p1.display("p1");
    p2.display("p2");

  end

endmodule