create database QLdatabase;

create table Department (
    DepartmentID int primary key,
    Name varchar(255) not null,
    Functions text not null 
);
insert into Department (DepartmentID, Name, Functions) values 
(1, 'Development', 'Software Development'),
(2, 'Finance', 'Finance Management'),
(3, 'Marketing', 'Marketing Management');

create table Skill (
    SkillID int primary key,
    Name varchar(255),
    Description text
);
insert into Skill (SkillID, Name, Description) values
(1, 'Java', 'Programming language'),
(2, 'Finances', 'Accounting and Finance');

create table Role (
    RoleID int primary key,
    Title varchar(255),
    DepartmentID int,
    foreign key (DepartmentID) references Department(DepartmentID)
);
insert into Role (RoleID, Title, DepartmentID) values
(1, 'Software Developer', 1),
(2, 'Finance Manager', 2);

create table Employee (
    EmployeeID int primary key,
    Name varchar(255),
    RoleID int,
    TeamID int,
    DepartmentID int,
    foreign key (RoleID) references Role(RoleID),
    
    foreign key (DepartmentID) references Department(DepartmentID)
);
insert into Employee (EmployeeID, Name, RoleID, DepartmentID) values
(1, 'Furqan', 1, 1),
(2, 'Sameer', 2, 2);




create table Client (
    ClientID int primary key,
    Name varchar(255),
    ContactInfo varchar(15), -- Changed column name to ContactInfo and adjusted data type
    Industry varchar(255),
    NegotiationDate date
);
insert into Client (ClientID, Name, ContactInfo, Industry, NegotiationDate) values
(1, 'IBM Solutions', '0300-9989898', 'Technology', '2024-04-10'),
(2, 'Google Solutions', '0311-8887877', 'Solution Consultation', '2024-03-12');


create table Team (
    TeamID int primary key,
    Name varchar(255),
    SkillID int,
    TeamLeadID int,
    foreign key (SkillID) references Skill(SkillID),
    foreign key (TeamLeadID) references Employee(EmployeeID)
);
insert into Team (TeamID, Name, SkillID, TeamLeadID) values
(1, 'Development Team', 1, 1),
(2, 'Sales Team', 2, 2);

create table Project (
    ProjectID int primary key,
    Name varchar(255),
    Description text,
    ClientID int,
    AssignedBy int,
    TeamID int,
    Status varchar(20), -- Adjusted data type to a shorter length
    foreign key (ClientID) references Client(ClientID),
    foreign key (AssignedBy) references Employee(EmployeeID),
    foreign key (TeamID) references Team(TeamID)
);
insert into Project (ProjectID, Name, Description, ClientID, AssignedBy, TeamID, Status) values
(1, 'Project Databse', 'Developing new software', 1, 1, 1, 'In Progress'),
(2, 'Project Dev', 'Sales strategy implementation', 2, 2, 2, 'Completed');



create table Recruitment (
    RecruitmentID int primary key,
    Position varchar(255),
    Description text,
    OpenDate date,
    CloseDate date,
    Method varchar(100),
    DepartmentID int,
    foreign key (DepartmentID) references Department(DepartmentID)
);
insert into Recruitment (RecruitmentID, Position, Description, OpenDate, CloseDate, Method, DepartmentID) values
(1, 'Software Engineer', 'Developing software applications', '2023-06-01', '2023-07-01', 'Online', 1),
(2, 'Finance Manager', 'Manages Accounts and finances', '2023-08-01', '2023-09-01', 'Referral', 2);


create table SoftwareProduct (
    ProductID int primary key,
    Name varchar(255),
    Type varchar(50),
    ProjectID int,
    foreign key (ProjectID) references Project(ProjectID)
);
insert into SoftwareProduct (ProductID, Name, Type, ProjectID) values
(1, 'Software A', 'Product', 1),
(2, 'Service B', 'Service', 2);

create table LegalReview (
    LegalReviewID int primary key,
    ReviewDate date,
    Status varchar(20), -- Adjusted data type to a shorter length
    Notes text,
    ProductID int,
    foreign key (ProductID) references SoftwareProduct(ProductID)
);
insert into LegalReview (LegalReviewID, ReviewDate, Status, Notes, ProductID) values
(1, '2023-08-15', 'Approved', 'No issues found', 1),
(2, '2023-10-20', 'Pending', 'Under review', 2);


create table EmployeeSkill (
    EmployeeID int,
    SkillID int,
    primary key (EmployeeID, SkillID),
    foreign key (EmployeeID) references Employee(EmployeeID),
    foreign key (SkillID) references Skill(SkillID)
);
insert into EmployeeSkill (EmployeeID, SkillID) values
(1, 1),
(2, 2);
