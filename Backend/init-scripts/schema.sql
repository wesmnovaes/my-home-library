-- Create database if it does not exist
CREATE DATABASE IF NOT EXISTS biblioteca;

-- Select the database
USE biblioteca;

-- Create auxiliary table for publication formats
CREATE TABLE IF NOT EXISTS formato_publicacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

-- Create auxiliary table for authors
CREATE TABLE IF NOT EXISTS autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);

-- Create auxiliary table for book series
CREATE TABLE IF NOT EXISTS series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL UNIQUE
);

-- Table for genres (tags)
CREATE TABLE IF NOT EXISTS genero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

-- Create main table for books
CREATE TABLE IF NOT EXISTS livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    editora VARCHAR(255) NOT NULL,
    codigo_barras BIGINT NOT NULL UNIQUE,
    valor DECIMAL(10,2),              -- optional, can be NULL
    formato_id INT NOT NULL,
    autor_id INT NOT NULL,
    serie_id INT NULL,                -- optional, may or may not belong to a series
    capa VARCHAR(500) NULL,           -- optional, stores path/URL of book cover image
    
    -- Indexes to optimize searches
    INDEX idx_titulo (titulo),
    INDEX idx_editora (editora),
    
    -- Foreign keys
    CONSTRAINT fk_formato FOREIGN KEY (formato_id) REFERENCES formato_publicacao(id),
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autor(id),
    CONSTRAINT fk_serie FOREIGN KEY (serie_id) REFERENCES series(id)
);

-- Intermediate table for many-to-many relationship between books and genres
CREATE TABLE IF NOT EXISTS livro_genero (
    livro_id INT NOT NULL,
    genero_id INT NOT NULL,
    
    -- Composite primary key to avoid duplicates
    PRIMARY KEY (livro_id, genero_id),
    
    -- Foreign keys
    CONSTRAINT fk_livro FOREIGN KEY (livro_id) REFERENCES livro(id),
    CONSTRAINT fk_genero FOREIGN KEY (genero_id) REFERENCES genero(id)
);
