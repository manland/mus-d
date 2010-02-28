package Coeur
{
	public class MScore
	{
		private var total:Number;
		
		public function MScore()
		{
			total = 0;
		}
		
		public function incrementer( i:Number):void{
			total += i;
		}
		
		public function decrementer (i:Number):void{
			total -= i;
		}
		
		public function getTotal():Number{
			return total;
		}

	}
}