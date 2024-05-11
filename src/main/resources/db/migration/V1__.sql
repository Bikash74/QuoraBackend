CREATE TABLE answer
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    created_at  datetime     NOT NULL,
    updated_at  datetime     NOT NULL,
    question_id BIGINT NULL,
    text        VARCHAR(255) NOT NULL,
    user_id     BIGINT NULL,
    CONSTRAINT pk_answer PRIMARY KEY (id)
);

CREATE TABLE child_comments
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    comment_id BIGINT NULL,
    text       VARCHAR(255) NOT NULL,
    CONSTRAINT pk_childcomments PRIMARY KEY (id)
);

CREATE TABLE comment
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    answer_id  BIGINT NULL,
    text       VARCHAR(255) NOT NULL,
    CONSTRAINT pk_comment PRIMARY KEY (id)
);

CREATE TABLE question
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    title      VARCHAR(255) NOT NULL,
    body       VARCHAR(255) NOT NULL,
    user_id    BIGINT NULL,
    CONSTRAINT pk_question PRIMARY KEY (id)
);

CREATE TABLE question_topics
(
    question_id BIGINT NOT NULL,
    topic_id    BIGINT NOT NULL
);

CREATE TABLE topic
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    name       VARCHAR(255) NOT NULL,
    CONSTRAINT pk_topic PRIMARY KEY (id)
);

CREATE TABLE user
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    user_name  VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    bio        VARCHAR(255) NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

CREATE TABLE user_answer_likes
(
    answer_id BIGINT NOT NULL,
    user_id   BIGINT NOT NULL
);

CREATE TABLE user_comment_likes
(
    comment_id BIGINT NOT NULL,
    user_id    BIGINT NOT NULL
);

CREATE TABLE user_followed
(
    followed_id BIGINT NOT NULL,
    user_id     BIGINT NOT NULL
);

CREATE TABLE user_follows
(
    following_id BIGINT NOT NULL,
    user_id      BIGINT NOT NULL
);

CREATE TABLE user_question_likes
(
    question_id BIGINT NOT NULL,
    user_id     BIGINT NOT NULL
);

ALTER TABLE answer
    ADD CONSTRAINT FK_ANSWER_ON_QUESTION FOREIGN KEY (question_id) REFERENCES question (id);

ALTER TABLE answer
    ADD CONSTRAINT FK_ANSWER_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE child_comments
    ADD CONSTRAINT FK_CHILDCOMMENTS_ON_COMMENT FOREIGN KEY (comment_id) REFERENCES comment (id);

ALTER TABLE comment
    ADD CONSTRAINT FK_COMMENT_ON_ANSWER FOREIGN KEY (answer_id) REFERENCES answer (id);

ALTER TABLE question
    ADD CONSTRAINT FK_QUESTION_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE question_topics
    ADD CONSTRAINT fk_quetop_on_question FOREIGN KEY (question_id) REFERENCES question (id);

ALTER TABLE question_topics
    ADD CONSTRAINT fk_quetop_on_topic FOREIGN KEY (topic_id) REFERENCES topic (id);

ALTER TABLE user_answer_likes
    ADD CONSTRAINT fk_useanslik_on_answer FOREIGN KEY (answer_id) REFERENCES answer (id);

ALTER TABLE user_answer_likes
    ADD CONSTRAINT fk_useanslik_on_user FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user_comment_likes
    ADD CONSTRAINT fk_usecomlik_on_comment FOREIGN KEY (comment_id) REFERENCES comment (id);

ALTER TABLE user_comment_likes
    ADD CONSTRAINT fk_usecomlik_on_user FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user_followed
    ADD CONSTRAINT fk_usefol_on_followed FOREIGN KEY (followed_id) REFERENCES user (id);

ALTER TABLE user_follows
    ADD CONSTRAINT fk_usefol_on_following FOREIGN KEY (following_id) REFERENCES user (id);

ALTER TABLE user_follows
    ADD CONSTRAINT fk_usefol_on_user FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user_followed
    ADD CONSTRAINT fk_usefol_on_userhamSxw FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user_question_likes
    ADD CONSTRAINT fk_usequelik_on_question FOREIGN KEY (question_id) REFERENCES question (id);

ALTER TABLE user_question_likes
    ADD CONSTRAINT fk_usequelik_on_user FOREIGN KEY (user_id) REFERENCES user (id);