package Factory;

public class DAOFactory {
    public static <T> GenericDAO<T> getDAO(Class<T> entityClass) {
        if (entityClass == Lager.class) {
            return (GenericDAO<T>) new LagerDaoImplement();
        } else if (entityClass == PLZ.class) {
            return (GenericDAO<T>) new PLZDoaImplement();
        } else if (entityClass == Produkte.class) {
            return (GenericDAO<T>) new ProdukteDaoImplement();
        } else if (entityClass == Rabatt.class) {
            return (GenericDAO<T>) new RabattDAOImpl();
        } else if (entityClass == Kunden.class) {
            return (GenericDAO<T>) new KundenDaoImplement();
        } else if (entityClass == Standort.class) {
            return (GenericDAO<T>) new StandortDaoImplement();
        }
        throw new IllegalArgumentException("Unknown entity class: " + entityClass);
    }
}