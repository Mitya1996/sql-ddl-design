CREATE TABLE "teams" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	CONSTRAINT "teams_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "goals" (
	"id" serial NOT NULL,
	"player_id" bigint NOT NULL,
	"match_id" bigint NOT NULL,
	CONSTRAINT "goals_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "players" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"birthday" DATE NOT NULL,
	"current_team_id" bigint NOT NULL,
	CONSTRAINT "players_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "matches" (
	"id" serial NOT NULL,
	"home_team_id" bigint NOT NULL,
	"away_team_id" bigint NOT NULL,
	"location" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"start_time" TIME NOT NULL,
	"season_id" bigint NOT NULL,
	"head_ref_id" bigint NOT NULL,
	"ass_ref_1_id" bigint NOT NULL,
	"ass_ref_2_id" bigint NOT NULL,
	CONSTRAINT "matches_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "referees" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "referees_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "season" (
	"id" serial NOT NULL,
	"start_date" DATE NOT NULL,
	"end_date" DATE NOT NULL,
	CONSTRAINT "season_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "lineups" (
	"id" serial NOT NULL,
	"player_id" bigint NOT NULL,
	"match_id" bigint NOT NULL,
	"team_id" bigint NOT NULL,
	CONSTRAINT "lineups_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "results" (
	"id" serial NOT NULL,
	"team_id" bigint NOT NULL,
	"match_id" bigint NOT NULL,
	"result" TEXT NOT NULL,
	CONSTRAINT "results_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "goals" ADD CONSTRAINT "goals_fk0" FOREIGN KEY ("player_id") REFERENCES "players"("id");
ALTER TABLE "goals" ADD CONSTRAINT "goals_fk1" FOREIGN KEY ("match_id") REFERENCES "matches"("id");

ALTER TABLE "players" ADD CONSTRAINT "players_fk0" FOREIGN KEY ("current_team_id") REFERENCES "teams"("id");

ALTER TABLE "matches" ADD CONSTRAINT "matches_fk0" FOREIGN KEY ("home_team_id") REFERENCES "teams"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk1" FOREIGN KEY ("away_team_id") REFERENCES "teams"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk2" FOREIGN KEY ("season_id") REFERENCES "season"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk3" FOREIGN KEY ("head_ref_id") REFERENCES "referees"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk4" FOREIGN KEY ("ass_ref_1_id") REFERENCES "referees"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk5" FOREIGN KEY ("ass_ref_2_id") REFERENCES "referees"("id");



ALTER TABLE "lineups" ADD CONSTRAINT "lineups_fk0" FOREIGN KEY ("player_id") REFERENCES "players"("id");
ALTER TABLE "lineups" ADD CONSTRAINT "lineups_fk1" FOREIGN KEY ("match_id") REFERENCES "matches"("id");
ALTER TABLE "lineups" ADD CONSTRAINT "lineups_fk2" FOREIGN KEY ("team_id") REFERENCES "teams"("id");

ALTER TABLE "results" ADD CONSTRAINT "results_fk0" FOREIGN KEY ("team_id") REFERENCES "teams"("id");
ALTER TABLE "results" ADD CONSTRAINT "results_fk1" FOREIGN KEY ("match_id") REFERENCES "matches"("id");

