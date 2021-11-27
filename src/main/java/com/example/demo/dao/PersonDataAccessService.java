package com.example.demo.dao;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.example.demo.model.Person;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("postgres")
public class PersonDataAccessService implements PersonDao {

   private final JdbcTemplate jdbcTemplate;

   public PersonDataAccessService(JdbcTemplate jdbcTemplate) {
      this.jdbcTemplate = jdbcTemplate;
   }

   @Override
   public int insertPerson(UUID id, Person person) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public List<Person> selectAllPeople() {
      // TODO Auto-generated method stub
      final String sql = "select * from person;";
      return jdbcTemplate.query(sql, (resultSet, i) -> {
         return new Person(UUID.fromString(resultSet.getString("id")), resultSet.getString("name"));
      });
   }

   @Override
   public Optional<Person> selectPersonById(UUID id) {
      // TODO Auto-generated method stub
      final String sql = "select * from person where id = ?";
      Person person = jdbcTemplate.queryForObject(sql, (resultSet, i) -> {
         return new Person(UUID.fromString(resultSet.getString("id")), resultSet.getString("name"));
      }, new Object[]{id.toString()});
      return Optional.ofNullable(person);
   }

   @Override
   public int deletePersonById(UUID id) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int updatePersonById(UUID id, Person person) {
      // TODO Auto-generated method stub
      return 0;
   }
   
}
