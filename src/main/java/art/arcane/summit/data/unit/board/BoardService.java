package art.arcane.summit.data.unit.board;

import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.data.unit.user.UserController;
import art.arcane.summit.data.unit.user.UserRepository;
import art.arcane.summit.data.unit.user.UserService;
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
public class BoardService {
    private final BoardRepository repository;

    public Board getBoard(UUID id) {
        return repository.getById(id);
    }

    public Board saveBoard(Board board) {
        if (!repository.existsById(board.id())) {
            throw new RuntimeException("Board does not exist. Use createBoard() instead.");
        }

        return repository.save(board);
    }

    public Board createBoard() {
        return repository.save(new Board());
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
