package com.colegio.PruebaTecnica.controller;

import com.colegio.PruebaTecnica.Persistence.entity.AsignaturaEntity;
import com.colegio.PruebaTecnica.service.AsignaturaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

@RestController
// esto es para la conexión de frontend con backend
@CrossOrigin(origins = "*")
// para definir la url
@RequestMapping("/asignaturas")
public class AsignatureController {
    @Autowired
    private AsignaturaService asignaturaService;

   // @GetMapping("asignatura/{id}")
    @RequestMapping(value = "profesor/{id}",method = RequestMethod.GET)
    // lo correcto es el uso de DTO
    public List<AsignaturaEntity> obtenerAsignaturaPorProfesor(@PathVariable("id") Long id){
        return asignaturaService.obtenerAsignaturasPorProfesor(id);
    }
}
