package in.silentsudo.springboothelm;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/")
public class RootController {

    @Value("${spring.application.name}")
    private String appName;

    @GetMapping
    public Map<String, String> root() {
        return Map.of("status", "ok", "appName", "" + appName);
    }
}
