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
@Table(name="curso")
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class CursoEntity implements Serializable {

    @Id
    private long id;

    @Column
    private Integer grado;

    @Column
    private String salon;

    @ManyToOne
    @JoinColumn(name="id_colegio")
    @JsonIgnoreProperties("cursos")
    private ColegioEntity colegioEntity;

    @OneToMany(mappedBy = "curso",fetch = FetchType.LAZY)
    private List<AsignaturaEntity> asignaturas;
}
