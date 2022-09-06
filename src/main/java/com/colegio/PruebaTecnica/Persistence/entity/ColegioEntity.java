package com.colegio.PruebaTecnica.Persistence.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name="colegio")
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class ColegioEntity implements Serializable {

    @Id
    private Long id;

    @Column(name = "nombre")
    private String nombre;

    @OneToMany(mappedBy = "colegioEntity",fetch = FetchType.LAZY)
    private List<CursoEntity> cursos;


}
