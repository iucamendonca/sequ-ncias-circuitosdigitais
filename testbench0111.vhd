library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector_de_sequencia_tb is
end detector_de_sequencia_tb;

architecture sequen_tb of detector_de_sequencia_tb is
    -- declaração
    component detector_de_sequencia
    port (
        clk, rst, entrada: in std_logic;
        saida: out std_logic
    );
end component;

    -- Sinais do tb
signal clk_tb, rst_tb, entrada_tb: std_logic := '0';
signal saida_tb: std_logic;

    -- clock
constant clk_period: time := 10 ns;
begin
    
    uut: detector_de_sequencia
    port map (
        clk => clk_tb,
        rst => rst_tb,
        entrada => entrada_tb,
        saida => saida_tb
    );

    -- gerador de clock
    clk_process: process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    stimulus_process: process
    begin
        --Teste para detectar o 0111
        rst_tb <= '1';
        entrada_tb <= '0';
        wait for 20 ns;
        rst_tb <= '0';
        wait for 10 ns;

        entrada_tb <= '0';  -- S0
        wait for 10 ns;
        entrada_tb <= '1';  -- S0 para S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1 para S2
        wait for 10 ns;
        entrada_tb <= '1';  -- S2 para S3 (saida'1')
        wait for 10 ns;
        entrada_tb <= '0';  -- S3 (reset)
        wait for 10 ns;
        entrada_tb <= '0';  -- S0
        wait for 10 ns;
        entrada_tb <= '1';  -- S0 para S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1
        wait for 10 ns;
        entrada_tb <= '1';  -- S1 para S2
        wait for 10 ns;
        entrada_tb <= '1';  -- S2 para S3 (saida'1')
        wait for 10 ns;
        
         --Teste para detectar o padrão 1001
        rst_tb <= '1';
        entrada_tb <= '0';
        wait for 20 ns;
        rst_tb <= '0';
        wait for 10 ns;

        entrada_tb <= '1';  -- S0
        wait for 10 ns;
        entrada_tb <= '0';  -- S0 para S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1 para S2
        wait for 10 ns;
        entrada_tb <= '1';  -- S2 para S3
        wait for 10 ns;
        entrada_tb <= '0';  -- S3 (reset)
        wait for 10 ns;
        entrada_tb <= '1';  -- S0
        wait for 10 ns;
        entrada_tb <= '0';  -- S0 para S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1 para S2
        wait for 10 ns;
        entrada_tb <= '1';  -- S2 para S3
        wait for 10 ns;
        
        --Teste para detectar o padrão 1100
        rst_tb <= '1';
        entrada_tb <= '0';
        wait for 20 ns;
        rst_tb <= '0';
        wait for 10 ns;

        entrada_tb <= '1';  -- S0
        wait for 10 ns;
        entrada_tb <= '1';  -- S0 para S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1 para S2
        wait for 10 ns;
        entrada_tb <= '0';  -- S2 para S3 (saida '1')
        wait for 10 ns;
        entrada_tb <= '0';  -- S3 (reset)
        wait for 10 ns;
        entrada_tb <= '1';  -- S0
        wait for 10 ns;
        entrada_tb <= '1';  -- S0 para S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1
        wait for 10 ns;
        entrada_tb <= '0';  -- S1 para S2
        wait for 10 ns;
        entrada_tb <= '0';  -- S2 para S3 (saida '1')
        wait for 10 ns;


        wait;
    end process;

end sequen_tb;
