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
    
    public partial class Raça
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Raça()
        {
            this.Animals = new HashSet<Animal>();
        }
    
        public int ID_Raça { get; set; }
        public string Nome { get; set; }
        public string Características { get; set; }
        public string Foto { get; set; }
        public Nullable<int> Tipo { get; set; }
    
        public virtual Tipo Tipo1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Animal> Animals { get; set; }
    }
}
