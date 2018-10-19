GO

INSERT INTO [dbo].[Categories]
           ([CategoryId]
           ,[CategoryName]
           ,[ParentId])
     VALUES
(1,	'Home',	0),
(2, 'Technics',	0),
(3,	'Garden',	0),
(4,	'Programs',	0),
(5,	'Food',	0),
(6,	'Clothes',	0),
(8,	'Beds',	1),
(9,	'Tables',	1),
(10,	'Cupboards',	1),
(11,	'Bathroom',	1),
(12,	'Baths',	11),
(13,	'Washbasins',	11),
(14,	'Computers',	2),
(15,	'Refrigerators',	2),
(16,	'Microwaves',	2),
(17,	'Gaming',	14),
(18,	'Office',	14),
(19,	'Verandas',	3),
(20,	'Benches',	3),
(21,	'Water Systems',	3),
(22,	'Antiviruses',	4),
(23,	'Games',	4),
(24,	'Vegetables',	5),
(25,	'Meat',	5),
(26,	'Drinks',	5),
(27,	'Pig',	25),
(28,	'Cow',	25),
(29,	'Outerwear',	6),
(30,	'Indoorwear',	6)
GO