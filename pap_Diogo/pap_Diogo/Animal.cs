//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pap_Diogo
{
    using System;
    using System.Collections.Generic;
    
    public partial class Animal
    {
        public int ID_animal { get; set; }
        public string Nome { get; set; }
        public string Género { get; set; }
        public string Idade { get; set; }
        public string Porte { get; set; }
        public string Foto { get; set; }
        public string Características { get; set; }
        public Nullable<System.DateTime> Data_de_publicaçao { get; set; }
        public Nullable<int> Raça { get; set; }
        public string Cor { get; set; }
        public string Instituiçao { get; set; }
        public Nullable<System.DateTime> Data_adoçao { get; set; }
        public string Utilizador { get; set; }
        public Nullable<bool> Desparazitado { get; set; }
        public string Vacinas { get; set; }
        public Nullable<bool> Esterilizado { get; set; }
        public string Descriçao { get; set; }
        public Nullable<int> Concelho { get; set; }
    
        public virtual Instituiçao Instituiçao1 { get; set; }
        public virtual Raça Raça1 { get; set; }
        public virtual Utilizador Utilizador1 { get; set; }
    }
}
