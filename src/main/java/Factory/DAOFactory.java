package Factory;

public class DAOFactory {
    public static <T> GenericDAO<T> getDAO(Class<T> entityClass) {
        if (entityClass == Lager.class) {
            return (GenericDAO<T>) new LagerDaoImplement();
        }
        throw new IllegalArgumentException("Unknown entity class: " + entityClass);
    }
}