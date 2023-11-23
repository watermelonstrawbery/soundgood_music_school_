CREATE TABLE "instrument" 
(
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "instrument_type" varchar(50),
 "brand" varchar(50),
 "available_quantity" int
);



CREATE TABLE "person" (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "name" varchar(50) NOT NULL,
 "person_number" varchar(50) UNIQUE NOT NULL,
 "zipcode" varchar(50) NOT NULL,
 "street_address" varchar(50) NOT NULL,
 "city" varchar(50) NOT NULL
);




CREATE TABLE "student" (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 "skill_level" varchar(50)
);




CREATE TABLE "student_sibling" (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "sibling_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 PRIMARY KEY("student_id", "sibling_id")
);



CREATE TABLE "telephone_number" (
 "telephone_number" varchar(50) NOT NULL,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 PRIMARY KEY("telephone_number", "person_id")
);




CREATE TABLE "contact_person" (
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 "name" varchar(50) NOT NULL,
 "relationship" varchar(50),
 "student_id" int NOT NULL  REFERENCES "student" ON DELETE CASCADE,
 PRIMARY KEY("person_id")
);




CREATE TABLE "desired_instrument_type" (
 "desired_instrument_type" varchar(50) NOT NULL,
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 PRIMARY KEY("desired_instrument_type", "student_id")
);




CREATE TABLE "e_mail" (
 "e_mail" varchar(50) NOT NULL,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 PRIMARY KEY("e_mail", "person_id")
);




CREATE TABLE "instructor" (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE
);




CREATE TABLE "instrument_type" (
 "instrument_type" varchar(10) NOT NULL,
 "instructor_id" int NOT NULL REFERENCES "instructor" ON DELETE CASCADE,
 PRIMARY KEY("instrument_type", "instructor_id")
);




CREATE TABLE "lesson" (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "room_id" varchar(50) UNIQUE NOT NULL,
 "skill_level"  varchar(50) NOT NULL,
 "min_number_of_spots"  int NOT NULL,
 "max_number_of_spots"  int NOT NULL,
 "instructor_name"  varchar(50) NOT NULL,
 "lesson_type"  varchar(50) NOT NULL,
 "date_of_taken_lesson" timestamp NOT NULL,
 "instrument_type" varchar(50),
 "genre" varchar(50),
 "instructor_id" int REFERENCES "instructor" ON DELETE CASCADE
);




CREATE TABLE "pricing_scheme" (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "discount" NUMERIC(12,5) NULL,
 "starting_date" timestamp NOT NULL,
 "lesson_id" int REFERENCES "lesson" ON DELETE CASCADE,
 "price" int NOT NULL
);




CREATE TABLE "rental" (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "loan_date"  varchar(50) NOT NULL,
 "return_date" varchar(50) NOT NULL,
 "instrument_id" int REFERENCES "instrument" ON DELETE CASCADE,
 "price" int,
 "student_id" int REFERENCES "student" ON DELETE CASCADE
);




CREATE TABLE "student_lesson" (
 "student_id" int REFERENCES "student" ON DELETE CASCADE,
 "lesson_id" int REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY("student_id", "lesson_id")
);




CREATE TABLE "appointment" (
 "appointment" timestamp NOT NULL,
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY("appointment", "lesson_id")
);




CREATE TABLE "available_time" (
 "available_time" timestamp NOT NULL,
 "instructor_id" int NOT NULL REFERENCES "instructor" ON DELETE CASCADE,
 PRIMARY KEY("available_time", "instructor_id")
);




CREATE TABLE "fixed_slot" (
 "fixed_slot" timestamp NOT NULL,
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY("fixed_slot", "lesson_id")
);




