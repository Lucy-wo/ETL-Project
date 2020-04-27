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


