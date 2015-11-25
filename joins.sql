#Display only collars with known owners and those owners' names

SELECT lost_dog_collars.dog_name
  FROM dog_owners JOIN lost_dog_collars ON (dog_owners.dog_name = lost_dog_collars.dog_name);

#Display only collars without known owners.
SELECT DISTINCT lost_dog_collars.dog_name FROM lost_dog_collars
  WHERE NOT EXISTS (SELECT * FROM dog_owners WHERE dog_owners.dog_name = lost_dog_collars.dog_name);


#Display all collars in our possession. If an owner exists for a given collar, display that also.
SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM dog_owners
  FULL OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name) WHERE lost_dog_collars.dog_name IS NOT NULL;

#Display all owners known to us. If a collar matches that owner, display the collar also.
SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners FULL OUTER JOIN lost_dog_collars ON (dog_owners.dog_name = lost_dog_collars.dog_name) WHERE dog_owners.name IS NOT NULL;
-- 
