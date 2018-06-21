INSERT INTO USER_(ID, USER_NAME, PASSWORD, ACCOUNT_EXPIRED, ACCOUNT_LOCKED, CREDENTIALS_EXPIRED, ENABLED)
  VALUES (1, 'admin', /*admin123*/'$2a$04$vx/XyIR3t01yvBwuYDdD/ObS/t9zsIcX2zuInZTgI2YB2APyxHgoe', FALSE, FALSE, FALSE, TRUE);

INSERT INTO USER_(ID, USER_NAME, PASSWORD, ACCOUNT_EXPIRED, ACCOUNT_LOCKED, CREDENTIALS_EXPIRED, ENABLED)
  VALUES (2, 'reader', /*reader123*/'$2a$04$xLOVN8PbAyIQFOhwqfD1fuGtbDYF5ywBhq6iDVc26oZbojiyIG11u', FALSE, FALSE, FALSE, TRUE);

INSERT INTO USER_(ID, USER_NAME, PASSWORD, ACCOUNT_EXPIRED, ACCOUNT_LOCKED, CREDENTIALS_EXPIRED, ENABLED)
  VALUES (3, 'editor', /*editor123*/'$2a$04$gdiFwCxUa8XhPrx.a6Yf2eO168sP4pMQYaC7h4xddNRGbcTPRwMs.', FALSE, FALSE, FALSE, TRUE);

INSERT INTO USER_(ID, USER_NAME, PASSWORD, ACCOUNT_EXPIRED, ACCOUNT_LOCKED, CREDENTIALS_EXPIRED, ENABLED)
  VALUES (4, 'reader2', /*reader123*/'$2a$04$yTCw0N7IcF7lapGSUGyej.QblNPYrgfr5OetKN3Zm4XzK6c94W/r.', FALSE, FALSE, FALSE, TRUE);

INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 1);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 2);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 3);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 4);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 5);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 6);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 7);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 8);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (1, 9);

INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (2, 2);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (2, 6);

INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (3, 3);
INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (3, 7);

INSERT INTO USERS_AUTHORITIES(USER_ID, AUTHORITY_ID) VALUES (4, 9);