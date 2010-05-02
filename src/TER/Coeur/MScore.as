package Coeur
{
	public class MScore
	{
		private var total:Number;
		
		public function MScore()
		{
			total = 0;
		}
		
		public function incrementer( i:Number = 1):void{
			total += i;
		}
		
		public function decrementer (i:Number = 1):void{
			total -= i;
		}
		
		public function remiseAZero():void{
			total = 0;
		}
		
		public function getTotal():Number{
			return total;
		}

	}
}