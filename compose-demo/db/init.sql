-- Creating tables
CREATE TABLE Clients (
    ID SERIAL PRIMARY KEY,
    Full_Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL
);

CREATE TABLE Employees (
    ID SERIAL PRIMARY KEY,
    Full_Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL
);

CREATE TABLE Employees_and_Positions (
    ID SERIAL PRIMARY KEY,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Responsibilities TEXT NOT NULL,
    Requirements TEXT NOT NULL
);

CREATE TABLE HR_Department (
    Employee_ID INT REFERENCES Employees(ID),
    Position_ID INT REFERENCES Employees_and_Positions(ID),
    PRIMARY KEY (Employee_ID, Position_ID)
);

-- Filter for displaying employees of specific positions
-- Example query to display employees for a specific position
CREATE OR REPLACE VIEW Position_Filter AS
SELECT e.Full_Name, e.Age, e.Gender, ep.Position
FROM Employees e
JOIN HR_Department h ON e.ID = h.Employee_ID
JOIN Employees_and_Positions ep ON h.Position_ID = ep.ID
WHERE ep.Position = 'Manager';
