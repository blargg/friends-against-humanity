DROP TABLE IF EXISTS MaterializedWeights;
CREATE TABLE MaterializedWeights (
    BlackCardID int(11),
    label CHAR(15),
    weight REAL(10,4)
    );
INSERT MaterializedWeights
SELECT * FROM LabelWeights;
