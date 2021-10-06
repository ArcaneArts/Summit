package art.arcane.summit.data.unit.board.access;

import art.arcane.summit.data.unit.board.Board;
import art.arcane.summit.data.unit.board.BoardService;
import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.data.unit.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/board/access")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class BoardAccessController {
    private final UserService userService;
    private final BoardAccessService boardAccessService;
    private final BoardService boardService;

    @GetMapping("/{access}")
    public ResponseEntity<?> get(@PathVariable("access") String access) {
        return ResponseEntity.ok(boardAccessService.getBoardAccess(UUID.fromString(access)));
    }

    @PostMapping("/{board}/{user}")
    public ResponseEntity<?> addAccessor(@PathVariable("board") String board,
                                         @PathVariable("user") String user) {
        User u = userService.getUser(UUID.fromString(user));
        Board b = boardService.getBoard(UUID.fromString(board));
        return ResponseEntity.ok(boardAccessService.createBoardAccess(u, b));
    }

    @DeleteMapping("/{access}")
    public ResponseEntity<?> delete(@PathVariable("access") String access) {
        boardAccessService.delete(UUID.fromString(access));
        return ResponseEntity.ok().build();
    }
}
