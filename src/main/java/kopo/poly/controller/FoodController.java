package kopo.poly.controller;

import kopo.poly.dto.FoodDTO;
import kopo.poly.service.IFoodService;
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
@RequiredArgsConstructor
@RequestMapping(value = "/food")
@Controller
public class FoodController {

    private final IFoodService foodService;

    @GetMapping(value = "toDayWeather")
    public String collectFood(ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".collectFood Start!");

        List<FoodDTO> rList = Optional.ofNullable(foodService.toDayFood()).orElseGet(ArrayList::new);

        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + ".collectFood End!");

        return "/food/todayFood";
    }

}
