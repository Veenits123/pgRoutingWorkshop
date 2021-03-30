SELECT *
FROM pgr_dijkstraCost(
    '
      SELECT gid AS id,
       source,
       target,
       length_m  / 1.3 / 60 AS cost
      FROM ways
    ',
    ARRAY[279,13734],
    ARRAY[2340, 1442],
    directed := false);
