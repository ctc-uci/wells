CREATE TABLE well_editors (
  well_id BIGINT NOT NULL,
  user_id TEXT NOT NULL,
  assigned_by TEXT NOT NULL,
  date_created TIMESTAMP NOT NULL,

  PRIMARY KEY(well_id, user_id),
  
  FOREIGN KEY (well_id)
    REFERENCES wells_tracker(id),

  FOREIGN KEY (user_id)
    REFERENCES wells_user(id),
  
  FOREIGN KEY (assigned_by)
    REFERENCES wells_user(id)

  
);