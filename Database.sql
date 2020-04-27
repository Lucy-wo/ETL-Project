CREATE TABLE "cavideos" (
    "year_month" VARCHAR   NOT NULL,
    "category_id" INTEGER   NOT NULL,
    "views" INTEGER   NOT NULL,
    "likes" INTEGER   NOT NULL,
    "dislikes" INTEGER   NOT NULL,
    "comment_count" INTEGER   NOT NULL,
    "comments_disabled" VARCHAR   NOT NULL,
    "ratings_disabled" VARCHAR   NOT NULL
);
CREATE TABLE "usvideos" (
    "year_month" VARCHAR   NOT NULL,
    "category_id" INTEGER   NOT NULL,
    "views" INTEGER   NOT NULL,
    "likes" INTEGER   NOT NULL,
    "dislikes" INTEGER   NOT NULL,
    "comment_count" INTEGER   NOT NULL,
    "comments_disabled" VARCHAR   NOT NULL,
    "ratings_disabled" VARCHAR   NOT NULL
);

CREATE TABLE "category_data" (
    "category_id" INTEGER   NOT NULL,
    "category_title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_category_data" PRIMARY KEY (
        "category_id"
     )
);


ALTER TABLE "cavideos" ADD CONSTRAINT "fk_cavideos_category_id" FOREIGN KEY("category_id")
REFERENCES "category_data" ("category_id");

ALTER TABLE "usvideos" ADD CONSTRAINT "fk_usvideos_category_id" FOREIGN KEY("category_id")
REFERENCES "category_data" ("category_id");
