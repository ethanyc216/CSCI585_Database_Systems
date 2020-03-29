-- query 1 compute the convex hull
SELECT ST_AsText(
        ST_ConvexHull(
            ST_Collect(
                ST_GeomFromText('MULTIPOINT(-118.283860 34.020061, -118.282727 34.021670, -118.283905 34.021287, -118.286185 34.023943, -118.286628 34.018710, -118.289993 34.020043, -118.284422 34.018700, -118.283395 34.020149, -118.287075 34.022879, -118.283814 34.019091, -118.290667 34.020238, -118.283372 34.020426, -118.284928 34.018991, -118.283225 34.022209, -118.283941 34.022434)'))));
-- query 1 polygon output
POLYGON((-118.284422 34.0187,-118.286628 34.01871,-118.290667 34.020238,-118.286185 34.023943,-118.283225 34.022209,-118.282727 34.02167,-118.283814 34.019091,-118.284422 34.0187))


-- query 2 compute the four nearest neighbors
CREATE TABLE geometries (gid integer, geom geometry);
INSERT INTO geometries VALUES
    (0, 'POINT(-118.283860 34.020061)'),
    (1, 'POINT(-118.282727 34.021670)'),
    (2, 'POINT(-118.283905 34.021287)'),
    (3, 'POINT(-118.286185 34.023943)'),
    (4, 'POINT(-118.286628 34.018710)'),
    (5, 'POINT(-118.289993 34.020043)'),
    (6, 'POINT(-118.284422 34.018700)'),
    (7, 'POINT(-118.283395 34.020149)'),
    (8, 'POINT(-118.287075 34.022879)'),
    (9, 'POINT(-118.283814 34.019091)'),
    (10, 'POINT(-118.290667 34.020238)'),
    (11, 'POINT(-118.283372 34.020426)'),
    (12, 'POINT(-118.284928 34.018991)'),
    (13, 'POINT(-118.283225 34.022209)'),
    (14, 'POINT(-118.283941 34.022434)');
SELECT g2.gid
FROM geometries As g1, geometries As g2   
WHERE g1.gid = 13 and g1.gid <> g2.gid  
ORDER BY ST_Distance(g1.geom,g2.geom) 
LIMIT 4

-- query 2 polygon output
1
14
2
11
