package art.arcane.summit.data.unit.event;

import art.arcane.summit.data.unit.board.Board;
import art.arcane.summit.data.unit.board.access.BoardAccess;
import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.security.SummitAuthority;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.stream.Collectors;

@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
@Log4j2
public class EventService implements UserDetailsService {
    private final EventRepository repository;

    public Event getEvent(UUID id) {
        return repository.getById(id);
    }

    public Event saveEvent(Event event) {
        if (!repository.existsById(event.id())) {
            throw new RuntimeException("Event does not exist. Use createEvent() instead.");
        }

        return repository.save(event);
    }

    public BoardAccess createBoardAccess(User user, Board board) {
        return repository.save(new BoardAccess()
                .admin(false).moderator(false).bigPicture(false)
                .edit(false).delegate(false)
                .user(user).board(board));
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
