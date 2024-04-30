/* Simple Expert System (Country identification game).
   start with ?- go. */

go :- hypothesize(Country),
      write('I guess that the country is: '),
      write(Country),
      nl,
      undo.

%------------------------------------------------------

hypothesize(united_arab_emirates) :- united_arab_emirates, !.
hypothesize(south_korea) :- south_korea, !.
hypothesize(japan) :- japan, !.
hypothesize(malaysia) :- malaysia, !.
hypothesize(india) :- india, !.
hypothesize(thailand) :- thailand, !.
hypothesize(greece) :- greece, !.
hypothesize(mexico) :- mexico, !.
hypothesize(sudan) :- sudan, !.
hypothesize(egypt) :- egypt, !.
hypothesize(unknown).


%------------------------------------------------------

united_arab_emirates :-
    asia, islamic, flag_black, flag_red, flag_green, flag_white, arabic,
    	verify(known_for_desert_nature),
    	verify(famous_for_high_towers),
    	verify(known_for_man_made_islands),
    	verify(known_for_investments_and_businessmen),
    	verify(landmarks_are_burj_khalifa),
    	verify(the_capital_city_is_abu_dhabi).

south_korea :-
    asia, non_islamic, flag_white, flag_red, flag_blue, korean,
    	verify(known_for_its_cuisine_such_as_kimchi_and_bibimbap),
    	verify(known_for_its_major_exporter_of_automobiles_and_electronics),
    	verify(known_for_its_drama_and_pop_culture).

japan :-
    asia, non_islamic, flag_white, flag_red, japanese,
    	verify(it_is_an_island_country),
    	verify(known_for_its_traditional_culture_and_technology),
    	verify(known_for_its_cherry_blossoms),
    	verify(famous_for_its_tea_ceremonies).

malaysia:- 
    asia, flag_blue, flag_red, islamic, malay,
    	verify(there_are_many_caves),
    	verify(the_famous_dish_laksa_noodle_soup),
        verify(the_landmarks_is_twin_towers),
        verify(the_capital_city_is_kuala_lumpur).

india :- 
    asia, non_islamic, flag_white, flag_green, flag_orange, hindi,
    	verify(produces_the_most_spice),
    	verify(it_is_known_as_second_most_populous_country_in_the_world),
    	verify(landmarks_himalayan_mountain),
    	verify(landmarks_taj_mahal),
        verify(the_currency_is_indian_rupee),
    	verify(the_capital_city_is_new_delhi).

thailand :- 
    asia, non_islamic, flag_white, flag_blue, flag_red, thai,
    	verify(exporting_rice_and_tourism),
    	verify(it_is_known_for_vibrant_cuisine_and_exquisite_temples),
    	verify(landmarks_wat_arun_temple),
    	verify(landmarks_the_grand_palace),
    	verify(the_currency_is_thai_baht),
    	verify(the_capital_city_is_bangkok).

greece :-
    europe, non_islamic, flag_blue, flag_white, greek,
    	verify(located_next_to_turkey),
    	verify(known_for_its_heritage_and_ancient_history),
    	verify(the_currency_is_euro),
    	verify(santorini_is_the_most_famous_of_its_islands),
    	verify(the_capital_city_is_athens).

mexico :- 
    north_america, non_islamic, flag_red, flag_green, spanish,
    	verify(there_are_many_gangs),
        verify(the_spice_Tajín_Clásico),
        verify(it_is_known_for_its_tacos_and_day_of_the_dead),
    	verify(the_capital_city_is_mexico).

sudan :- 
    africa, islamic, arabic, flag_black, flag_red, flag_white, flag_green,
    	verify(there_are_many_ancient_ruins),
    	verify(export_maize_cotton),
    	verify(known_for_linguistic_diversity),
    	verify(landmarks_nubian_pyramids),
        verify(the_currency_is_sudanese_pound),
   		verify(the_capital_city_is_khartoum).

egypt :- 
    africa, islamic, flag_red, flag_white, flag_black, arabic,
    	verify(it_is_know_for_cultivating_cotton_and_rice),
        verify(landmarks_pyramid_of_djoser),
    	verify(landmarks_giza_necropolis),
    	verify(the_currency_is_egyptian_pound),
    	verify(the_capital_city_is_cairo).

%------------------------------------------------------

asia :- verify(it_is_from_the_Asian_continent), !.
europe :- verify(it_is_from_the_Europe_continent), !. 
north_america :- verify(it_is_from_the_North_American_continent), !.
africa :- verify(it_is_from_the_African_continent), !.
non_islamic :- verify(is_it_non_islamic_country), !.
islamic :- verify(is_it_islamic_country), !.
arabic :- verify(the_language_is_Arabic), !.
hindi :- verify(the_language_is_Hindi), !.
japanese :- verify(the_language_is_Japanese), !.
korean :- verify(the_language_is_Korean), !.
greek :- verify(the_language_is_Greek), !.
malay :- verify(the_language_is_Malay), !.
spanish :- verify(the_language_is_Spanish), !.
thai :- verify(the_language_is_Thai), !.
flag_blue :- verify(the_flag_contain_blue_color), !.
flag_red :- verify(the_flag_contain_red_color), !.
flag_green :- verify(the_flag_contain_green_color), !.
flag_white :- verify(the_flag_contain_white_color), !.
flag_black :- verify(the_flag_contain_black_color), !.
flag_orange :- verify(the_flag_contain_orange_color), !.


%------------------------------------------------------

ask(Question) :-
    write('Does the country have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

%------------------------------------------------------

verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

%------------------------------------------------------

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.