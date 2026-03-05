CREATE TABLE author (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO author (id, name, created_at, updated_at)
VALUES (1, 'John Doe', NOW(), NOW());

CREATE TABLE category (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    tag VARCHAR(45) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO category (id, name, tag, created_at, updated_at) VALUES
(1, 'Technology', 'technology', NOW(), NOW()),
(2, 'Lifestyle', 'lifestyle', NOW(), NOW()),
(3, 'Travel', 'travel', NOW(), NOW());

CREATE TABLE blog (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_author
        FOREIGN KEY(author_id)
        REFERENCES author(id)
        ON DELETE CASCADE
);

INSERT INTO blog (id, title, content, author_id, created_at, updated_at)
VALUES (1, 'First Blog Post', 'This is the content of the first blog post.', 1, NOW(), NOW());

CREATE TABLE blog_category (
    id BIGSERIAL PRIMARY KEY,
    blog_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    CONSTRAINT fk_blog
        FOREIGN KEY(blog_id)
        REFERENCES blog(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_category
        FOREIGN KEY(category_id)
        REFERENCES category(id)
        ON DELETE CASCADE
);

INSERT INTO blog_category (id, blog_id, category_id) VALUES
(1,1,1),
(2,1,2),
(3,1,3);