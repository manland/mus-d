package
{
	import mx.controls.Alert;
	
	public class MonAlerte extends Alert
	{
		public function MonAlerte()
		{
			this.show("Fin de Partie", "Test", Alert.OK | Alert.CANCEL, null, myClickHandler, "testIcon", Alert.OK);
		}
		

		
	
	}
}