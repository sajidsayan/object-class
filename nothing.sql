-- Use the SQL comourantmands you just learned and find the best dinner
-- spots in the city 
-- and answer the following questions:
-- 1)What are the distinct neighborhood 
-- 2)What are the distinct cuisine types? 
-- 3)Suppose we would like some Chinese takeout. What are our options? 
-- 4)Return all the restaurants with reviews of 4 and above. 
-- 5)Suppose Abbi and Ilana want to have dinner. Return all the restaurants that are Italian and $$$. 
-- 6)If you want to find Italian restaurants with exactly three dollar signs: 
-- 7)Your coworker Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘Candy’ in it. Can you find it for him using a query? 
-- 8)Let’s order delivery to the house! Find all the close-by spots in Midtown, Downtown or Chinatown 
-- 9)Find all the health grade pending restaurants (empty values). 
-- 10)Create a Top 4 Restaurants Ranking based on reviews

CREATE TABLE Restaurants(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    neighborhood VARCHAR(50),
    cuisine,
    price,
    review_rating,
    health_grade,
    takeout_available
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    rating,
    review_text,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(id)
);

-- Insert sample data
INSERT INTO Restaurants (id, name, neighborhood, cuisine, price, review_rating, health_grade, takeout_available) VALUES
(1, 'Golden Dragon', 'Chinatown', 'Chinese', '$$', 4.2, 'A', TRUE),
(2, 'Mario''s Trattoria', 'Downtown', 'Italian', '$$$', 4.5, 'A', TRUE),
(3, 'La Bella Roma', 'Midtown', 'Italian', '$$$', 4.8, 'A', FALSE),
(4, 'Candy Bar Cafe', 'Westside', 'American', '$$', 4.1, 'B', TRUE),
(5, 'Spice Garden', 'Downtown', 'Indian', '$$', 4.3, 'A', TRUE),
(6, 'Tokyo Sushi', 'Midtown', 'Japanese', '$$$', 4.6, 'A', TRUE),
(7, 'Little Havana', 'Downtown', 'Cuban', '$$', 4.0, 'A', TRUE),
(8, 'Parisian Bistro', 'Uptown', 'French', '$$$$', 4.7, 'A', FALSE),
(9, 'Candy Wok', 'Chinatown', 'Chinese', '$', 3.9, 'PENDING', TRUE),
(10, 'Roma Pizza', 'Downtown', 'Italian', '$$', 4.4, 'A', TRUE),
(11, 'Dragon Palace', 'Chinatown', 'Chinese', '$$$', 4.2, 'A', TRUE),
(12, 'Il Forno', 'Midtown', 'Italian', '$$$', 4.9, 'A', FALSE),
(13, 'Sweet Candy Diner', 'Eastside', 'American', '$', 3.8, 'B', TRUE),
(14, 'Thai Orchid', 'Downtown', 'Thai', '$$', 4.1, 'A', TRUE),
(15, 'Pasta Paradise', 'Midtown', 'Italian', '$$$', 4.3, NULL, TRUE);

INSERT INTO Reviews (id, restaurant_id, rating, review_text) VALUES
(1, 1, 4.5, 'Amazing Chinese food! The dumplings were incredible.'),
(2, 1, 4.0, 'Good food but service was a bit slow.'),
(3, 2, 4.7, 'Authentic Italian cuisine, loved the pasta!'),
(4, 2, 4.3, 'Great atmosphere and delicious food.'),
(5, 3, 4.9, 'Best Italian restaurant in town! Worth every penny.'),
(6, 3, 4.6, 'Excellent service and amazing wine selection.'),
(7, 4, 4.2, 'Fun atmosphere with creative cocktails.'),
(8, 4, 3.9, 'Good burgers but a bit pricey for what you get.'),
(9, 5, 4.4, 'Spicy and flavorful Indian dishes.'),
(10, 5, 4.1, 'Great curry options, will definitely return.'),
(11, 6, 4.8, 'Fresh sushi and beautiful presentation.'),
(12, 6, 4.5, 'Best Japanese restaurant in the city.'),
(13, 7, 4.0, 'Authentic Cuban flavors, great mojitos.'),
(14, 8, 4.7, 'Elegant French dining experience.'),
(15, 9, 3.8, 'Dec Chinese food but health grade is pending.');

SELECT DISTINCT neighborhood FROM Restaurants;

SELECT DISTINCT cuisine FROM Restaurants;

SELECT name, neighborhood, price
FROM Restaurants
WHERE cuisine = 'Chinese' AND takeout_available = TRUE;

SELECT r.name, r.cuisine, r.review_rating
FROM Restaurants r
WHERE r.review_rating >= 4.0
ORDER BY r.review_rating DESC;


SELECT r.name, AVG(rev.rating) as avg_rating
FROM Restaurants r
JOIN Reviews rev ON r.id = rev.restaurant_id
GROUP BY r.id, r.name
HAVING AVG(rev.rating) >= 4.0
ORDER BY avg_rating DESC;


SELECT name, neighborhood, review_rating 
FROM Restaurants 
WHERE cuisine = 'Italian' AND price = '$$$';

SELECT name, neighborhood, review_rating 
FROM Restaurants
WHERE name LIKE '%Candy%';

SELECT name, neighborhood, cuisine, price, review_rating 
FROM Restaurants 
WHERE neighborhood IN ('Midtown', 'Downtown', 'Chinatown') 
ORDER BY neighborhood, review_rating DESC;

SELECT name, neighborhood, cuisine, health_grade 
FROM Restaurants 
WHERE health_grade IS NULL OR health_grade = 'PENDING' 
ORDER BY name;


SELECT name, neighborhood, cuisine, price, review_rating 
FROM Restaurants 
ORDER BY review_rating DESC 
LIMIT 4;
