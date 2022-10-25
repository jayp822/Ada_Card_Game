with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Discrete_Random;

procedure Main is
   type rank is ( ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,ACE);
   type suite is ( CLOVERS , DIAMONDS , HEARTS , SPHADES);
   subtype Rank_Range is Integer range 0 .. 12;
   subtype Suite_Range is Integer range 0 .. 3;

   package Rank_Rand_Int is new ada.numerics.discrete_random(Rank_Range);
   use Rank_Rand_Int;
   gen_rank: Rank_Rand_Int.Generator;
   num_rank_p1, num_rank_p2: Rank_Range;

   package Suite_Rand_Int is new ada.numerics.discrete_random(Suite_Range);
   use Suite_Rand_Int;
   gen_suite: Suite_Rand_Int.Generator;
   num_suite_p1, num_suite_p2 : Suite_Range;

   P1Wins : Integer := 0;
   P2Wins : Integer := 0;

   Winner : Unbounded_String;


begin

   for I in 1.. 25 loop
      reset(gen_rank);
      reset(gen_suite);
      num_rank_p1:= random(gen_rank);
      num_suite_p1:= random(gen_suite);
      Put("Round" & Integer'Image(I) & ": Player 1: " & rank'Image(rank'Val(num_rank_p1)) & " OF "& suite'Image(suite'Val(num_suite_p1)) & "  Player 2: ");
      reset(gen_rank);
      reset(gen_suite);
      num_rank_p2:= random(gen_rank);
      num_suite_p2:= random(gen_suite);
      if num_rank_p1 > num_rank_p2 then
         Winner:= To_Unbounded_String("Player 1 wins (+2,0)");
         P1Wins := P1Wins + 2;
      elsif num_rank_p1 < num_rank_p2  then
         Winner:= To_Unbounded_String("Player 2 wins (0,+2)");
         P2Wins := P2Wins + 2;
      else
         if num_suite_p1 > num_suite_p2 then
            Winner:= To_Unbounded_String("Player 1 wins (+2,0)");
            P1Wins := P1Wins + 2;
         elsif num_suite_p1 < num_suite_p2 then
            Winner:= To_Unbounded_String("Player 2 wins (0,+2)");
            P2Wins := P2Wins + 2;
         else
            Winner:= To_Unbounded_String("Tie (+1,+1)");
            P1Wins := P1Wins + 1;
            P2Wins := P2Wins + 1;
         end if;
      end if;
      Put(rank'Image(rank'Val(num_rank_p2)) &" OF "& suite'Image(suite'Val(num_suite_p2)) & " "& To_String(Winner));
      Put_Line(" ");

   end loop;

   if P1Wins = P2Wins then
    Put_Line("OVERTIME ROUNDS");
	for I in 1.. 10 loop
      		reset(gen_rank);
      		reset(gen_suite);
      		num_rank_p1:= random(gen_rank);
      		num_suite_p1:= random(gen_suite);
      		Put("Round" & Integer'Image(I) & ": Player 1: " & rank'Image(rank'Val(num_rank_p1)) & " OF "& suite'Image(suite'Val(num_suite_p1)) & "  Player 2: ");
      		reset(gen_rank);
      reset(gen_suite);
      num_rank_p2:= random(gen_rank);
      num_suite_p2:= random(gen_suite);
      if num_rank_p1 > num_rank_p2 then
         Winner:= To_Unbounded_String("Player 1 wins (+2,0)");
         P1Wins := P1Wins + 2;
      elsif num_rank_p1 < num_rank_p2  then
         Winner:= To_Unbounded_String("Player 2 wins (0,+2)");
         P2Wins := P2Wins + 2;
      else
         if num_suite_p1 > num_suite_p2 then
            Winner:= To_Unbounded_String("Player 1 wins (+2,0)");
            P1Wins := P1Wins + 2;
         elsif num_suite_p1 < num_suite_p2 then
            Winner:= To_Unbounded_String("Player 2 wins (0,+2)");
            P2Wins := P2Wins + 2;
         else
            Winner:= To_Unbounded_String("Tie (+1,+1)");
            P1Wins := P1Wins + 1;
            P2Wins := P2Wins + 1;
         end if;
      end if;
      Put(rank'Image(rank'Val(num_rank_p2)) &" OF "& suite'Image(suite'Val(num_suite_p2)) & " "& To_String(Winner));
      Put_Line(" ");

   end loop;
   end if;





   if P1Wins > P2Wins then
      Put_Line("Player 1:" & Integer'Image(P1Wins) & " Player 2:" & Integer'Image(P2Wins) & " Player 1 wins match");
   elsif P1Wins < P2Wins then
      Put_Line("Player 1:" & Integer'Image(P1Wins) & " Player 2:" & Integer'Image(P2Wins) & " Player 2 wins match");
   else
      Put_Line("Player 1:" & Integer'Image(P1Wins) & " Player 2:" & Integer'Image(P2Wins) & " TIE");
   end if;


end Main;
