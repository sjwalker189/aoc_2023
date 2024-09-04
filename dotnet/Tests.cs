using NUnit.Framework;

namespace DayOne.Tests
{
    [TestFixture]
    public class DayOneTests
    {
        [Test]
        public void PartOne()
        {
            var app = new DayOne.Program();
            Assert.AreEqual(99, app.PartOne());
        }
    }
}
