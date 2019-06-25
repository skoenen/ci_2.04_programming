package org.hsrw.ci_2_04_programming;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;

public class DatabaseTest {
  @Test
  public void checkInstance() {
    Database db = Database.getInstance();

    assertNotNull(db);
    assertEquals(db, Database.getInstance());
  }

  @Test
  public void checkData() {
    Person a = new Person("Arthur", "Dent");
    Person b = new Person("Ford", "Perfect");

    Database.getInstance().insert(a);
    Database.getInstance().insert(b);

    Database db = Database.getInstance();
    assertNotNull(db);

    assertTrue(
      a.getName().equals(
        ( (Person)(Database.getInstance().get("Arthur")) ).getName()
      )
    );
  }
}
