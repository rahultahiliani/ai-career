:- dynamic input/2.

career(math) :- (input(engineering, y); input(commerce, y)), input(numbers, y), input(theoretical, y), input(detail_oriented, y).
career(economics) :- input(commerce, y), input(numbers, y), input(theoretical, y), input(detail_oriented, y).
career(computer_science) :- input(engineering, y), input(hands_on, y), input(detail_oriented, y).
career(healthcare) :- input(biology, y), input(teams, y), input(hands_on, y), input(help_others, y).
career(design) :- (input(stream, csd); career(liberal_arts)), input(teams, y), input(creative, y), input(hands_on, y), input(communicator, y).
career(psychology) :- (input(biology, y); input(humanities, y)), input(help_others, y), input(hands_on, y).
career(liberal_arts) :- (input(social_science, y); input(humanities, y)), input(communicator, y), input(impact, y).
career(politics) :- (input(social_science, y); input(humanities, y)), input(leadership, y), input(public_speaking, y), input(impact, y), input(hands_on, y).
career(management) :- input(teams, y), input(leadership, y), input(flexible_schedule, y), input(communicator, y).
career(finance) :- input(commerce, y), input(money, y), input(numbers, y), input(theoretical, y), input(detail_oriented, y).
career(electronics) :- input(stream, ece), input(theoretical, y).
career(teaching) :- input(stream, _), input(job_security, y), input(strict_schedule, y), input(help_others, y), input(theoretical, y), input(impact, y), input(communicator, y).
career(entrepreneurship) :- career(management), input(creative, y), input(money, y), input(impact, y).
career(research) :- input(teams, y), input(hands_on, y), input(theoretical, y), input(detail_oriented, y), input(strict_schedule, y).
career(freelancing) :- input(biology, n), input(job_security, n), input(flexible_schedule, y), input(communicator, y).

describe(math) :- write('Math: '), nl, write('You could try exploring the field of theoretical mathematics!').
describe(economics) :- write('Economics: '), nl, write('Economics is the social science of goods and services. It provides a variety of intersectional opportunities!'), nl.
describe(computer_science) :- write('Computer Science: '), nl, write('If you enjoy coding and math, software development might be the way for you!'), nl.
describe(healthcare) :- write('Healthcare: '), nl, write('The field of healthcare is a noble one and provides medical assistance to people in need.'), nl.
describe(design) :- write('Design: '), nl, write('From art to apps, design is ubiquitous and offers a number of opportunities!'), nl.
describe(psychology) :- write('Psychology: '), nl, write('If helping individuals be their best selves sounds meaningful to you, psychology just might be your thing!'), nl.
describe(freelancing) :- write('Freelancing: '), nl, write('Choose your own jobs and at your own pace: this is the mantra of any freelancer. Do check it out!'), nl.
describe(liberal_arts) :- write('Liberal Arts: '), nl, write('If working at the intersection of various sociological areas sounds exciting to you, do check out the expansive field of liberal arts!'), nl.
describe(politics) :- write('Politics: '), nl, write('Lead people and be the harbinger of change: politics allows you to make a difference via policies and governance.'), nl.
describe(management) :- write('Management: '), nl, write('Management involves working with teams and leading them towards a common goal.'), nl.
describe(math) :- write('Math: '), nl, write('If you\'re a commerce enthusiast, you should definitely check out finance'), nl.
describe(electronics) :- write('Electronics: '), nl, write('Electronics is an exciting field that covers both hardware and software.'), nl.
describe(teaching) :- write('Teaching: '), nl, write('Teaching is an incredibly satisfying field and might just be the right for you!'), nl.
describe(research) :- write('Research: '), nl, write('Research today is diverse, and if you\'re passionate about it you can carve a niche for yourself too!'), nl.
describe(entrepreneurship) :- write('Entrepreneurship: '), nl, write('The entrepreneurial world is an exciting one, do check it out!'), nl.

suggest(C) :- career(C), assert(recommended(C)).
suggest(_) :- nl, convert_to_list(List), write('Here\'s a list of fields that will interest you:'), nl, remove_duplicates(List), nl.

convert_to_list([Px|Tail]) :- retract(recommended(Px)), convert_to_list(Tail).
convert_to_list([]).

print_list([], _).
print_list([H|T], I) :- write(I), write(' '), write(H), nl, N is I+1, print_list(T, N).

print_result_list([], _).
print_result_list([H|T], I) :- write(I), write(' '), describe(H), nl, N is I+1, print_result_list(T, N).

remove_duplicates(List) :- sort(List, X), print_result_list(X, 1), nl.

:- write('Pick your stream: '), nl, print_list([cse, csam, ece, csd, csss, csb, csai], 1), read(R), assert(input(stream, R)), nl.

:- write('For the following questions, type \'y\' for yes, and \'n\' for no.'), nl.

:- write('Are you interested in/have experience with engineering?'), nl, read(R), assert(input(engineering, R)), nl.
:- write('Are you interested in/have experience with medical sciences?'), nl, read(R), assert(input(biology, R)), nl.
:- write('Are you interested in/have experience with social sciences?'), nl, read(R), assert(input(social_science, R)), nl.
:- write('Are you interested in/have experience with commerce?'), nl, read(R), assert(input(commerce, R)), nl.
:- write('Are you interested in/have experience with humanities?'), nl, read(R), assert(input(humanities, R)), nl.

:- write('Do you prefer to work in a team?'), nl, read(R), assert(input(teams, R)), nl.
:- write('Do you consider yourself a creative person?'), nl, read(R), assert(input(creative, R)), nl.
:- write('Is job security an important factor for you?'), nl, read(R), assert(input(job_security, R)), nl.
:- write('Do you prefer a strict schedule?'), nl, read(R), assert(input(strict_schedule, R)), nl.
:- write('Do you prefer a flexible schedule?'), nl, read(R), assert(input(flexible_schedule, R)), nl.
:- write('Is making a lot of money a priority for you?'), nl, read(R), assert(input(money, R)), nl.
:- write('Do you like working with numbers?'), nl, read(R), assert(input(numbers, R)), nl.
:- write('Do you like helping people?'), nl, read(R), assert(input(help_others, R)), nl.
:- write('Are you comfortable with public speaking?'), nl, read(R), assert(input(public_speaking, R)), nl.
:- write('Do you consider yourself a good leader?'), nl, read(R), assert(input(leadership, R)), nl.
:- write('Do you prefer hands-on work?'), nl, read(R), assert(input(hands_on, R)), nl.
:- write('Do you like studying theoretical concepts?'), nl, read(R), assert(input(theoretical, R)), nl.
:- write('Do you wish to impact the daily lives of people?'), nl, read(R), assert(input(impact, R)), nl.
:- write('Are you a good communicator?'), nl, read(R), assert(input(communicator, R)), nl.
:- write('Are you detail-oriented?'), nl, read(R), assert(input(detail_oriented, R)), nl.

:- write('Thanks for the information!'), nl.
:- write('Type suggest(X). to view your results.'), nl.