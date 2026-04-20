BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO memberships (
      member_id,
      first_name,
      last_name,
      agreement_type,
      payment_amnt,
      agreement_num,
      status_id
    )
    VALUES (
      524929000 + i,
      'First' || i,
      'Last' || i,
      CASE WHEN MOD(i,2)=0 THEN 'Black Card' ELSE 'Basic' END,
      CASE WHEN MOD(i,2)=0 THEN 29.99 ELSE 10.00 END,
      30000 + i,
      CASE MOD(i,6)
        WHEN 0 THEN 6
        WHEN 1 THEN 1
        WHEN 2 THEN 2
        WHEN 3 THEN 3
        WHEN 4 THEN 4
        WHEN 5 THEN 5
      END
    );
  END LOOP;

  COMMIT;
END;
/
