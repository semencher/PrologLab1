% Copyright

implement main
    open core

class predicates
    findPath : (string [out]).


class facts
    edge : (string Val1, string Val2) determ.

clauses
    findPath(Result):-
        console::write("Enter count of edge: "), console::nl,
        console::read(EdgeCount),


clauses
    run() :-
        findPath(Result),
        console::write(Res),
        succeed.
        % place your own code here

end implement main

goal
    console::runUtf8(main::run).
