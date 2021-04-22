CREATE TABLE "regions" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "regions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "users" (
	"id" serial NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"preferred_region" bigint NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "posts" (
	"id" serial NOT NULL,
	"title" TEXT NOT NULL,
	"text" TEXT NOT NULL,
	"user_id" bigint NOT NULL,
	"region_id" bigint NOT NULL,
	"category_id" bigint NOT NULL,
	CONSTRAINT "posts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("preferred_region") REFERENCES "regions"("id");

ALTER TABLE "posts" ADD CONSTRAINT "posts_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");
ALTER TABLE "posts" ADD CONSTRAINT "posts_fk1" FOREIGN KEY ("region_id") REFERENCES "regions"("id");
ALTER TABLE "posts" ADD CONSTRAINT "posts_fk2" FOREIGN KEY ("category_id") REFERENCES "categories"("id");


