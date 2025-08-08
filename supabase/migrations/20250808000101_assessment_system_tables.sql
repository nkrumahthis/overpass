
-- Assessment weights (versioned, scoped)
CREATE TABLE assessment_weights (
    weight_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    component_id UUID NOT NULL REFERENCES assessment_components(component_id) ON DELETE CASCADE,
    weight_percent NUMERIC(5,2) NOT NULL CHECK (weight_percent >= 0),
    scope_type TEXT NOT NULL CHECK (scope_type IN ('GLOBAL','SCHOOL','SUBJECT','SESSION')),
    scope_id UUID NULL, -- points to school/subject/session depending on scope_type
    effective_from DATE NOT NULL,
    effective_to DATE NULL,
    created_by UUID NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Optional CHECK: For each scope/effective period, sum of weights = 100
-- (Cannot be done with a static CHECK constraint, needs trigger or view validation.)

-- Exam scores (final)
CREATE TABLE exam_scores (
    score_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(subject_id) ON DELETE CASCADE,
    session_id UUID NOT NULL REFERENCES sessions(session_id) ON DELETE CASCADE,
    score NUMERIC(5,2) NOT NULL, -- final weighted score
    grade TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    UNIQUE(student_id, subject_id, session_id)
);

-- Exam score breakdown
CREATE TABLE exam_score_breakdown (
    breakdown_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    score_id UUID NOT NULL REFERENCES exam_scores(score_id) ON DELETE CASCADE,
    attendance NUMERIC(6,2),
    class_assessment NUMERIC(6,2),
    exam_raw NUMERIC(6,2),
    exam_weighted NUMERIC(6,2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
