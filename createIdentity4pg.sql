CREATE TABLE AspNetUsers(
	Id int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	UserName text NULL,
	PasswordHash text NULL,
	SecurityStamp text NULL,
	Discriminator varchar(128) NOT NULL
);
CREATE UNIQUE INDEX Id_index ON AspNetUsers (Id);
CLUSTER AspNetUsers USING Id_index;


CREATE TABLE AspNetRoles(
	Id int NOT NULL PRIMARY KEY,
	Name text NOT NULL
);
CREATE UNIQUE INDEX AspNetRolesId_index ON AspNetRoles (Id);
CLUSTER AspNetRoles USING AspNetRolesId_index;

CREATE TABLE AspNetUserClaims(
	Id int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	ClaimType int NULL,
	ClaimValue text NULL,
	User_Id int NOT NULL REFERENCES AspNetUsers(Id) ON DELETE CASCADE --CHECK Id = User_Id
	--FOREIGN KEY (User_Id) REFERENCES AspNetUsers (Id)
);
CREATE UNIQUE INDEX AspNetUserClaims_Id_index ON AspNetUserClaims (Id);
CLUSTER AspNetUserClaims USING AspNetUserClaims_Id_index;

CREATE TABLE AspNetUserLogins(
	UserId int NOT NULL PRIMARY KEY REFERENCES AspNetUsers(Id) ON DELETE CASCADE, --CHECK Id = User_Id,
	LoginProvider varchar(128) NOT NULL,
	ProviderKey varchar(128) NOT NULL
	--FOREIGN KEY (User_Id) REFERENCES AspNetUsers (Id)
);
CREATE UNIQUE INDEX AspNetUserLogins_UserId_index ON AspNetUserLogins (UserId);
CLUSTER AspNetUserLogins USING AspNetUserLogins_UserId_index;

CREATE TABLE AspNetUserRoles(
	UserId int NOT NULL PRIMARY KEY REFERENCES AspNetUsers(Id) ON DELETE CASCADE,
	RoleId int NOT NULL REFERENCES AspNetRoles(Id) ON DELETE CASCADE
	--FOREIGN KEY (User_Id) REFERENCES AspNetUsers (Id),
	--FOREIGN KEY (RoleId) REFERENCES AspNetRoles (Id)
);
CREATE UNIQUE INDEX AspNetUserRoles_UserId_index ON AspNetUserRoles (UserId);
CLUSTER AspNetUserRoles USING AspNetUserRoles_UserId_index;
