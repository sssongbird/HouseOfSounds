package Factory;

import java.util.List;

public interface InterGenericDAO<T>{
    List<T> getAll();
    void add(T item);
    T get(int id);
    void update(T item);
    void delete(int id);
}
