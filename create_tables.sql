CREATE TABLE memberships (
    member_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(45),
    last_name VARCHAR2(45),
    agreement_type VARCHAR2(45),
    payment_amnt NUMBER(6,2),
    agreement_num NUMBER,
    status_id NUMBER NOT NULL
);

CREATE TABLE member_status (
    status_id NUMBER PRIMARY KEY,
    status_name VARCHAR2(50) NOT NULL
);

CREATE TABLE member_status_history (
    history_id NUMBER PRIMARY KEY,
    member_id NUMBER NOT NULL,
    status_id NUMBER NOT NULL,
    start_date DATE DEFAULT SYSDATE,
    end_date DATE
);