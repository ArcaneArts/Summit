package art.arcane.summit.data.unit.board.access;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface BoardAccessRepository extends JpaRepository<BoardAccess, UUID> {

}