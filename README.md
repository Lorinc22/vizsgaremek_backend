## GorillaGo Vizsgaremek Dokumentáció

### Backend készítette: Fekete Dániel Zsolt – Krity Lőrinc

### Get:

- `findUserById(id)`: Ez a kérés lekérdezi egy `id` paraméter alapján egy felhasználó adatait
- `findUserByEmail`: Ez a kérés lekérdezi egy `email` paraméter alapján egy felhasználó adatait
- `FindAllRestaurants`: Visszaadja az összes éttermet és hozzájuk tartozó adatokat
- `findOneByRestaurant(id)`: `id` paraméter alapján adja vissza egy étterem adatait
- `getMenusByRestaurants`: Lekérdezi az éttermek kínálatát az adatbázisból
- `searchRestaurants(searchTerm)`: Keresési paraméter alapján adja vissza az éttermeket és adatait

### Post:

- `register`: Az `register` függvény egy új felhasználó regisztrációját kezeli egy HTTP POST kérésben. Az új felhasználó adatokat tartalmaz egy `RegisterDto` objektumban. A függvény ellenőrzi az adatok érvényességét, majd létrehoz egy új felhasználót az adatbázisban, ha az adatok rendben vannak. Végül a függvény visszatéríti az újonnan létrehozott felhasználó adatait.

- `login`: Az `login` függvény egy HTTP POST kérésben fogadja a felhasználó bejelentkezési adatokat egy `LoginDto` objektumban. A függvény ellenőrzi, hogy a felhasználói adatok érvényesek-e, és ha igen, létrehoz egy JSON Web Token-t a felhasználó adataival, majd egy HTTP cookie-ba helyezi azt. Végül a függvény visszaadja a JWT-t és a felhasználó azonosítóját.

- `submitOrder`: Az `submitOrder` függvény egy HTTP POST kérésben fogadja a rendelési adatokat egy `OrderDto` objektumban. A függvény létrehoz egy `Order` objektumot az adatokkal, majd elmenti azt az adatbázisban. Ha az adatbázisba mentés sikertelen, akkor a függvény egy hibát ad vissza.

### Put:

- `updateAccountInfo`: Az `updateAccountInfo` függvény egy HTTP PUT kérésben fogadja egy felhasználó azonosítóját és egy `UpdateUserDto` objektumot, amely az új felhasználói adatokat tartalmazza. A függvény

- `updateUserPassword`: egy @Put HTTP kérésre válaszol, melynek a users/password/:id elérési útvonal van megadva. Az API a felhasználó jelszavának módosítását teszi lehetővé. Az új jelszó érvényesítése után a felhasználó jelszava frissül a megadott új jelszóra.

![image](https://user-images.githubusercontent.com/112952381/235366172-93326f54-bc72-47f1-8164-f47dd708926d.png)



