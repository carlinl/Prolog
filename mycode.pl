%Full Name:Jihui Liang
%student ID:z5184936
%Assignment 1-Prolog Programming


%Q1: sumsq_neg sums the squares of only the negative numbers in a list of numbers.
%if it's an empty list, the Sum is 0.
sumsq_neg([],0).
%if the number in the list is big than 0, then the Sum won't change.
sumsq_neg([H|T],Sum):-
H >= 0,
sumsq_neg(T,Sum).
%if the number is less than 0, then return the sumsq_neg of the rest,
%and add the H^2 to the result.
sumsq_neg([H|T],Sum):-
H < 0,
sumsq_neg(T,Sum0),
Sum is H*H + Sum0.

%Q2:all_like_all takes a list of people Who_List and a list of sports What_List and succeeds if
% every person in Who_List likes every sport in What_Listall_like_all(_,[]).
%base case.
all_like_all([],_).
%use recursive functiont to find the answer.
%a person and the what_list sports.
%a sport and  the who_list people.
all_like_all([Person|Other_person],[Sport|Other_sports]):-
like(Person,Sport),
all_like_all([Person|Other_person],Other_sports),
all_like_all(Other_person,[Sport|Other_sports]).



%Q3:sqrt_table binds Result to the list of pairs consisting of a number and its square root，
%when N is euqual to M, put the pair into the result
sqrt_table(N,M,Result):-
N = M,
M >= 0,
S is sqrt(N),
H = [N,S],
Result = [H].
%when N is not equal to M, everytime let N - 1 until N = M
sqrt_table(N,M,Result):-
N > M,
M >= 0,
S is sqrt(N),
H = [N,S],
Result = [H|T],
N0 is N - 1,
sqrt_table(N0,M,T).

%Q4:chop_up return Result List of two-item lists containing the first and last number in the sequence
%seq is a function that find the sequence
%base case is only one element in the list
seq([First|[]],Seq,NewList):-
Seq = First,
NewList = [].
%if the second one is not the First + 1,NewList is the rest of the List.
seq([First,Second|T],Seq,NewList):-
not(Second is First+1),
Seq = First,
NewList = [Second|T].
%if there's a sequence, the Seq is the last num in a sequence. NewList is the rest of the List.
seq([First,Second|T],Seq,NewList):-
Second is First + 1,
New = [Second|T],
seq(New,Seq,NewList).

%base case
chop_up([],[]).
%not the increasing condition
chop_up(List,[H|T]):-
List = [First|_],
seq(List,Seq,NewList),
Seq is First,
H = First,
chop_up(NewList,T).
%there is a sequence from the First
chop_up(List,[H|T]):-
List = [First|_],
seq(List,Seq,NewList),
not(Seq is First),
H = [First,Seq],
chop_up(NewList,T).


%Q5:tree_eval return the result of evaluating the expression-tree, with z set to specific Value.
%special case when there's one z in the tree, then Eval is Value.
tree_eval(Value,tree(empty,z,empty),Value).
%special case when the only num in the tree, then the Eval is the num.
tree_eval(_,tree(empty,Eval,empty),Eval).
%recursive find all the node in the tree, then use =.. to combine the num and the operator.
tree_eval(Value,tree(L,Op,R),Eval):-
tree_eval(Value,L,Eval0),
tree_eval(Value,R,Eval1),
Eval2 =..[Op,Eval0,Eval1],
Eval is Eval2.


