import logging
from faker import Faker
import random
import psycopg2
from psycopg2 import DatabaseError

fake = Faker()

def execute_sql_file(cursor, filename):
    with open(filename, 'r', encoding='utf-8') as f:
        sql = f.read()
    cursor.execute(sql)
    try:
        return cursor.fetchall()
    except psycopg2.ProgrammingError:
        return None

def main():
    try:
        conn = psycopg2.connect(host='localhost', database='test', user='111', password='111')
        cur = conn.cursor()

        # Створення таблиць
        execute_sql_file(cur, 'create_table.sql')
        conn.commit()
        print("Таблиці створено")

        # Заповнення груп
        for _ in range(3):
            cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.word(),))

        # Заповнення викладачів
        for _ in range(3):
            cur.execute("INSERT INTO teachers (fullname) VALUES (%s)", (fake.name(),))

        # Заповнення предметів
        for teacher_id in range(1, 4):
            for _ in range(2):
                cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)", (fake.word(), teacher_id))

        # Заповнення студентів та оцінок
        for group_id in range(1, 4):
            for _ in range(10):
                cur.execute("INSERT INTO students (fullname, group_id) VALUES (%s, %s) RETURNING id",
                            (fake.name(), group_id))
                student_id = cur.fetchone()[0] # type: ignore
                for subject_id in range(1, 7):
                    for _ in range(3):
                        cur.execute("INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (%s, %s, %s, %s)",
                                    (student_id, subject_id, random.randint(0, 100), fake.date_this_decade()))

        conn.commit()
        print("Дані додано")

        # Виконання запитів
        for i in range(1, 11):
            filename = f'query_{i}.sql'
            print(f"Виконання {filename}:")
            result = execute_sql_file(cur, filename)
            if result:
                for row in result:
                    print(row)

    except DatabaseError as e:
        logging.error(e)
        conn.rollback()
    finally:
        cur.close()
        conn.close()

if __name__ == '__main__':
    main()
