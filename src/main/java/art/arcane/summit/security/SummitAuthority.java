package art.arcane.summit.security;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

@Data
@RequiredArgsConstructor
public class SummitAuthority implements GrantedAuthority {
    private final Type type;

    @Override
    public String toString() {
        return this.type.ordinal() + "";
    }

    public String getAuthority() {
        return toString();
    }

    public enum Type {
        ADMIN,
        DEVOPS;

        public GrantedAuthority grant() {
            return new SummitAuthority(this);
        }
    }
}
