/*
Pасчетно-гpафическое задание по дисциплине
Функциональное и логическое программирование
для студентов групп ИП-011–017, ИВ-021-023, ИС-041-042

Каждый вариант состоит из трех задач (номер варианта соответствует номеру в
журнале, выбирается по одной задаче из каждого раздела). Программы должны быть
написаны на языке SWI-Prolog. После выполнению РГЗ оформляется отчет, содержащий
титульный лист, условия задач, листинг программы, скриншот теста для каждого
задания.


1. Списки (списки должны вводиться с клавиатуры во время выполнения
программы, использование рекурсии обязательно)

1.2. Удалите из списка все повторные вхождения элементов.
Например, [1,2,1,4,1,2,3]-> [1,2,4,3].
*/

del_rep(L,A):-del_rep(L,[],A).
 
del_rep([],A,A).

del_rep([H|T],L,A):-
    member(H,L),!,
    del_rep(T,L,A).

del_rep([H|T],L,A):-
    append(L,[H],L2),
    del_rep(T,L2,A).

print_del_rep() :- 
    writeln('1.2 Удалите из списка все повторные вхождения элементов.'),
    writeln('Введите список:'), read(L),
	del_rep(L, A),
	writeln('Результат: '), writeln(A).

t1() :- print_del_rep().

/*
2. Строки, файлы

2.2. Запишите в новый файл все строки исходного файла, содержащие в качестве
фрагмента заданную строку, которая вводится с клавиатуры.
*/

file:-
write('Enter the string: '),
read(STR),
writeln(' '),
open('source.txt', read, INTEXT),
set_input(INTEXT),
iteration(INTEXT, L),
close(INTEXT),
findall(X, (member(X, L), limit(1, sub_string(X, _, _, _, STR))), OUT),
open('out.txt', write, OUTFILE),
out(OUTFILE, OUT),
close(OUTFILE).

iteration(_, []):-
at_end_of_stream,
!.
iteration(F, [Head|Tail]):-
read_line_to_codes(F, COD),
string_codes(Head, COD),
iteration(F, Tail).


out(_, []):-!.
out(R, [H|T]):-
writeln(R,H),
out(R, T).


