//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GameTrackerData
{
    using System;
    using System.Collections.Generic;
    
    public partial class AliasRating
    {
        public long AliasId { get; set; }
        public string Comment { get; set; }
        public int Rating { get; set; }
    
        public virtual Alias Alias { get; set; }
    }
}