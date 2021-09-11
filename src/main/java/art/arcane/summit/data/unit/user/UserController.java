package art.arcane.summit.data.unit.user;

import art.arcane.summit.data.object.OK;
import art.arcane.summit.security.LudicrousPasswordEncoder;
import art.arcane.summit.security.SummitAuthority;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/user")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class UserController {
    private final UserService userService;

    @GetMapping("register")
    public ResponseEntity<?> register(
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String email,
            @RequestParam String password) {
        if (password.length() != LudicrousPasswordEncoder.RAW_LENGTH) {
            return new ResponseEntity<>(new Error("Invalid Password"), HttpStatus.BAD_REQUEST);
        }

        if (userService.hasUserByEmail(email)) {
            return new ResponseEntity<>(new Error("Email Address already in use."), HttpStatus.CONFLICT);
        }

        User user = userService.createUser(firstName, lastName, email, password);

        if (user == null) {
            return new ResponseEntity<>(new Error("Failed to create user."), HttpStatus.CONFLICT);
        }

        return ResponseEntity.ok(user);
    }

    @GetMapping("whoami")
    public ResponseEntity<?> whoami() {
        return ResponseEntity.ok(userService.context());
    }

    @GetMapping("logout")
    public ResponseEntity<?> logout() {
        userService.contextLogOut();
        return ResponseEntity.ok(new OK());
    }
}
