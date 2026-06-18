--PARTE B:
--QUESTAO 01: Criar tabela

CREATE TABLE best_films (
	id serial PRIMARY KEY,
	title varchar(200) NOT NULL,
	description TEXT NOT NULL
);

--QUESTAO 02: Acessar site.

--QUESTAO 03: Inserir 8 filmes
INSERT INTO best_films (title, description) VALUES ($$Being the Ricardos$$, $$Writer/director Aaron Sorkin's biopic and show-biz drama, told through flashbacks and various witness-perspectives, followed the fame and fortunes of 1950s-TV most-beloved couple: RKO's red-headed studio actress Lucille Ball (Nicole Kidman) who had appeared in numerous low-budget films, and Cuban-born singer/band-leader Desi Arnaz (Javier Bardem). After marrying and moving to Hollywood, Lucy's casting in the successful radio show My Favorite Husband in 1948 morphed by 1953 into a very popular CBS-TV comedy sit-com show renamed I Love Lucy, where the two played husband and wife. Behind the scenes, the couple were already facing issues regarding Arnaz's frequent cheating and infidelity. On the set of I Love Lucy, Vivian Vance (Nina Arianda) and William Frawley (J.K. Simmons) (portraying their married neighbors Ethel and Fred Mertz), continually feuded with each other, and Frawley was frequently drunk. However, the hit TV show and their own marriage were even more threatened during a tumultuous week ( a period known as the Red Scare), when political allegations surfaced in a newspaper article - claiming that Lucy was a Communist. Although Lucy was cleared of the charges, their martial problems intensified and ultimately led to Lucy filing for divorce after the taping of their last show in 1960.$$);

INSERT INTO best_films (title, description) VALUES ($$Belfast$$,$$This semi-autobiographical, B/W political and childhood drama, written and directed by Kenneth Branagh, was set amidst the tumult and turmoil of life in Northern Ireland in the late 1960s, when conflict and problems in the region (known as "The Troubles") were occurring between "Protestants" (composed mostly of Unionists and Loyalists who wanted to remain united with the UK) and "Catholics" (composed mostly of Nationalists and Republicans who wanted a united Ireland). The main character was 9 year-old Irish boy named Buddy (Jude Hill), who had a brother named Will (Lewis McAskie). Buddy's grandparents were Granny (Judi Dench) and Pop (Ciarán Hinds). Buddy's working-class parents Pa and Ma (Jamie Dornan and Caitriona Balfe) were worried that their family was in extreme danger (and might be forced to move), especially since they identified as 'Protestants' and were being pressured to take sides.$$);

INSERT INTO best_films (title, description) VALUES ($$CODA$$, $$The title of writer/director Sian Heder's sweet, highly-emotional, coming-of-age family drama and musical was taken from the acronym CODA (meaning 'Child of Deaf Adult'). The Best Picture Oscar winner was remarkable for having in its cast a trio of hearing-challenged actors. The only non-hearing impaired individual in the family of deaf people living in Cape Ann's town of Gloucester, Mass. (who were engaged in the fishing sales business) was talented, teenaged, 17 year-old Ruby Rossi (Britisher Emilia Jones), an aspiring singer with plans to attend college at the highly-competitive Berklee College of Music if she could acquire a scholarship. By signing for her family's deaf members, her father Frank (Troy Kotsur) and mother Jackie (Marlee Matlin) and older disgruntled brother Leo (Daniel Durant), they had become almost totally-co-dependent and reliant upon her to communicate for them - jeopardizing her chances of an educational future. She was also struggling to have a normal romantic relationship with shy schoolmate Miles (Ferdia Walsh-Peelo), a member of the HS choir and her duet partner, while attending private singing lessons with her school's idealistic music teacher Bernardo "Mr. V” Villalobos (Eugenio Derbez) before auditioning for college. However, to fulfill her dreams, she realized that she would have to break away from her home and abandon her parents, who were pressuring her to continue as an intermediary involved in the family's fishing enterprise. She was resigned to her fate, until her parents attended her choir recital (and applauded when they saw others doing the same), and also secretly watched her Boston college audition from a balcony as she sang Joni Mitchell's 'Both Sides Now.' Remarkably, they remained supportive when she decided to follow her musical passion and proceed with her educational plans. In the film's ending, as Ruby was driven away, she flashed her family with one final ASL sign that meant: "I Love You" (the symbols of I, L, and Y).$$);

INSERT INTO best_films (title, description) VALUES ($$Don't Look Up$$, $$Writer/director Adam McKay's comedy about a possible, impending apocalyptic climate tragedy was prescient. Michigan State University Professor Dr. Randall Mindy (Leonardo DiCaprio) and his astronomy grad student Kate Dibiasky (Jennifer Lawrence) discovered a comet headed directly toward Earth that could potentially - in six months - destroy the entire planet. Their serious warnings during a whirlwind media tour fell on deaf ears and were met with apathy and indifference, from individuals including US President Janie Orlean (Meryl Streep), her Chief of Staff/son Jason (Jonah Hill) and two upbeat, popular morning talk show (The Daily Rip) hosts Brie Evantee (Cate Blanchett) and Jack (Tyler Perry). Individuals took sides over the issue - those who wished to save the planet with efforts to divert the comet, those who wanted to exploit the comet's valuable and scarce previous minerals (led by tech billionaire Peter Isherwell who was a prominent financial supporter of the President), and those who didn't believe that there was even a problem. The film concluded with a last-minute escape plan to avoid being obliterated - an exclusive flight on a spaceship to another Earth-like planet with passengers placed in cryogenic sleep. The comet struck Earth as predicted and killed nearly everyone (although there were some who survived, including Jason). During the end credits, 22,000 years into the future, the spaceship landed on a tropical alien planet where the survivors were immediately attacked and killed by wild animals.$$);

INSERT INTO best_films (title, description) VALUES ($$Drive My Car$$, $$Japanese director/writer Ryûsuke Hamaguchi's contemplative, heart-wrenching, lengthy psychological drama about grief was adapted from Haruki Murakami's 2014 short story. Nominated for both Best Picture and for Best International Feature Film. In the story, the recently widowed Yusuke Kafuku (Hidetoshi Nishijima), a famed and successful stage actor/director in Tokyo, had been chosen to direct a new adapted production in Hiroshima of Chekov's Russian play Uncle Vanya. Two years earlier, Yusuke's TV playwright wife Oto (Reika Kirishima) had suddenly and unexpectedly disappeared and was presumed dead. Soft-spoken, initially-intimidated young Misaki Watari (Toko Miura) served as Yusuke's chauffeur due to safety rules, and drove him to and from the production's many rehearsals. She was hired to drive him in his own beloved, red Saab 900 (hence the title "Drive My Car"). They bonded together as he began to be haunted by thoughts that his wife had betrayed him and been unfaithful with handsome TV star Koshi Takatsuki (Masaki Okada), whom he had inexplicably cast in the current production as the middle-aged Vanya.$$);
  
INSERT INTO best_films (title, description) VALUES ($$Dune$$,$$This was the second version of Frank Herbert’s popular and epic 1965 sci-fi novel (its first half), following director David Lynch's 1984 box-office failure. The big-budget, messianic hero's-journey tale (Part One) was set more than 8,000 years in the future. On the limited, foggy and misty oceanic planet of Caladan, gifted heir and son Paul Atreides (Timothée Chalamet) was born into the noble House of Atreides, consisting of Duke Leto Atreides (Oscar Isaac) and witch-mother concubine Lady Jessica Atreides (Rebecca Ferguson), a member of the sisterhood of Bene Gesserit. Troubled by premonitions and visions of the future (including a Fremen woman named Chani (Zendaya)), Paul was entrusted with traveling to Arrakis (aka Dune), a dangerous, inhospitable desert planet, to protect the future of his family and people. Arrakis was home to a very precious and valuable psychogenic substance known as "melange" (aka "the spice") - a drug that prolonged life and enhanced thinking and perception. The desert crop known as "spice" was also required for interstellar travel by navigators to instantly cover vast distances through expanded consciousness. Also on the planet were giant sandworms that traveled under the desert. Imperial politics were in full swing, as malevolent forces known as the Harkonnens had been fighting for many centuries over the drug with the planet's navite warrior-inhabitants, the Fremen. Deadly war was imminent in the future between the House of Atreides and their foes - the monstrous House of Harkonnen, once Paul arrived on Arrakis. In the film's conclusion, Paul joined the Fremen to fulfill his father's goal of bringing peace to Arrakis.$$);


INSERT INTO best_films (title, description) VALUES ($$Nightmare Alley$$, $$Co-writer/director Guillermo del Toro's intriguing crime-mystery thriller was an adaptation of William Lindsay Gresham's hard-boiled and gritty 1946 novel, first made into a stylish film noir in 1947 by Edmund Goulding and starring Tyrone Power. In the remake's neo-noir plot set in the late 1930s and early 40s, traveling carnival worker Stanton "Stan" Carlisle (Bradley Cooper), an ambitious and manipulative con-artist, had joined after leaving his Midwestern roots, murdering his alcoholic father and burning of the corpse inside his cursed childhood home - a wooden cottage. Seedy carnival owner Clement "Clem" Hoately (Willem Dafoe) explained how he could easily take advantage of down-and-out drifters to work as the carnival's side-show 'geek' - a performer who would spectacularly bite off the heads of live chickens for audiences. Stan became enamoured by virginal co-worker Molly Cahill (Rooney Mara), who stage-performed as an electricity-conductor. The smooth-talking Stan also set his sights on success in the world by learning the deceptive trickery (coded language signals) of an old husband-and-wife couple: carny clairvoyant tarot-card reader Madame Zeena Krumbein, the Seer (Toni Collette) and her alcoholic husband Pete (David Strathairn). One night after accidentally providing Pete with a lethal bottle of toxic wood alcohol, Stan fled from the carnival with Molly. Two years later, the pair had become successful as a stage-performing, mentalist psychic-act duo in an Art Deco supper-nightclub for swanky and rich audiences in the city of Buffalo, NY. During one evening's performance, psychiatrist Dr. Lilith Ritter (Cate Blanchett) was in the audience and attempted to expose Stan's deceptive and phony techniques - but failed to embarrass him. He thought he had duped her - but not for long. Soon after, Stan was employed by wealthy Judge Kimball (Peter MacNeill), who believed that Stan could show him and his wife how to communicate with their dead son. Meanwhile, Stan had fallen in love and collaborated with the blonde femme fatale Dr. Ritter as his slinky con-artist associate (to provide background information on his scam-victims for their mutual benefit), to swindle and con the Judge and other elite members of the local society for greater monetary rewards. (Later, the Judge and his wife were found dead in a murder-suicide while vainly trying to reunite with their son.) During a climactic scam-act to swindle abusive Ezra Grindle (Richard Jenkins), Stan convinced Molly (who was on the verge of abandoning him) to appear as a dead female named Dorrie - Ezra's lover who had died following a failed abortion. The scam failed when Dorrie was revealed as a fake, prompting Stan to murder both Grindle and his bodyguard-associate Anderson (Holt McCallany). The film's main concluding revelation was that Dr. Ritter, in a turn-around battle of wits, had been scamming Stan - she threatened to use her audio recordings of their therapy sessions to expose his mental illness. She shot Stan in the ear before he murdered her by strangulation. He fled from authorities, and ended up both alcoholic and homeless, and begging for the "Geek" job from another carnival owner. The film's last line was Stan's acceptance of the Geek job while simultaneously laughing and crying: "Mister, I was born for it."$$);


INSERT INTO best_films (title, description) VALUES ($$The Power of the Dog$$, $$Based upon the 1967 semi-autobiographical novel of the same name by Thomas Savage (a closeted gay family man), this romantic drama, character study and western was shot on location in New Zealand, to represent mid-1920s Montana. The title of the film referred to a carved shape of a barking dog in the side of a mountain, and to a Bible verse. In the plot with themes of bullying-masculinity and repressed homosexuality, brazen, hard-hearted rancher Phil Burbank (Benedict Cumberbatch) constantly ridiculed his kind-hearted, likeable brother George's (Jesse Plemons) new wife - the previously-widowed inn owner Rose Gordon (Kirsten Dunst) and especially her frail and effeminate son Peter Gordon (Kodi Smit-McPhee) who had a lisp. With great animosity, cruelty and harsh anger, Phil believed that Rose had married George for his money and often mocked, belittled and taunted her, causing her to secretly begin to excessively drink alcohol. George's wealth helped to send Rose's "sissy" son Peter to medical school to study diseases and surgery, following in the footsteps of his alcoholic medical-doctor father who had committed suicide by hanging. When Peter came home for the summer, he came across evidence that the abusive Phil was hiding the fact that he was attracted to men - he found a stash of magazines of nude men, and spotted Phil bathing naked with a handkerchief around his neck. Clues to Phil's sexual orientation were clear - the handkerchief belonged to his late homosexual mentor - a mysterious character he loved known as Bronco Henry. Peter realized that his own mistreatment was Phil's defense mechanism regarding his own self-hatred. Over time, the tormenting Phil began to express a strange friendship for Peter and taught him western skills, such as riding a horse and roping with a rawhide lasso. Peter also learned that Phil's life had been saved by Bronco Henry during freezing weather, when the men laid naked together in a bed roll. Phil acquired a serious hand wound acquired while repairing a fence, and after the open gash became severely infected, he unexpectedly died. At his funeral, the doctor diagnosed that Phil probably died from the infectious disease anthrax - although Phil had always avoided diseased cattle. In the anti-climactic finish, Peter read a passage from the Book of Common Prayer about burial rites, and stopped on Psalm 22:20: "Deliver my soul from the sword; my darling from the power of the dog." In the film's twist, there were strong implications that Peter had deliberately infected his uncle Phil (to bring harmony to his family) by having him come into contact with a piece of rawhide (for the construction of a lasso rope) that he had cut from an diseased cow. $$);

--QUESTAO 4: Retornar titulos que possuem she na descrição
SELECT title 
FROM best_films 
WHERE description LIKE('%she%');
--Resposta, 3 resultados: CODA, Don't Look Up, Nightmare Alley

--QUESTAO 5: Retornar titulos que possuem She na descrição e comparar com a questão 4.
SELECT title 
FROM best_films 
WHERE description LIKE('%She%');
--Resposta: Não. Drive My Car não apareceu na primeira consulta e Don't Look Up não apareceu nessa consulta.

--QUESTAO 6: Retornar titulos que possuem She na descrição idenpedente de letras maiúsculos ou menúsculas.
SELECT title
FROM best_films
WHERE description ILIKE('%She%');
--Resposta, sim, é a união dos dois: CODA, Don't Look Up, Drive My Car, Nightmare Alley.
 
--PARTE C
--Questão 7: Usando o to_tsvector e to_tsquery, busque por titulos que contém 'directs' em sua descição.
SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'directs');
--Resposta: Belfast, Don't Look Up, Drive My Car.

--Questão 8: Usando o to_tsvector e to_tsquery, busque por titulos que contém 'direct', 'directed' e 'director' em sua descição.
SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'direct');     
--Resultado: Belfast, Don't Look Up, Drive My Car.

SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'directed');
--Resultado: Belfast, Don't Look Up, Drive My Car.

SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'director');
--Resultado: Dune.

--Resposta: São iguais apenas entre direct e directed.

--Questão 9:
/*Após inspecionar os vetores gerados pela função to_tsquery() para cada um dos termos de busca ('direct', 'directs', 'directed' e 'director'), podemos observar o seguinte:

Para o termo 'direct':

Vetor de consulta: 'direct', 'directs'e 'directed':
Resultados retornados: 'Belfast', 'Don't Look Up' e 'Drive My Car'
Esses resultados são consistentes com a busca pela 

Vetor de consulta: 'director'
Resultados retornados: 'Dune'
Neste caso, apenas 'Dune' é retornado, o que sugere que este filme é mencionado com o termo 'director' em sua descrição.
*/

--Questão 10: Inspecionar a descrição de algum filme usando o to_tsvector:

SELECT to_tsvector('english', description)
FROM best_films
LIMIT 1;                                                                        
/*
 '1948':79 '1950s':26 '1950s-tv':25 '1953':82 '1960':221 'aaron':2 'actress':38 'alleg':182 'alreadi':112 'although':194 'appear':45 'arianda':132 'arnaz':58,116 'articl':187 'ball':40 'bardem':60 'behind':106 'belov':30 'biopic':5 'biz':9 'born':55 'budget':50 'cast':69 'cbs':88 'cbs-tv':87 'charg':200 'cheat':119 'claim':188 'clear':197 'com':93 'comedi':90 'communist':193 'continu':146 'coupl':31,110 'cuban':54 'cuban-born':53 'desi':57 'divorc':212 'drama':10 'drunk':155 'ethel':142 'even':166 'face':113 'fame':21 'favorit':76 'feud':147 'file':210 'film':51 'flashback':13 'follow':19 'fortun':23 'frawley':135,152 'fred':144 'frequent':118,154 'head':36 'hit':158 'hollywood':66 'howev':156 'husband':77,103 'infidel':121 'intensifi':204 'issu':114 'j.k':136 'javier':59 'kidman':42 'known':175 'last':218 'led':207 'love':97,127 'low':49 'low-budget':48 'luci':67,98,128,190,195,209 'lucill':39 'marri':62,140 'marriag':164 'martial':202 'mertz':145 'morph':80 'most-belov':28 'move':64 'neighbor':141 'newspap':186 'nicol':41 'nina':131 'numer':47 'period':174 'perspect':18 'play':102 'polit':181 'popular':86 'portray':138 'problem':203 'radio':73 'red':35,178 'red-head':34 'regard':115 'renam':95 'rko':32 'scare':179 'scene':108 'set':124 'show':8,74,94,160,219 'show-biz':7 'simmon':137 'singer/band-leader':56 'sit':92 'sit-com':91 'sorkin':3 'studio':37 'success':72 'surfac':183 'tape':215 'threaten':168 'told':11 'tumultu':171 'tv':27,89,159 'two':101 'ultim':206 'vanc':130 'various':15 'vivian':129 'week':172 'wife':105 'william':134 'wit':17 'witness-perspect':16 'writer/director':1

Resposta: O resultado da função to_tsvector() para a descrição de um filme parece ser uma representação detalhada das palavras-chave e suas posições no texto original. O vetor começa com uma lista de palavras-chave, onde cada palavra-chave é seguida por um número que representa sua posição no texto original, por exemplo, 'film':51 indica que a palavra "film" foi encontrada na posição 51 do texto original, se possuir mais dde uma posição, então fica: luci':67,98,128,190,195,209 sugere que a palavra aparece em várias posições do texto original.
Além disso, palavras compostas ou frases também são representadas no vetor. Ignorand se é maiúsculo ou menúsculo*/

--Questão 11:

SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'drama');
--Resultado: Being the Ricardos, Belfast, CODA, Drive My Car, The Power of the Dog.

SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'Drama');
--Resultado: Being the Ricardos, Belfast, CODA, Drive My Car, The Power of the Dog.

SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'DRAMA');
--Resultado: Being the Ricardos, Belfast, CODA, Drive My Car, The Power of the Dog.

--Questão 12:

/*Resposta: Por padrão, trata a busca de texto completo como "case-insensitive" (insensível a maiúsculas e minúsculas), ou seja, os resultados são iguais independentemente de usar 'drama', 'Drama' ou 'DRAMA', o PostgreSQL retornará os mesmos resultados, pois todas as formas da palavra serão tratadas da mesma maneira durante a busca de texto completo.*/

--Questão 13:

--Letra a)
SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'drama & family');
--Resultado: Belfast, CODA, The Power of the Dog.

--Letra b)
SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'drama | family');
--Resultado: Being the Ricardos, Belfast, CODA, Drive My Car, Dune, The Power of the Dog.

--Letra c)
SELECT title
FROM best_films
WHERE to_tsvector('english', description) @@ to_tsquery('english', '!drama & family');
--Resultado: Dune.

