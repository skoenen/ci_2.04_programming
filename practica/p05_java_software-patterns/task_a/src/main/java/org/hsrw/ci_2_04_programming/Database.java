package org.hsrw.ci_2_04_programming;

import java.util.LinkedList;

public class Database {
  private LinkedList<Schema> storage;

  public Database() {
    storage = new LinkedList<Schema>();
  }

  public void insert(Schema s) {
    storage.add(s);
  }

  public Schema get(String query) {
    Schema result = new Person("Unknown", "Master");

    for(Schema s : storage) {
      if(s.checkQuery(query)) {
        result = s;
      }
    }

    return result;
  }
}

