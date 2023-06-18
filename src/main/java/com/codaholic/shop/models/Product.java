package com.codaholic.shop.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "product")
@EqualsAndHashCode(callSuper = false)
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long Id;

    @NotEmpty(message = "Name cannot be blank")
    @Column(unique = true)
    private String name;

    private long quantity;
    private double unitPrice;
}
