package art.arcane.summit.data.unit.event.assignment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface EventAssignmentRepository extends JpaRepository<EventAssignment, UUID> {
    EventAssignment findByEmail(String email);
}