package art.arcane.summit.data.unit.user;

import art.arcane.summit.security.LudicrousPasswordEncoder;
import art.arcane.summit.security.SummitAuthority;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import java.io.Serial;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

@Table(name = "user")
@Entity
@Getter
@Setter
@Accessors(fluent = true, chain = true)
@RequiredArgsConstructor
public class User implements Serializable {
    @Serial
    private static final long serialVersionUID = 337830420440330693L;

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", columnDefinition = "BINARY(16)",
            updatable = false, nullable = false)
    private UUID id;

    @ManyToMany(fetch = FetchType.EAGER)
    private Collection<Role> authority = new HashSet<>();

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password", nullable = false, length = LudicrousPasswordEncoder.LENGTH)
    private String password;
}