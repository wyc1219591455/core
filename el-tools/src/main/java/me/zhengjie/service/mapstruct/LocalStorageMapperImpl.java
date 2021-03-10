package me.zhengjie.service.mapstruct;

import lombok.RequiredArgsConstructor;
import me.zhengjie.domain.LocalStorage;
import me.zhengjie.service.dto.LocalStorageDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LocalStorageMapperImpl implements LocalStorageMapper {
    @Override
    public LocalStorage toEntity(LocalStorageDto dto) {
        return null;
    }

    @Override
    public LocalStorageDto toDto(LocalStorage entity) {
        return null;
    }

    @Override
    public List<LocalStorage> toEntity(List<LocalStorageDto> dtoList) {
        return null;
    }

    @Override
    public List<LocalStorageDto> toDto(List<LocalStorage> entityList) {
        return null;
    }
}
