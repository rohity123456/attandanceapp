package helpingClasses;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class SessionFact {

    public static SessionFactory sf;
    public static ServiceRegistry serviceRegistry;

    public SessionFact() {
    }

    
    public static SessionFactory getSessionFact() {
        Configuration cfg = new Configuration();
        cfg.configure("/Resources/hibernate.cfg.xml");
        serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
        sf = cfg.buildSessionFactory(serviceRegistry);
        return sf;
    }
}
