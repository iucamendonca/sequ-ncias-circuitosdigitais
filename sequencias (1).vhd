library ieee;
use ieee.std_logic_1164.all;

entity detector_de_sequencia is
    port (
        clk, rst, entrada: in std_logic;
        saida: out std_logic
    );
end detector_de_sequencia;

architecture comportamento of detector_de_sequencia is
    type tipo_estado is (S0, S1, S2, S3);
    signal EA: tipo_estado;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            saida <= '0';
            EA <= S0;
        elsif clk'event and clk = '1' then
            case EA is
                when S0 =>
                    if entrada = '0' then
                        saida <= '0';
                        EA <= S1;
                    else
                        saida <= '0';
                        EA <= S0;
                    end if;
                when S1 =>
                    if entrada = '1' then
                        saida <= '0';
                        EA <= S2;
                    else
                        saida <= '0';
                        EA <= S1;
                    end if;
                when S2 =>
                    if entrada = '1' then
                        saida <= '0';
                        EA <= S3;
                    else
                        saida <= '0';
                        EA <= S2;
                    end if;
                when S3 =>
                    if entrada = '1' then
                        saida <= '1';
                    else
                        saida <= '0';
                        EA <= S1;
                    end if;
            end case;
        end if;
    end process;
end comportamento;
