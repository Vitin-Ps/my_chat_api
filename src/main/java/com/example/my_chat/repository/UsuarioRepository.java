package com.example.my_chat.repository;

import com.example.my_chat.domain.usuario.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    UserDetails findByLogin(String subject);

    Usuario getReferenceByLogin(String email);

    Usuario getReferenceByIdAndAtivoTrue(Long id);
}
