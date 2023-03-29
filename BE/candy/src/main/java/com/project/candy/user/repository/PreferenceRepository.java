package com.project.candy.user.repository;

import com.project.candy.user.entity.Preference;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * packageName    : com.project.candy.user.repository
 * fileName       : PreferenceRepository
 * date           : 2023-03-29
 * description    : Preference 정보를 DB와 통신하는 JPA DATA 인터페이스
 */
public interface PreferenceRepository extends JpaRepository<Preference,Long > {

}
