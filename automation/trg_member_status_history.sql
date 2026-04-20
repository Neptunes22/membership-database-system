CREATE OR REPLACE TRIGGER trg_member_status_history
AFTER UPDATE OF status_id ON memberships
FOR EACH ROW
BEGIN
    UPDATE member_status_history
    SET end_date = SYSDATE
    WHERE member_id = :OLD.member_id
      AND end_date IS NULL;

    INSERT INTO member_status_history (
        history_id,
        member_id,
        status_id,
        start_date,
        end_date
    )
    VALUES (
        history_seq.NEXTVAL,
        :NEW.member_id,
        :NEW.status_id,
        SYSDATE,
        NULL
    );
END;
/
