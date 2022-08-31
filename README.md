## Docker

This repo changes from using the internal file system of the container to using a managed volume, allowing the database data to persist even if a container is removed/recreated. See [Docker Volumes](https://docs.docker.com/storage/volumes/).

## Prerequisites

-   Create an `.env` file and add the following environment variables:

```sh
POSTGRES_USER=local_admin
POSTGRES_PASSWORD=unsafeLocalPassword0!
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=main
```

-   Spin up the PostgreSQL container with docker compose, then run the statements inside [schema.sql](schema.sql).

## Exercises

### 1. Create a Songs Table

[Solution](solutions/1.sql)

This table should be called `songs` and have four properties with these exact names.

1. `id`: An integer that is the primary key, and auto increments.
2. `name`: A string that cannot be null.
3. `length`: A float that represents the length of the song in minutes that cannot be null.
4. `album_id`: An integer that is a foreign key referencing the albums table that cannot be null.

After successfully creating the table, run the statements inside [data.sql](data.sql) to populate all of the data for the rest of the exercises. If you do not encounter any errors, then your solution for creating the table is most likely correct.

### 2. Select only the Names of all the Bands

[Solution](solutions/2.sql)

Change the name of the column the data returns to `bandName`

| bandName          |
| ----------------- |
| Seventh Wonder    |
| Metallica         |
| The Ocean         |
| Within Temptation |
| Death             |
| Van Canto         |
| Dream Theater     |

### 3. Select the Oldest Album

[Solution](solutions/3.sql)

Make sure to only return one result from this query, and that you are not returning any albums that do not have a release year.

| id  | name                   | release_year | band_id |
| --- | ---------------------- | ------------ | ------- |
| 5   | ...And Justice for All | 1988         | 2       |

### 4. Get all Bands that have Albums

[Solution](solutions/4.sql)

There are multiple different ways to solve this problem, but they will all involve a join.

Return the band name as bandName.

| bandName          |
| ----------------- |
| Seventh Wonder    |
| Metallica         |
| The Ocean         |
| Within Temptation |
| Death             |
| Van Canto         |

### 5. Get all Bands that have No Albums

[Solution](solutions/5.sql)

This is very similar to #4 but will require more than just a join.

Return the band name as bandName.

| bandName      |
| ------------- |
| Dream Theater |

### 6. Get the Longest Album

[Solution](solutions/6.sql)

This problem sounds a lot like #3 but the solution is quite a bit different. Try looking up the SUM aggregate function.

Return the album name as name, the album release year as releaseYear, and the album length as duration.

| Name           | releaseYear | duration          |
| -------------- | ----------- | ----------------- |
| Death Magnetic | 2008        | 74.76666593551636 |

### 7. Update the Release Year of the Album with no Release Year

[Solution](solutions/7.sql)

Set the release year to 1986.

You may run into an error if you try to update the release year by using `release_year IS NULL` in the WHERE statement of your UPDATE. This is a good thing since you almost never want to update rows without using the primary key, so to get around this error make sure to use the primary key of the row you want to update in the WHERE of the UPDATE statement.

### 8. Insert a record for your favorite Band and one of their Albums

[Solution](solutions/8.sql)

If you performed this correctly you should be able to now see that band and album in your tables.

### 9. Delete the Band and Album you added in #8

[Solution](solutions/9.sql)

The order of how you delete the records is important since album has a foreign key to band.

### 10. Get the Average Length of all Songs

[Solution](solutions/10.sql)

Return the average length as averageSongDuration.

| averageSongDuration |
| ------------------- |
| 5.352472513259112   |

### 11. Select the longest Song off each Album

[Solution](solutions/11.sql)

Try looking up the MAX aggregate function.

Return the album name as album, the album release year as releaseYear, and the longest song length as duration.

| album                       | releaseYear | duration |
| --------------------------- | ----------- | -------- |
| Tiara                       | 2018        | 9.5      |
| The Great Escape            | 2010        | 30.2333  |
| Mercy Falls                 | 2008        | 9.48333  |
| Master of Puppets           | 1986        | 8.58333  |
| ...And Justice for All      | 1988        | 9.81667  |
| Death Magnetic              | 2008        | 9.96667  |
| Heliocentric                | 2010        | 7.48333  |
| Pelagial                    | 2013        | 9.28333  |
| Anthropocentric             | 2010        | 9.4      |
| Resist                      | 2018        | 5.85     |
| The Unforgiving             | 2011        | 5.66667  |
| Enter                       | 1997        | 7.25     |
| The Sound of Perseverance   | 1998        | 8.43333  |
| Individual Thought Patterns | 1993        | 4.81667  |
| Human                       | 1991        | 4.65     |
| A Storm to Come             | 2006        | 5.21667  |
| Break the Silence           | 2011        | 6.15     |
| Tribe of Force              | 2010        | 8.38333  |

### 12. Get the number of Songs for each Band

[Solution](solutions/12.sql)

This is one of the toughest question on the list. It will require you to chain together two joins instead of just one.

Return the band name as band, the number of songs as numberOfSongs.

| band              | numberOfSongs |
| ----------------- | ------------- |
| Seventh Wonder    | 35            |
| Metallica         | 27            |
| The Ocean         | 31            |
| Within Temptation | 30            |
| Death             | 27            |
| Van Canto         | 32            |
