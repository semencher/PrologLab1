implement main
    open core

class predicates
    findPath : (boolean [out]).
    enterEdges : (integer, integer).
    byPath : (integer, integer, boolean [out]).
    isFind : (integer, integer, boolean [out]).

class facts
    edge : (integer BeginPoint, integer EndPoint).

clauses
    findPath(Result) :-
        console::write("Enter count of edge: "),
        console::nl,
        EdgeCount = console::read(),
        enterEdges(0, EdgeCount),
        console::nl,
        console::write("Path: "),
        console::nl,
        BeginPoint = console::read(),
        EndPoint = console::read(),
        console::nl,
        byPath(BeginPoint, EndPoint, Result).

    enterEdges(I, Size) :-
        I < Size,
        !,
        FirstOp = console::read(),
        SecondOp = console::read(),
        assert(edge(FirstOp, SecondOp)),
        enterEdges(I + 1, Size).

    enterEdges(_I, _Size).

    isFind(BeginPoint, EndPoint, Result) :-
        edge(BeginPoint, X),
        X = EndPoint,
        !,
        Result = true.

    isFind(_, _, false).

    byPath(BeginPoint, EndPoint, Result) :-
        isFind(BeginPoint, EndPoint, TmpResult),
        TmpResult = true,
        !,
        Result = true.

    byPath(BeginPoint, EndPoint, Result) :-
        edge(BeginPoint, X),
        retract(edge(BeginPoint, X)),
        byPath(X, EndPoint, TmpResult),
        TmpResult = true,
        !,
        Result = true.

    byPath(_, _, false).

clauses
    run() :-
        findPath(Result),
        console::write("Answer: "),
        console::write(Result),
        console::nl,
        succeed.
        % place your own code here

end implement main

goal
    console::runUtf8(main::run).
