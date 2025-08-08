-- ==============================================
-- Base Tables
-- ==============================================

-- 1. Students
CREATE TABLE students (
    student_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name TEXT NOT NULL,
    admission_year INT NOT NULL,
    completion_year INT,
    study_area TEXT, -- e.g. 'General Science'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- 2. Subjects
CREATE TABLE subjects (
    subject_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_name TEXT NOT NULL UNIQUE,
    is_elective BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- 3. Teachers
CREATE TABLE teachers (
    teacher_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- 4. Teacher–Subject relationship
CREATE TABLE teacher_subjects (
    teacher_subject_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    teacher_id UUID NOT NULL REFERENCES teachers(teacher_id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(subject_id) ON DELETE CASCADE,
    start_date DATE,
    end_date DATE,
    UNIQUE(teacher_id, subject_id, start_date)
);

-- 5. Classes (e.g., "1D", "2D")
CREATE TABLE classes (
    class_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    class_name TEXT NOT NULL UNIQUE,
    level INT NOT NULL, -- e.g., 1, 2, 3, 4
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- 6. Academic sessions (e.g., "2nd Year, Term 2")
CREATE TABLE sessions (
    session_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    academic_year TEXT NOT NULL, -- e.g., "2010/2011"
    term_number INT NOT NULL CHECK (term_number BETWEEN 1 AND 3),
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- 7. Assessment components (attendance, class assessment, exam, etc.)
CREATE TABLE assessment_components (
    component_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT NOT NULL UNIQUE,         -- e.g., 'attendance', 'class_assessment', 'exam_raw'
    display_name TEXT NOT NULL,        -- e.g., 'Attendance'
    max_score NUMERIC(6,2) NOT NULL,   -- e.g., 10 for attendance, 100 for exam_raw
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
