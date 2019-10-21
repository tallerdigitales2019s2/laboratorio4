module timer30 (input logic clk, input logic reset, output logic out); 
 parameter clk_frequency = 25;
 logic [31:0]counter;  
 logic [3:0] sec;

 always @(posedge clk, negedge reset) 
  begin 
   if(!reset)
    begin
     out <= 0;
     counter<=0;
     sec<=0;
    end 
   else
    begin
     if(sec == 0)
      begin 
       sec <= 30;
       out <= 1;
      end
     if (counter==clk_frequency) 
      begin 
       sec <= sec -1; 
       counter<=0; 
      end 
     else 
      counter <=counter+1; 
    end
  end
endmodule