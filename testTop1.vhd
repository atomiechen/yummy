--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:40:20 11/28/2018
-- Design Name:   
-- Module Name:   C:/MyDownloads/iseWorkspace/testForYummy/testTop1.vhd
-- Project Name:  testForYummy
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY testTop1 IS
END testTop1;
 
ARCHITECTURE behavior OF testTop1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         Clk : IN  std_logic;
         Ram2_EN : OUT  std_logic;
         Ram2_OE : OUT  std_logic;
         Ram2_WE : OUT  std_logic;
         Ram2_address : OUT  std_logic_vector(17 downto 0);
         Ram2_data : INOUT  std_logic_vector(15 downto 0);
         Ram1_EN : OUT  std_logic;
         Ram1_OE : OUT  std_logic;
         Ram1_WE : OUT  std_logic;
         Ram1_address : OUT  std_logic_vector(17 downto 0);
         Ram1_data : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';

	--BiDirs
   signal Ram2_data : std_logic_vector(15 downto 0);
   signal Ram1_data : std_logic_vector(15 downto 0);

 	--Outputs
   signal Ram2_EN : std_logic;
   signal Ram2_OE : std_logic;
   signal Ram2_WE : std_logic;
   signal Ram2_address : std_logic_vector(17 downto 0);
   signal Ram1_EN : std_logic;
   signal Ram1_OE : std_logic;
   signal Ram1_WE : std_logic;
   signal Ram1_address : std_logic_vector(17 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          Clk => Clk,
          Ram2_EN => Ram2_EN,
          Ram2_OE => Ram2_OE,
          Ram2_WE => Ram2_WE,
          Ram2_address => Ram2_address,
          Ram2_data => Ram2_data,
          Ram1_EN => Ram1_EN,
          Ram1_OE => Ram1_OE,
          Ram1_WE => Ram1_WE,
          Ram1_address => Ram1_address,
          Ram1_data => Ram1_data
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
