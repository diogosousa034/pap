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
    
    public partial class Utilizador_Animal
    {
        public int Utilizador_Animal1 { get; set; }
        public string Utilizador { get; set; }
        public Nullable<int> Animal { get; set; }
    
        public virtual Animal Animal1 { get; set; }
        public virtual Utilizador Utilizador1 { get; set; }
    }
}
