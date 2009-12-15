using System.Collections.Generic;

namespace TrinityBrick.Models
{
    public class ProductEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string SampleImagePath { get; set; }
        public List<string> Images { get; set; }
    }
}