MACHINE cP_subsetsum
DEFINITIONS
SET_PREF_MAX_OPERATIONS == 100;
GOAL == (p_s=t)
CONSTANTS m,t
PROPERTIES
//m = {1,2,3,4,55,56,57,119,235,244} &
//t= 777

//m = {1,2,3,4} &
//t = 10

m = {1,2,4,55,56,57,119}&
//t = 295
//t = 294
//t = 62
//t = 7
//t = 70
t = 8
VARIABLES state, p_s, p_u, p_n
INVARIANT
state: 0..3 &
p_u: seq(m) &
p_n: POW(m) &
p_s >= 0 
INITIALIZATION
state, p_s, p_u, p_n := 0,0,[],{}
OPERATIONS
rule1 = PRE state = 0  & card(m) > 0 THEN p_n := m; p_u :=[]; p_s := 0; state := 1 END;
out2 <-- rule2 = PRE state = 1 & p_s = t THEN out2:= p_u; state := 2 END;
out3 <-- rule3 = PRE state = 1 & p_s /= t & card(p_n) = 0 THEN out3 := [-1]; state := 3 END;
rule4(y) = PRE state = 1 & y:p_n THEN p_u := y -> p_u; p_n := p_n - {y}; p_s := p_s + y; state := 1 END;
disable_sink = PRE state = 2 or state = 3 THEN state := 1 END
END

