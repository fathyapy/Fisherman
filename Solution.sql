-- 1. Insert these data into TransactionDetail table:
INSERT INTO TRANSACTIONDETAIL(TRANSACTIONID, FISHID, QUANTITY) VALUES ('TR014', 'FI014', '27'),('TR014','FI010',	'2'),('TR015','FI005','26'), ('TR015','FI002','21')

-- 2. Insert these data into MsFish table: (insert, round, rand)
INSERT INTO MsFish(FishID,FishTypeID,FishName,FishPrice) VALUES ('FI017','FT003','Red Mackerel',	ROUND ((RAND()*(40-5)+5),1))

-- 3. Delete data on MsFish table for every fish which type ID is ‘FT003’ or ‘FT005’. (delete, in)
DELETE MsFish 
WHERE FishTypeID IN ('FT003','FT005')

--4. Delete data on MsCustomer table for every female customer that does not have an address. (delete, in)
DELETE MsCustomer
WHERE CustomerGender = 'FEMALE' AND CustomerAddress IS NULL

--5. Update MsFish table by subtracting FishPrice by 3 for every fish which price is between 10 and 12.(update, in)
UPDATE MsFish 
SET FishPrice -= 3
WHERE FishPrice BETWEEN 10 AND 12

-- 6. Update MsFish table by adding FishPrice by 2.5 for every fish which fish type ID is ‘FT001’ or ‘FT002’, and the price is above 35. (update, in)
UPDATE MsFish
SET FishPrice += 2.5
WHERE FishTypeID IN ('FT001', 'FT002') AND FishPrice > 35  

-- 7. Display all customer’s data from MsCustomer table for every customer that has an address. Then order the data based on the Customer’s DOB in ascending format. (is not null, order by)
SELECT *
FROM MsCustomer
WHERE CustomerAddress IS NOT NULL ORDER BY CustomerDOB

--8. Display FishermanName and Address (obtained by adding ‘Address: ’  in front of the fisherman’s address) for every male fisherman.
SELECT FishermanName, 'Address' = CONCAT('ADDRESS: ',FishermanAddress)
FROM MsFisherman
WHERE FishermanGender IN ('MALE')

--9. Display FishName and Price (obtained by adding ‘$’ in front of FishPrice) for every fish which price is below or equal to 10. 
SELECT FishName, 'Price' = CONCAT('$',FishPrice)
FROM MsFish
WHERE FishPrice <= 10

--10. Display FishName and DiscountPrice (obtained by rounding down FishPrice and adding '$' in front of the FishPrice) for every fish named ‘Red Grouper’. (convert, floor)
SELECT FishName, 'DiscountPrice' = CONCAT('$', CONVERT(INT,FLOOR(FishPrice)))
FROM MsFish
WHERE FishName IN ('Red Grouper')
