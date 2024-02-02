# Testowanie oprogramowania 2016/17

### 1. Wykonywanie testów akceptacyjnych jest najwłaściwsze dla osiągnięcia którego celu testowania?
A) znajdowania defektów\
**B) uzyskania pewności co do poziomu jakości**\
C) dostarczenia informacji co do podjęcia decyzji\
D) zapobiegania pojawiania się defektów

#### Uzasadnienie:

A) Znajdowanie defektów to główny cel testów jednostkowych i testów integracyjnych. Testy akceptacyjne skupiają się na sprawdzeniu, czy system spełnia określone wymagania i jest gotowy do akceptacji przez użytkownika końcowego.

C) Dostarczanie informacji co do podjęcia decyzji to celem różnych rodzajów testów, ale testy akceptacyjne skupiają się głównie na potwierdzeniu zgodności systemu z oczekiwaniami użytkownika, a nie na dostarczaniu informacji do podjęcia decyzji.

D) Zapobieganie pojawiania się defektów to główny cel działań związanych z zapobieganiem defektom, takich jak analiza statyczna czy testy jednostkowe, a niekoniecznie testy akceptacyjne.

### 2. Wskaż poprawne następstwo zdarzeń:
A) defekt powoduje błąd, który może powodować awarię\
B) pomyłka powoduje awarię, która może powodować defekt\
**C) pomyłka powoduje defekt, który może powodować awarię**\
D) błąd powoduje defekt, który może powodować awarię

### 3. Aby przezwyciężyć tzw. paradoks pestycydów, należy:
**A) regularnie przeglądać i aktualizować testy**\
B) wykorzystywać techniki projektowania testów do wyprowadzenia skończonej liczby przypadków testowych dla potencjalnie nieskończonej liczby kombinacji wejść*\
C) rozpoczynać testowanie możliwie jak najwcześniej\
D) dostosować strategię testową do kontekstu

#### Uzasadnienie:

"Paradoks pestycydów" to termin używany w testowaniu oprogramowania, który mówi, że jeśli ciągle uruchamiamy te same testy, tracą one zdolność do znajdywania nowych defektów. Innymi słowy, ciągłe powtarzanie tych samych testów prowadzi do sytuacji, w której przestają one w pewnym momencie wykrywać nowe defekty. Aby móc wykrywać nowe defekty, może być konieczne zmodyfikowanie dotychczasowych testów i danych testowych, a także napisanie nowych testów. 

Termin ten jest analogią do stosowania pestycydów w rolnictwie. Tak jak pestycydy są skuteczne w eliminowaniu szkodników na początku, ale z czasem szkodniki mogą stać się odporne, tak samo testy mogą przestać wykrywać nowe błędy, jeśli są ciągle te same.

### 4. Wykorzystywanie zaślepek i sterowników jest typowe dla:
**A) testów jednostkowych**\
B) testów integracyjnych\
C) testów systemowych\
D) testów akceptacyjnych

### 5. Model procesu biznesowego jest typową podstawą dla:
A) testów jednostkowych\
B) testów rergesji\
C) testów bezpieczeństwa\
**D) testów białoskrzynkowych**

### 6. Wskaż zdanie prawdziwe:
A) retesty mogą być zaplanowane\
**B) testy regresji są związane ze zmianą w oprogramowaniu**\
C) testy regresji wykonuje się po retestach\
D) retesty wykonuje się po testach regresji

### 7. Testowanie statyczne:
A) wykonuje się przed testami dynamicznymi\
**B) jest zwykle wykonywane z użyciem narzędzi**\
C) obejmuje wyłącznie ręczne sprawdzanie kodu\
D) to inna nazwa przeglądu formalnego

### 8. Element (np. funkcja, transakcja, własność, atrybut), który może być sprawdzony przez jeden lub więcej przypadków testowych to:
A) element pokrycia\
B) scenariusz testowy\
**C) warunek testowy**\
D) wymaganie biznesowe

### 9. Kryterium pokrycia K1 subsumuje kryterium pokrycia K2 wtedy i tylko wtedy, gdy:
**A) każdy zestaw testów spełniających K1 spełnia również K2**\
B) każdy zestaw testów spełniających K2 spełnia również K1\
C) dla każdego zestawu testów pokrycie K1 tymi testami jest co najmniej takie samo jak pokrycie K2\
D) dla każdego zestwu testów pokrycie K2 tymi testami jest co najmniej takie samo jak pokrycie K1

### 10. Która technika testowania będzie najwłąsicwsza w przypadku testowania systemu silnie opartego na przetwarzaniu danych?
A) MC\DC\
B) BVA\
**C) CRUD**\
D) WAMMI

#### Uzasadnienie:

W przypadku systemu silnie opartego na przetwarzaniu danych, najbardziej odpowiednia będzie technika **CRUD**. CRUD to akronim od Create, Read, Update, Delete - podstawowych operacji wykonywanych na danych. Testy CRUD zapewniają, że system prawidłowo przetwarza dane, co jest kluczowe dla systemów opartych na przetwarzaniu danych. Pozostałe techniki (MC/DC, BVA, WAMMI) mogą być również użyteczne w różnych kontekstach, ale nie są one specyficzne dla testowania przetwarzania danych.

A) MC/DC (Modified Condition/Decision Coverage) to technika skupiająca się na pokryciu wszystkich możliwych kombinacji warunków logicznych w decyzjach programu. Nie jest to szczególnie przydatne w kontekście systemów opartych na przetwarzaniu danych.

B) BVA (Boundary Value Analysis) to technika testowania, która skupia się na testowaniu wartości granicznych dla danych wejściowych. Chociaż może być użyteczna w kontekście systemów opartych na przetwarzaniu danych, nie jest to technika specyficzna dla tego typu systemów.

D) WAMMI (Website Analysis and MeasureMent Inventory) to technika używana do oceny użyteczności i satysfakcji użytkownika z interfejsów webowych.

### 11. Graf przyczynowo-skutkowy zawiera dwie przyczyny *P<sub>1</sub>*, *P<sub>2</sub>* oraz trzy skutki *S<sub>1</sub>*, *S<sub>2</sub>*, *S<sub>3</sub>* zadane następującymi zależnościami:
- *S<sub>1</sub>* = *NOT*(*P<sub>1</sub>*)
- *S<sub>2</sub>* = *P<sub>1</sub>* *AND* *P<sub>2</sub>*
- *S<sub>3</sub>* = *P<sub>2</sub>*

#### Ile kolumn posiadać będzie równoważna temu grafowi zminimalizowana tablica decyzyjna?
A) 1\
B) 2\
C) 3\
**D) 4**\
E) 5\
F) 6

#### Uzasadnienie:

Równoważna zminimalizowana tablica decyzyjna będzie zawierać wszystkie unikalne kombinacje przyczyn (P1 i P2), które prowadzą do różnych zestawów skutków (S1, S2, S3). Analizując podane zależności, możemy stwierdzić, że:

- S1 zależy tylko od P1.
- S2 zależy od obu P1 i P2.
- S3 zależy tylko od P2.

Musimy więc rozważyć wszystkie kombinacje P1 i P2, aby określić odpowiadające im wartości S1, S2 i S3. Możliwe kombinacje P1 i P2 to:

1. P1 = FALSE, P2 = FALSE
2. P1 = FALSE, P2 = TRUE
3. P1 = TRUE, P2 = FALSE
4. P1 = TRUE, P2 = TRUE

Dla każdej z tych kombinacji określimy wartości S1, S2 i S3:

1. P1 = FALSE, P2 = FALSE -> S1 = TRUE, S2 = FALSE, S3 = FALSE
2. P1 = FALSE, P2 = TRUE -> S1 = TRUE, S2 = FALSE, S3 = TRUE
3. P1 = TRUE, P2 = FALSE -> S1 = FALSE, S2 = FALSE, S3 = FALSE
4. P1 = TRUE, P2 = TRUE -> S1 = FALSE, S2 = TRUE, S3 = TRUE

Zatem w zminimalizowanej tablicy decyzyjnej będziemy mieli 4 kolumny, każda odpowiadająca jednej z powyższych kombinacji przyczyn P1 i P2.

### 12. System oblicza ocenę z przedmiotu na podstawie sumy punktów za ćwiczenia (C) i egzamin (E) zgodnie ze specyfikacją:

    jeżeli (C+E > 50) to decyzja = przedmiotZdany
    else decyzja = przedmiotNiezdany

Załóż, że dane wejściowe C i E są liczbami całkowitymi z zakresu od 0 do 50 włącznie. Dane wejściowe do testu to para (C, E). 

#### Wskaż zbiór testów pokrywający wartości brzegowe klasy równoważności sumy punktów odpowiadające za niezdanie przedmiotu:
A) (50, 1), (50,50)\
B) (15, 40), (25, 26)\
C) (0, 49), (49, 50)\
D) (0, 50), (50, 0)\
**E) (0, 0), (42, 8)**

### 13. Jaki test nalży dodać do poniższej suity testów, aby uzyskać pokrycie kryterium pair-wise dka zmiennych *v*, *x*, *y*, *z* ∈ {1, 2}?

| test | *v* | *x* | *y* | *z* |
|-------|---|---|---|---|
| **1** | 1 | 1 | 2 | 2 |
| **2** | 1 | 2 | 1 | 1 |
| **3** | 2 | 1 | 1 | 2 |
| **4** | 2 | 2 | 2 | 1 |
| **5** | 2 | 1 | 2 | 1 |

**A) *v* = 2,  *x* = 2, *y* = 2, *z* = 2**\
B) *v* = 1,  *x* = 1, *y* = 2, *z* = 1\
C) *v* = 1,  *x* = 1, *y* = 1, *z* = 2\
D) *v* = 2,  *x* = 2, *y* = 1, *z* = 1\
E) *v* = 1,  *x* = 2, *y* = 1, *z* = 1

### 14. Wskaż WSZYSTKIE poprawne podziały dziedziny {a, b, c, d} na klasy równoważności, zakładając, że każdy z nich jest związany z sensowną hipotezą błędu.
A) {a, b}, {b, d}, {c, d}, {a, c}\
**B) {a}, {b}, {c}, {d}**\
**C) {a, b, c, d}**\
**D) {a, b}, {c, d}**\
E) nie można dokonać podziału, ponieważ elementów dziedziny nie da się odnieść na skali porządkowej

#### Uzasadnienie:

Podział A) {a, b}, {b, d}, {c, d}, {a, c} nie jest poprawny, ponieważ zawiera powtarzające się elementy w różnych klasach równoważności.

### 15. Wzkaż dwa cele debugowania
A) znajdowanie awarii\
B) sprawdzenie czy usterka została poprawnie usunięta\
**C) lokalizacja miejsca usterki powodującej awarię**\
**D) naprawa usterki**\
E) wykonanie testów regresji

#### Uzasadnienie

Opcje A), B) i E) nie są bezpośrednio związane z procesem debugowania. Znajdowanie awarii i sprawdzenie, czy usterka została poprawnie usunięta, są częścią procesu testowania, a wykonanie testów regresji jest częścią procesu zarządzania jakością oprogramowania.

### 16. Wskaż wszystkie zbiory testów spełniające kryterium pokrycia 1-switch dla poniższej maszyny stanowej (każdy test reprezentowant jest sekwencją kolejnych stanów)

![Maszyna stanów](pytanie16.png)

A) (1, 2, 3, 4, 3, 4, 2, 3, 4, 5)\
B) (1, 2, 3, 4, 2, 3, 4, 3, 4, 5)\
C) (1, 2, 3, 4, 5), (1, 2, 3, 4, 2, 3, 4, 5)\
D) (1, 2, 3, 4, 2, 3, 4, 5)\
E) (1, 2, 3, 4, 3, 4, 3, 4, 5)\

### 17. Jaka jest minimalna liczba przypadków testowych spełniająca pokrycie instrukcyjne poniższego kodu:

    input x, y
    while (x > 0) do
        if (y > 0) then
            x := x - 1
        else
            x := x - 2
        end if
    end while

A) 1\
**B) 2**\
C) 3\
D) 4\
E) nie da się osiągnąć pokrycia instrukcyjnego

#### Uzasadnienie:

Pokrycie instrukcyjne, znane również jako pokrycie kodu, wymaga wykonania każdej instrukcji w programie przynajmniej raz. W przypadku podanego kodu, mamy dwie główne ścieżki do rozważenia w zależności od wartości `y`. 

Minimalna liczba przypadków testowych spełniająca pokrycie instrukcyjne to **2**:

1. Pierwszy przypadek testowy: `x > 0` i `y > 0`. W tym przypadku, obie instrukcje `x := x - 1` i pętla `while` będą wykonane.
2. Drugi przypadek testowy: `x > 0` i `y <= 0`. W tym przypadku, instrukcja `x := x - 2` i pętla `while` będą wykonane.

### 18. Dany jest predykat (A AND B) OR C, gdzie A, B, C są warunkami, oraz zestaw trzech testów:
- A=TRUE, B=TRUE, C=FALSE
- A=TRUE, B=FALSE, C=FALSE
- A=FALSE, B=TRUE, C=FALSE

#### Wskaż poprawną odpowiedź.
A) testy te spełniają pokrycie warunków, ale nie pokrycie decyzji\
B) testy te spełniają zarówno pokrycie warunków, jak i decyzji\
C) testy te nie spełniają ani pokrycia warunków, ani decyzji\
**D) testy te spełniają pokrycie decyzji, ale nie pokrycie warunków**

#### Uzasadnienie:

Pokrycie decyzji jest spełnione, ponieważ każda możliwa wartość predykatu (A AND B) OR C jest reprezentowana w zestawie testów. Mamy zarówno TRUE (w pierwszym teście), jak i FALSE (w drugim i trzecim teście).

Jednakże, pokrycie warunków nie jest spełnione, ponieważ nie wszystkie warunki A, B i C przyjmują zarówno wartość TRUE, jak i FALSE w zestawie testów. Na przykład, warunek C zawsze jest FALSE.

### 19. Jaka jest minimalna liczba testów spełniająca pokrycie ścieżek dla grafu przepływu sterowania na rysunku, zakładając, że decyzje 1 i 4 są niezależne?

![Graf przepływu](pytanie19.png)

A) 1\
B) 2\
C) 3\
**D) 4**\
E) 5

### 20. Ile jest ścieżek liniowo niezależnych w grafie przepływu sterowania z poprzedniego pytania?
A) 1\
B) 2\
**C) 3**\
D) 4\
E) 5

#### Uzasadnienie:

Złożoność cyklomatyczna = liczba punktów decyzyjnych + 1

### 21. Dana jest decyzja (A OR B) AND C, gdzie A, B, C są niezależnymi od siebie warunkami, oraz poniższy zestaw testów. Który test należy do nich dodać, aby spełnić kryterium MC/DC? Załóż, że przy obliczaniu wartości decyzji nie zachodzi zwarcie (short-circuiting).

- A=FALSE, B=FALSE, C=TRUE
- A=TRUE, B=FALSE, C=TRUE
- A=FALSE, B=TRUE, C=FALSE

**A) A=FALSE, B=TRUE, C=TRUE**\
B) A=TRUE, B=TRUE, C=FALSE\
C) A=FALSE, B=FALSE, C=FALSE\
D) nie trzeba dodawać żadnego testu, MC/DC jest już spełnione

#### Uzasadnienie:

Kryterium MC/DC (Modified Condition/Decision Coverage) wymaga, aby każdy warunek w decyzji był niezależnie zdolny do zmiany wyniku decyzji. W tym przypadku, mamy już testy, które pokazują, jak A i B mogą zmienić wynik decyzji (A OR B). Jednakże, nie mamy jeszcze testu, który pokazuje, jak C może zmienić wynik decyzji (A OR B) AND C.

Dodanie testu A=FALSE, B=TRUE, C=TRUE spełnia to wymaganie. W tym teście, mimo że (A OR B) jest prawdziwe, to cała decyzja jest prawdziwa, ponieważ C jest prawdziwe. To pokazuje, że C jest zdolne do zmiany wyniku decyzji.

### 22. Użycie kart testowych i sesji jest charakterystyczna dla:
A) testowania opartego na liście kontrolnej\
**B) testowania eksploracyjnego**\
C) ataków usterkowych\
D) inspekcji formalnej

### 23. Wksaż najbardziej niebezpieczną sekwencję przepływu danych, mogącą świadczyć o ryzyku wystąpienia problemu.
**A) d, k, u, u, k**\
B) d, d, d, k\
C) d, u, d, u, k\
D) d, u, u, d

*d - declare, u - update, k - kill*

### 24. Wynikiem profilowania kodu jest:
**A) profil płaski**\
B) profil operacyjny\
C) profil wywołań\
D) profil przepływu danych

### 25. Jeśli MTBF = 4h, a MTTR = 2.5hm to ile wynosi MTTF?
A) 6.5h\
B) -1.5h\
C) -6.5h\
**D) 1.5h**\
E) 4h

#### Uzasadnienie:

MTBF (Mean Time Between Failures), MTTR (Mean Time To Repair) i MTTF (Mean Time To Failure) to trzy kluczowe wskaźniki używane do mierzenia niezawodności systemu. Są one zdefiniowane następująco:

- MTBF to średni czas między awariami.
- MTTR to średni czas potrzebny na naprawę awarii.
- MTTF to średni czas do wystąpienia awarii.

Zależność między tymi wskaźnikami jest następująca:

$$MTBF = MTTF + MTTR$$

Więc, jeśli MTBF = 4h i MTTR = 2.5h, możemy obliczyć MTTF jako:

$$MTTF = MTBF - MTTR = 4h - 2.5h = 1.5h$$

Więc odpowiedzią jest **D) 1.5h**.

### 26. Podcharakterystyką użyteczności NIE jest:
A) zrozumiałość\
B) atrakcyjność\
C) łatwość nauki\
**D) dojrzałość**

#### Uzasadnienie:

Dojrzałość jest podcharakterystyką **niezawodności**, a nie użyteczności, w modelu jakości oprogramowania. Podcharakterystyki użyteczności to **zrozumiałość**, **łatwość nauki**, **łatwość obsługi**, **atrakcyjność** i **dostępność dla osób niepełnosprawnych**.

Podcharakterystyki niezawodności to **dojrzałość**, **odporność na błędy**, **odzyskiwalność**, **tolerancja na błędy**.

### 27. W systemie zidentyfikowano jedynie dwa ryzyka, oba o poziomie równym $1000 i prawdopodobieństwie wystąpienia równym 0.25. Jaki jest całkowity poziom ryzyka w systemie?
A) $250\
**B) $500**\
C) $1000\
D) $2000\
E) $4000\
F) $8000

#### Uzasadnienie:

Całkowity poziom ryzyka w systemie można obliczyć, mnożąc poziom ryzyka każdego identyfikowanego ryzyka przez jego prawdopodobieństwo wystąpienia, a następnie sumując te wartości. W tym przypadku mamy:

$$\text{Całkowity poziom ryzyka} = 2 \times (1000 \times 0.25) = 2 \times 250 = 500$$

### 28. Przykład kosztu wewnętrzenego błędu w modelu CoQ to:
A) koszt związany z przeprowadzeniem przeglądu kodu\
B) koszt związany z przeprowadzeniem szkolenia dla testerów\
C) koszt związany z usunięciem awarii zgłoszonej przez użytkownika\
D) koszt związany z implementacją i wykonaniem testów\
**E) koszt związany z usunięciem defektu wykrytego przez inspekcję**

#### Uzasadnienie:

Model CoQ (Cost of Quality) dzieli koszty jakości na koszty wewnętrzne i zewnętrzne. Koszty wewnętrzne to koszty związane z identyfikacją i naprawą błędów przed dostarczeniem produktu klientowi. Usunięcie defektu wykrytego przez inspekcję jest przykładem kosztu wewnętrznego, ponieważ jest to błąd znaleziony i naprawiony przed dostarczeniem produktu. Pozostałe opcje są związane z kosztami prewencji (A, B, D) lub kosztami zewnętrznymi (C).

### 29. Metryka MTBF może służyć jako miara postępu procesu testowego w wymiarze:
A) wymagań\
**B) defektów**\
C) pokrycia\
D) testów\
E) pewności

#### Uzasadnienie:

MTBF (Mean Time Between Failures) to średni czas między awariami. Jest to metryka używana głównie w kontekście niezawodności systemów i produktów, ale może być również używana jako miara postępu w procesie testowania. W kontekście testowania, MTBF może służyć jako wskaźnik częstotliwości występowania defektów. Im wyższy MTBF, tym rzadziej występują defekty, co może wskazywać na postęp w procesie testowania.

### 30. Zbiór testów T osiąga 100% pokrycia instrukcji oraz 100% pokrycja decyzji pewnego kodu. W pewnym miejscu tego kodu wpisano poprawną instrukcję: ```if (x>0) then y:=1```. Co można powiedzieć o pokryciu tak zmodyfikowanego kodu zbiorem testów T?
A) zbiór T może nadal osiągać 100% pokrycia instrukcji i decyzji\
B) pokrycie decyzji przez T będzie mniejsze niż pokrycie instrukcji\
C) pokrycie instrukcji przez T będzie mniejsze niż pokrycie decyzji\
D) aby T nadal spełniał 100% decyzji należy dodać do T co najmniej jeden test

### 31. Podcharakterystyką funkcjonalności jest:
A) dojrzałość\
B) stabilność\
**C) dokładność**\
D) instalowalność

#### Uzasadnienie:

Dokładność jest podcharakterystyką funkcjonalności w modelu jakości oprogramowania ISO 9126. Odnosi się do zdolności oprogramowania do dostarczania prawidłowych lub zgodnych wyników lub efektów. Dojrzałość i stabilność są podcharakterystykami niezawodności, a instalowalność jest podcharakterystyką użyteczności.

### 32. Wzorst dojrzałości oprogramowania oznacza wzrost miary
**A) MTTF**\
B) MTTR\
C) KLOG\
D) PP

#### Uzasadnienie:

MTTF (Mean Time To Failure) to średni czas do awarii. Wzrost MTTF oznacza, że oprogramowanie jest bardziej niezawodne, ponieważ średni czas między awariami jest dłuższy. To jest często postrzegane jako oznaka dojrzałości oprogramowania, ponieważ dojrzałe oprogramowanie zwykle ma mniej błędów i jest bardziej niezawodne. MTTR to średni czas do naprawy, KLOG to miara rozmiaru kodu, a PP to punkty pracy, które są miarą wysiłku potrzebnego do wykonania projektu.

### 33. Wksaż DWA przykłady kwestionariuszy pomocnych w testowaniu użyteczności
A) OWASP\
**B) SUMMI**\
C) DO-1738\
**D) WAMMI**

#### Uzasadnienie:

- **SUMI (Software Usability Measurement Inventory)** to standardowy kwestionariusz użyteczności, który pomaga mierzyć postrzeganą użyteczność oprogramowania przez użytkowników.

- **WAMMI (Website Analysis and Measurement Inventory)** to narzędzie do oceny użyteczności stron internetowych. Jest to kwestionariusz, który użytkownicy wypełniają, aby ocenić swoje doświadczenia z korzystania z konkretnej strony internetowej. 

OWASP to ramy bezpieczeństwa aplikacji internetowych, a DO-178C to standard dotyczący bezpieczeństwa oprogramowania w lotnictwie, które nie są bezpośrednio związane z testowaniem użyteczności.

### 34. Która z poniższych sytuacji spowoduje wystąpienie efektu próbnika?
A) testowanie oprogramowania przez jego twórcę (dewelopera)\
B) testowanie wydajności na przeskalowanym systemie testowym, mniejszym niż system docelowy\
**C) instrumentacja kodu w celu pomiaru czasu działania jego funkcji**\
D) wykorzystanie testowanego systemu jako wyroczni

#### Uzasadnienie:

Efekt próbnika (ang. probe effect) występuje, gdy proces pomiaru wpływa na to, co jest mierzone. W kontekście testowania oprogramowania, instrumentacja kodu w celu pomiaru czasu działania jego funkcji może wpłynąć na rzeczywisty czas działania funkcji, co prowadzi do efektu próbnika.

### 35. Celem projektu pilotażowego NIE jest:
**A) wybór narzędzia**\
B) szczegółowe zaznajomienie się z narzędziem\
C) ustalenie standardów użycia narzędzia\
D) ocena korzyści z używania narzędzia

#### Uzasadnienie:

Projekt pilotażowy jest zazwyczaj realizowany po wyborze narzędzia. Jego celem jest zaznajomienie się z narzędziem, ustalenie standardów jego użycia i ocena korzyści z jego używania. Wybór narzędzia zazwyczaj odbywa się przed projektem pilotażowym.

### 36. Modelem doskonalenia procesu testowego NIE jest
A) TPI\
**B) CTP**\
C) TMM\
D) CMMI

#### Uzasadnienie:

TPI (Test Process Improvement), TMM (Test Maturity Model) i CMMI (Capability Maturity Model Integration) to znane modele doskonalenia procesu testowego. CTP nie jest znanym modelem w kontekście doskonalenia procesu testowego. Może to być skrót od innej koncepcji lub terminu, ale nie jest to model doskonalenia procesu testowego.

### 37. Poniższa tabela pokazuje liczbę defektów wprowadzonych i usuniętych w poszczególnych fazach.

| Faza wprowadzenia | wymagania | kodowanie | testy/utrzymanie |
|-------------------|-----------|-----------|------------------|
| wymagania         | 30        | 20        | 35               |
| kodowanie         |           | 20        | 5                |
| testy/utrzymanie  |           |           | 5                |

#### Powstrzymanie fazowe fazy kodowania wynosi:
A) 20%\
B) 25%\
C) 40%\
D) 50%\
E) 66%\
F) 80%

### 38. Jeśli test zabiły 80% mutantów, a dotychczas znaleziono i usunięto z kody 100 rzeczywistych defektów w kodzie, to - zakładając identyczną efektywność testów w znajdowaniu rzeczywistych defektów, szacunkowa liczba defektów wciąż pozostających w kodzie wynosi:
A) 20\
**B) 25**\
C) 80\
D) 100\
E) 120\
F) 125

### 39. Model sekwencyjny cyklu życia, zakładający wykonywanie czynności testowych już na etapie wstępnych faz wytwórzczy to:
**A) model V**\
B) Scrum\
C) model spiralny\
D) model kaskadowy

### 40. Jeśli założymy, że kod implementujący test nie zawiera logiki (rozgałęzień), to jego złożoność cyklomatyczna wyniesie:
A) 0\
**B) 1**\
C) 2\
D) nie da się odpowiedzieć jednoznacznie