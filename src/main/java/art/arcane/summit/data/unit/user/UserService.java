package art.arcane.summit.data.unit.user;

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
public class UserService implements UserDetailsService {
    private final UserRepository repository;
    private final PasswordEncoder passwordEncoder;

    public void contextLogOut()
    {
        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        SecurityContextHolder.clearContext();
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = repository.findByEmail(email.toLowerCase());

        if (user == null) {
            log.error("Cannot find user by email: " + email.toLowerCase());
            throw new UsernameNotFoundException("Cannot find user by email: " + email.toLowerCase());
        }

        return new org.springframework.security.core.userdetails.User(
                user.email(),
                user.password(),
                user.authority().stream()
                        .map((i)->SummitAuthority.Type.valueOf(i.getName()))
                        .map(SummitAuthority.Type::grant).collect(Collectors.toList()));
    }

    public User getUser(UUID id) {
        return repository.getById(id);
    }

    public User saveUser(User user) {
        if (!repository.existsById(user.id())) {
            throw new RuntimeException("User does not exist. Use createUser() instead.");
        }

        return repository.save(user);
    }

    public User context()
    {
        org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return repository.findByEmail(u.getUsername());
    }

    public boolean hasUserByEmail(String email) {
        return repository.findByEmail(email.toLowerCase()) != null;
    }

    public User createUser(String firstName, String lastName, String email, String password) {
        return repository.save(new User()
                .firstName(firstName)
                .lastName(lastName)
                .password(passwordEncoder.encode(password))
                .email(email.toLowerCase()));
    }
}
