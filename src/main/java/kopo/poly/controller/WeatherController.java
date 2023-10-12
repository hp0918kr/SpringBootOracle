package kopo.poly.controller;

import kopo.poly.dto.WeatherDTO;
import kopo.poly.service.IWeatherService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@RequestMapping("/weather")
@RequiredArgsConstructor
@Controller
public class WeatherController {

    private final IWeatherService weatherService; // Weather 서비스 객체 주입

    /**
     * 네이버 날씨 수집
     */
    @GetMapping(value = "todayWeather")
    public String collectWeather(ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".collectWeather 시작");

        // weatherService.toDayWeather() 결과를 Null 값 체크하여 rList 객체에 저장하기
        List<WeatherDTO> rList = Optional.ofNullable(weatherService.todayWeather()).orElseGet(ArrayList::new);

        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + ".collectWeather 끝");

        return "weather/todayWeather";
    }
}
