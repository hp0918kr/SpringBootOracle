package kopo.poly.service;

import kopo.poly.dto.WeatherDTO;

import java.util.List;

public interface IWeatherService {

    List<WeatherDTO> todayWeather() throws Exception;

}
