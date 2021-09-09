package art.arcane.summit.data.unit.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
    art.arcane.summit.data.unit.user.User findByEmail(String email);
}