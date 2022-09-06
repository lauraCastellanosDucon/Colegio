package com.colegio.PruebaTecnica.Persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name="estudiante")
@Getter
@Setter
@ToString
@EqualsAndHashCode

public class EstudianteEntity implements Serializable {
    @Id
    private Long Id;

    @Column
    private String nombre;

    @ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    @JoinTable(name = "asignatura_estudiante", // acá debe dar el nombre de la entidad debil
            joinColumns = {@JoinColumn(name = "id_estudiante")}, // llave foranea que apunta a la entidad estudiante
            inverseJoinColumns = {@JoinColumn(name = "id_asignatura")}) // llave foranea que apunta a asignatura
    @JsonIgnoreProperties("estudiantes")
    private List<AsignaturaEntity> asignaturas;




}
