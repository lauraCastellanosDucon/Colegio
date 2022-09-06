package com.colegio.PruebaTecnica.service;

import com.colegio.PruebaTecnica.Persistence.entity.AsignaturaEntity;
import com.colegio.PruebaTecnica.Persistence.repository.AsignaturaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AsignaturaService {

    @Autowired
    private AsignaturaRepository asignaturaRepository;
    // aca no se deberia manejar directamente la entidad sino el DTO
    public List<AsignaturaEntity> obtenerAsignaturasPorProfesor (Long id){
        return  asignaturaRepository.asignatureByProfesor(id);
    }
}
