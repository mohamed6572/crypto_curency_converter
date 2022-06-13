abstract class AppStates{}

class AppInitialState extends AppStates{}
class ChangeBotNavState extends AppStates{}

class AppConvertSuccsesState extends AppStates{}
class AppConvertErrorState extends AppStates{}

class AppGetCryptoLodingState extends AppStates{}
class AppGetCryptoSuccsesState extends AppStates{}
class AppGetCryptoErrorState extends AppStates{}
class AppChangeTheme extends AppStates{}