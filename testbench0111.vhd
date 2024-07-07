library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector_de_sequencia_tb is
end detector_de_sequencia_tb;

architecture tb_arch of detector_de_sequencia_tb is
    -- Component declaration for unit under test
    component detector_de_sequencia
    port (
        clk, rst, entrada: in std_logic;
        saida: out std_logic
    );
end component;

    -- Signals for testbench
signal clk_tb, rst_tb, entrada_tb: std_logic := '0';
signal saida_tb: std_logic;

    -- Clock process
constant clk_period: time := 10 ns;
begin
    -- Instantiate the unit under test
    uut: detector_de_sequencia
    port map (
        clk => clk_tb,
        rst => rst_tb,
        entrada => entrada_tb,
        saida => saida_tb
    );

    -- Clock generation process
    clk_process: process
    begin
        while now < 1000 ns loop  -- Run for 1000 ns
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1: Detect sequence '0111'
        rst_tb <= '1';
        entrada_tb <= '0';
        wait for 20 ns;
        rst_tb <= '0';
        wait for 10 ns;

        entrada_tb <= '0';  -- S0
        wait for 10 ns;
        entrada_tb <= '1';  -- S0 to S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1 to S2
        wait for 10 ns;
        entrada_tb <= '1';  -- S2 to S3 (output should be '1')
        wait for 10 ns;
        entrada_tb <= '0';  -- S3 (reset condition)
        wait for 10 ns;
        entrada_tb <= '0';  -- S0
        wait for 10 ns;
        entrada_tb <= '1';  -- S0 to S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1 to S2
        wait for 10 ns;
        entrada_tb <= '1';  -- S2 to S3 (output should be '1')
        wait for 10 ns;

        -- End of test
        wait;
    end process;

end tb_arch;
