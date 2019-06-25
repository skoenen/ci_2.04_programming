package org.hsrw.ci_2_04_programming;

public class Person extends Schema {
  private String name;
  private String surname;

  public Person(String name, String surname) {
    name = name;
    surname = surname;
  }

  @Override
  public Boolean checkQuery(String query) {
    if(name.equals(query) || surname.equals(query)) {
      return true;
    } else {
      return false;
    }
  }

  public String getName() {
    return name;
  }

  public String getSurname() {
    return surname;
  }

  @Override
  public String toString() {
    return ("" + name + " " + surname);
  }
}

