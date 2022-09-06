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
@Table(name="asignatura")
@Getter
@Setter
@ToString
@EqualsAndHashCode

public class AsignaturaEntity implements Serializable {
    @Id
    private Long Id;

    @Column
    private String nombre;

    @ManyToOne
    @JoinColumn(name="id_profesor") //<-- nombre del campo en la tabla de la base de datos
    @JsonIgnoreProperties("asignaturas") //<-- nombre del atributo que almacena las asignaturas en la entidad profesor
    private ProfesorEntity profesor;

    @ManyToOne
    @JoinColumn(name="id_curso")
    @JsonIgnoreProperties("asignaturas")
    private CursoEntity curso;

    @ManyToMany(mappedBy = "asignaturas",fetch = FetchType.LAZY)
    @JsonIgnoreProperties("asignaturas")
    private List<EstudianteEntity> estudiantes;
}
