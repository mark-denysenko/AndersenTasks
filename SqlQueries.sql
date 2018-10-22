
-- 1 Получить все неоконченные и неотменённые заказы пользователя.

SELECT *
FROM Orders
LEFT JOIN States ON Orders.StateId = States.StateId
WHERE States.[Name] NOT IN ('Canceled', 'Completed')

-- 2 Получить количество всех заказов в системе, сгруппированное по статусам.

SELECT States.[Name], COUNT(*) AS 'Total orders'
FROM Orders 
LEFT JOIN States ON Orders.StateId = States.StateId
GROUP BY States.[Name]

-- 3 Получить сумму всех заказов за нынешний и прошлый месяц. 
--   В процессе выполнения этой задачи, разработайте  вложенную процедуру,
--   которая возвращает сумму заказов за определённый период времени (период описывается 
--   двумя датами - датой начала и конца периода).
GO

CREATE PROC SumForTime
		@beginDate DATETIME,
		@endDate DATETIME = NULL
AS
BEGIN
	IF @endDate IS NULL
		SET @endDate = GETDATE()

	SELECT SUM(OrderDetails.Quantity * Products.UnitPrice) AS 'Total sum'
	FROM Orders
	RIGHT JOIN OrderDetails ON OrderDetails.OrderId = Orders.OrderId
	LEFT JOIN Products ON OrderDetails.ProductId = Products.ProductId
	WHERE Orders.OrderDate BETWEEN @beginDate AND @endDate
END

DROP PROC SumForTime

GO
CREATE PROC GetSumFromPreviousMonth
AS
DECLARE @beginTime DATETIME
DECLARE @endTime DATETIME
SET @beginTime = DATEADD(month, DATEDIFF(month, 0, GETDATE()) - 1, 0)
SET @endTime = GETDATE()
DECLARE @result FLOAT
EXEC @result = SumForTime @beginTime, @endTime

GO
DROP PROC GetSumFromPreviousMonth
---------------------------------
GO
EXEC GetSumFromPreviousMonth	--- Procedure
---------------------------------
-- Test
SELECT Orders.OrderId, Products.ProductName, Quantity, Products.UnitPrice, OrderDate
FROM Orders
LEFT JOIN OrderDetails ON OrderDetails.OrderId = Orders.OrderId
LEFT JOIN Products ON OrderDetails.ProductId = Products.ProductId
WHERE Orders.OrderDate BETWEEN DATEADD(month, DATEDIFF(month, 0, GETDATE()) - 1, 0) 
								AND GETDATE()

-- 4 Получить топ-10 продуктов выбранной категории (по пользовательскому рейтингу).

SELECT TOP(10) Products.ProductName, 
			   AVG(CAST(Marks.Mark AS FLOAT)) AS 'Average mark', 
			   COUNT(*) AS 'Total marks'
FROM Products
INNER JOIN Marks ON Marks.ProductId = Products.ProductId
GROUP BY Products.ProductName, Products.ProductId
ORDER BY 'Average mark' DESC

-- 5 Получить все самые дорогие товары в магазине без использования функций MAX и MIN. 
--   Количество товаров может быть произвольным.

SELECT *
FROM Products
WHERE Products.UnitPrice >= ALL ( SELECT Products.UnitPrice FROM Products)

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT TOP(1) UnitPrice
					FROM Products
					ORDER BY UnitPrice DESC)