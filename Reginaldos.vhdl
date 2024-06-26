-- generated by Digital. Don't modify this file!
-- Any changes will be lost if this file is regenerated.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity DECODER_3 is
  port (
    out_0: out std_logic;
    out_1: out std_logic;
    out_2: out std_logic;
    out_3: out std_logic;
    out_4: out std_logic;
    out_5: out std_logic;
    out_6: out std_logic;
    out_7: out std_logic;
    sel: in std_logic_vector (2 downto 0) );
end DECODER_3;

architecture Behavioral of DECODER_3 is
begin
  out_0 <= '1' when sel = "000" else '0';
  out_1 <= '1' when sel = "001" else '0';
  out_2 <= '1' when sel = "010" else '0';
  out_3 <= '1' when sel = "011" else '0';
  out_4 <= '1' when sel = "100" else '0';
  out_5 <= '1' when sel = "101" else '0';
  out_6 <= '1' when sel = "110" else '0';
  out_7 <= '1' when sel = "111" else '0';
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity habilida_Escrita is
  port (
    EscrevReginaldo: in std_logic;
    Escrita: in std_logic_vector(2 downto 0);
    n2: out std_logic;
    n3: out std_logic;
    n4: out std_logic;
    n5: out std_logic;
    n6: out std_logic;
    n7: out std_logic);
end habilida_Escrita;

architecture Behavioral of habilida_Escrita is
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
  signal s3: std_logic;
  signal s4: std_logic;
  signal s5: std_logic;
begin
  gate0: entity work.DECODER_3
    port map (
      sel => Escrita,
      out_2 => s0,
      out_3 => s1,
      out_4 => s2,
      out_5 => s3,
      out_6 => s4,
      out_7 => s5);
  n6 <= (s4 AND EscrevReginaldo);
  n7 <= (s5 AND EscrevReginaldo);
  n4 <= (s2 AND EscrevReginaldo);
  n5 <= (s3 AND EscrevReginaldo);
  n2 <= (s0 AND EscrevReginaldo);
  n3 <= (s1 AND EscrevReginaldo);
end Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity DIG_Register_BUS is
  generic ( Bits: integer ); 
  port (
    Q: out std_logic_vector ((Bits-1) downto 0);
    D: in std_logic_vector ((Bits-1) downto 0);
    C: in std_logic;
    en: in std_logic );
end DIG_Register_BUS;

architecture Behavioral of DIG_Register_BUS is
  signal state : std_logic_vector ((Bits-1) downto 0) := (others => '0');
begin
   Q <= state;

   process ( C )
   begin
      if rising_edge(C) and (en='1') then
        state <= D;
      end if;
   end process;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_BUS_3 is
  generic ( Bits : integer ); 
  port (
    p_out: out std_logic_vector ((Bits-1) downto 0);
    sel: in std_logic_vector (2 downto 0);
    
    in_0: in std_logic_vector ((Bits-1) downto 0);
    in_1: in std_logic_vector ((Bits-1) downto 0);
    in_2: in std_logic_vector ((Bits-1) downto 0);
    in_3: in std_logic_vector ((Bits-1) downto 0);
    in_4: in std_logic_vector ((Bits-1) downto 0);
    in_5: in std_logic_vector ((Bits-1) downto 0);
    in_6: in std_logic_vector ((Bits-1) downto 0);
    in_7: in std_logic_vector ((Bits-1) downto 0) );
end MUX_GATE_BUS_3;

architecture Behavioral of MUX_GATE_BUS_3 is
begin
  with sel select
    p_out <=
      in_0 when "000",
      in_1 when "001",
      in_2 when "010",
      in_3 when "011",
      in_4 when "100",
      in_5 when "101",
      in_6 when "110",
      in_7 when "111",
      (others => '0') when others;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    DadosReginaldo: in std_logic_vector(15 downto 0);
    Clock: in std_logic;
    EscrevReginaldo: in std_logic;
    Leitura1: in std_logic_vector(2 downto 0);
    Leitura2: in std_logic_vector(2 downto 0);
    Escrita: in std_logic_vector(2 downto 0);
    SaiReginaldo1: out std_logic_vector(15 downto 0);
    SaiReginaldo2: out std_logic_vector(15 downto 0));
end main;

architecture Behavioral of main is
  signal s0: std_logic;
  signal s1: std_logic_vector(15 downto 0);
  signal s2: std_logic;
  signal s3: std_logic_vector(15 downto 0);
  signal s4: std_logic;
  signal s5: std_logic_vector(15 downto 0);
  signal s6: std_logic;
  signal s7: std_logic_vector(15 downto 0);
  signal s8: std_logic;
  signal s9: std_logic_vector(15 downto 0);
  signal s10: std_logic;
  signal s11: std_logic_vector(15 downto 0);
  signal s12: std_logic_vector(15 downto 0);
begin
  gate0: entity work.habilida_Escrita
    port map (
      EscrevReginaldo => EscrevReginaldo,
      Escrita => Escrita,
      n2 => s0,
      n3 => s2,
      n4 => s4,
      n5 => s6,
      n6 => s8,
      n7 => s10);
  s12(0) <= '1';
  s12(15 downto 1) <= "000000000000000";
  gate1: entity work.DIG_Register_BUS -- A
    generic map (
      Bits => 16)
    port map (
      D => DadosReginaldo,
      C => Clock,
      en => s0,
      Q => s1);
  gate2: entity work.DIG_Register_BUS -- B
    generic map (
      Bits => 16)
    port map (
      D => DadosReginaldo,
      C => Clock,
      en => s2,
      Q => s3);
  gate3: entity work.DIG_Register_BUS -- C
    generic map (
      Bits => 16)
    port map (
      D => DadosReginaldo,
      C => Clock,
      en => s4,
      Q => s5);
  gate4: entity work.DIG_Register_BUS -- D
    generic map (
      Bits => 16)
    port map (
      D => DadosReginaldo,
      C => Clock,
      en => s6,
      Q => s7);
  gate5: entity work.DIG_Register_BUS -- E
    generic map (
      Bits => 16)
    port map (
      D => DadosReginaldo,
      C => Clock,
      en => s8,
      Q => s9);
  gate6: entity work.DIG_Register_BUS -- Flags
    generic map (
      Bits => 16)
    port map (
      D => DadosReginaldo,
      C => Clock,
      en => s10,
      Q => s11);
  gate7: entity work.MUX_GATE_BUS_3
    generic map (
      Bits => 16)
    port map (
      sel => Leitura1,
      in_0 => "0000000000000000",
      in_1 => s12,
      in_2 => s1,
      in_3 => s3,
      in_4 => s5,
      in_5 => s7,
      in_6 => s9,
      in_7 => s11,
      p_out => SaiReginaldo1);
  gate8: entity work.MUX_GATE_BUS_3
    generic map (
      Bits => 16)
    port map (
      sel => Leitura2,
      in_0 => "0000000000000000",
      in_1 => s12,
      in_2 => s1,
      in_3 => s3,
      in_4 => s5,
      in_5 => s7,
      in_6 => s9,
      in_7 => s11,
      p_out => SaiReginaldo2);
end Behavioral;
