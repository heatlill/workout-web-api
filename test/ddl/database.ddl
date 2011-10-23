create table test.exercise (
  id int not null,
  name varchar(255),
  description text(65535),
  unit_id int not null,
  primary key (id),
  foreign key fk_exercise_unit_id (unit_id) references exercise_unit(id)
);

create table test.schema_migrations (
  version varchar(255) not null
);
create unique index unique_schema_migrations on test.schema_migrations (version);

create table test.session_exercise (
  id int not null,
  session_id int,
  exercise_id int,
  unit_quantity int,
  primary key (id)
);

create table test.workout_session (
  id int not null,
  user_id int,
  session_date datetime,
  primary key (id)
);

create table test.exercise_unit (
  id int not null,
  name varchar(255),
  description text(65535),
  primary key (id)
);
