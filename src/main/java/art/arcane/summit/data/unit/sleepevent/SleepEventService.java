package art.arcane.summit.data.unit.sleepevent;

import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.data.unit.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
@Log4j2
public class SleepEventService {
    private final UserService userService;
    private final SleepEventRepository repository;

    public void delete(SleepEvent event)
    {
        if (!repository.existsById(event.id())) {
            throw new RuntimeException("Sleep Event does not exist. Use publish() instead.");
        }

        if(!userService.context().id().equals(event.user().id()))
        {
            throw new RuntimeException("Sleep Event cannot have a different owner than yourself!");
        }

        if(!repository.getById(event.id()).user().id().equals(userService.context().id()))
        {
            throw new RuntimeException("Cannot delete other's sleep events!");
        }

        repository.delete(event);
    }

    public SleepEvent update(SleepEvent event) {
        if (!repository.existsById(event.id())) {
            throw new RuntimeException("Sleep Event does not exist. Use publish() instead.");
        }

        if(!userService.context().id().equals(event.user().id()))
        {
            throw new RuntimeException("Sleep Event cannot have a different owner than yourself!");
        }

        if(!repository.getById(event.id()).user().id().equals(userService.context().id()))
        {
            throw new RuntimeException("Cannot edit other's sleep events!");
        }

        return repository.save(event);
    }

    public SleepEvent createUser(long start, long finish) {
        if(finish <= start)
        {
            throw new RuntimeException("Invalid sleep event! Start must be earlier than finish!");
        }

        return repository.save(new SleepEvent()
                .user(userService.context())
                .start(new Date(start))
                .finish(new Date(finish)));
    }
}
