DROP TABLE IF EXISTS "public"."recipes";

CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "time" text,
    "rating" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id", "name", "time", "rating") VALUES 
(1, 'Carbonara', '30', '3'),
(2, 'Baked potato', '35', '2'),
(3, 'Salad', '10', '3'),
(4, 'Fish pie', '60', '4');
