package com.colegio.PruebaTecnica.config;

import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Component;

import org.springframework.jdbc.datasource.DriverManagerDataSource;


@Component
public class DataSourceConfig {

    @Bean (name = "dataSource")
    public DriverManagerDataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.h2.Driver");
        dataSource.setUrl("jdbc:h2:~/Documents/PruebaTecnica/colegio-db");
        dataSource.setUsername("Sa");
        dataSource.setPassword("abc123");

        Resource resource = new ClassPathResource("data.sql");
        DatabasePopulator databasePopulator = new ResourceDatabasePopulator(resource);
        DatabasePopulatorUtils.execute(databasePopulator,dataSource);
        return dataSource;
    }
}
