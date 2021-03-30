ALTER TABLE configuration ADD COLUMN penalty FLOAT;
-- No penalty
UPDATE configuration SET penalty=1;


SELECT *
FROM pgr_dijkstra(
  '
    SELECT gid AS id,
        source,
        target,
        cost_s * penalty AS cost,
        reverse_cost_s * penalty AS reverse_cost
    FROM ways JOIN configuration
    USING (tag_id)
  ',
  16826,
  279);