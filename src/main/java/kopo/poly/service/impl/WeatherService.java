package kopo.poly.service.impl;

import kopo.poly.dto.WeatherDTO;
import kopo.poly.service.IWeatherService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Slf4j
@Service
public class WeatherService implements IWeatherService {


    @Override
    public List<WeatherDTO> todayWeather() throws Exception {

        log.info(this.getClass().getName() + ".todayFood Start!");


        String url = "https://weather.naver.com/";

        Document doc = null;

        doc = Jsoup.connect(url).get();

        Elements element = doc.select("div.weather_now");

        Iterator<Element> today_weather = element.select("strong.current").iterator();

       WeatherDTO pDTO = null;

        List<WeatherDTO> pList = new ArrayList<>();

        int res = 0;

        while (today_weather.hasNext()) {

            pDTO = new WeatherDTO();

            String weather = CmmUtil.nvl(today_weather.next().text()).trim();

            log.info("weather : " + weather);

            pDTO.setTemperature(weather.substring(4));

            pList.add(pDTO);
        }
        log.info(this.getClass().getName() + ".toDayWeather End!");

        return pList;
    }
}
