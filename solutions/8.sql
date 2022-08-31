WITH band_insert AS (
    INSERT INTO bands (name)
    VALUES ('Favorite Band Name')
    RETURNING id
)
INSERT INTO albums (name, release_year, band_id)
VALUES ('Favorite Album Name', 2000, (SELECT id FROM band_insert));