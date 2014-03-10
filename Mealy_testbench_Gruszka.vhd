--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:04 03/09/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jeremy.Gruszka/Documents/ECE/281/CE3_Gruszka/Mealy_testbench_Gruszka.vhd
-- Project Name:  CE3_Gruszka
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MealyElevatorController_Shell
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mealy_testbench_Gruszka IS
END Mealy_testbench_Gruszka;
 
ARCHITECTURE behavior OF Mealy_testbench_Gruszka IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MealyElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0);
         nextfloor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);
   signal nextfloor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MealyElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor,
          nextfloor => nextfloor
        );

   -- Clock process definitions
   clock_process :process
   begin
		clk <= '0';
		wait for clock_period/2;
		clk <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
      -- hold reset state for 200 ns.
      wait for clock_period;
		reset <= '0';


      -- insert stimulus here
		up_down <= '1';
		wait for clock_period;
		stop <= '1';
		
      wait for clock_period*2;
		
		stop <= '0';
		wait for clock_period;
		stop <= '1';
		
      wait for clock_period*2;
		
		stop <= '0';
		wait for clock_period;
		stop <= '1';
		
      wait for clock_period*2;
		
		up_down <= '0';
		stop <= '0';
		
		wait for clock_period;

      wait;
   end process;

END;
