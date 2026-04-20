ALTER TABLE memberships
ADD CONSTRAINT fk_membership_status
FOREIGN KEY (status_id)
REFERENCES member_status(status_id);

ALTER TABLE member_status_history
ADD CONSTRAINT fk_history_member
FOREIGN KEY (member_id)
REFERENCES memberships(member_id);

ALTER TABLE member_status_history
ADD CONSTRAINT fk_history_status
FOREIGN KEY (status_id)
REFERENCES member_status(status_id);
