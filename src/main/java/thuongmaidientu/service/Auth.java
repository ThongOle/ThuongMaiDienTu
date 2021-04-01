package thuongmaidientu.service;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.ElementType;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Auth {
	public int permission();
	public enum Action {
		VIEW, UPDATE, DELETE
	};
	
	public Action action();
}
