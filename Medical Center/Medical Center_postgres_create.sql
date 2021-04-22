CREATE TABLE "doctors" (
	"id" serial NOT NULL,
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"specialty" TEXT NOT NULL,
	CONSTRAINT "doctors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "patients" (
	"id" serial NOT NULL,
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"birthday" TEXT NOT NULL,
	"weight" TEXT NOT NULL,
	"doctor_id" bigint NOT NULL,
	CONSTRAINT "patients_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "diagnoses" (
	"id" serial NOT NULL,
	"disease_id" bigint NOT NULL,
	"patient_id" bigint NOT NULL,
	CONSTRAINT "diagnoses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "diseases" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "diseases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "patients" ADD CONSTRAINT "patients_fk0" FOREIGN KEY ("doctor_id") REFERENCES "doctors"("id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "diagnoses_fk0" FOREIGN KEY ("disease_id") REFERENCES "diseases"("id");
ALTER TABLE "diagnoses" ADD CONSTRAINT "diagnoses_fk1" FOREIGN KEY ("patient_id") REFERENCES "patients"("id");


