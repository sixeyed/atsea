﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Docker.AtSea.Api.Models.Shop
{
    [Table(name:"Product")]
    public class Product
    {
        [Key]
        public long ProductId { get; set; }
        
        [Required]
        [StringLength(255)]
        public string Name { get; set; }

        [Required]
        public decimal Price { get; set; }


        [Required]
        [StringLength(10485760)]
        public string Description { get; set; }

        [Required]
        public string Image { get; set; }
    }
}