package student;
import org.jboss.weld.environment.se.Weld;
import org.jboss.weld.environment.se.WeldContainer;
public class MainApp {
    public static void main(String[] args) {
        Weld weld = new Weld();
        WeldContainer container = weld.initialize();
        Student student = container.select(Student.class).get();
        student.setAge(22);
        student.setName("Assaf");
        student.getAge();
        student.getName();
    }
}
