// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ubuntu_provision_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Occitan (`oc`).
class UbuntuProvisionLocalizationsOc extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsOc([String locale = 'oc']) : super(locale);

  @override
  String get accessibilityPageTitle => 'Accessibilitat';

  @override
  String accessibilityPageHeader(String DISTRO) {
    return 'L’accessibilitat dins $DISTRO';
  }

  @override
  String accessibilityPageBody(String DISTRO) {
    return 'Personalizatz $DISTRO coma avètz mestièr abans de lo metre en plaça. Podètz cambiar aquò mai tard als paramètres sistèma.';
  }

  @override
  String get accessibilitySeeingLabel => 'Vista';

  @override
  String get accessibilityHearingLabel => 'Ausida';

  @override
  String get accessibilityTypingLabel => 'Picatge';

  @override
  String get accessibilityPointingLabel => 'Ponchar e clicar';

  @override
  String get accessibilityZoomLabel => 'Agrandiment';

  @override
  String get accessibilityHighContrastLabel => 'Constraste naut';

  @override
  String get accessibilityLargeTextLabel => 'Tèxte grand';

  @override
  String get accessibilityReduceAnimationLabel => 'Redusir l’animacion';

  @override
  String get accessibilityScreenReaderLabel => 'Lector d’ecran';

  @override
  String get accessibilityVisualAlertsLabel => 'Alèrtas visualas';

  @override
  String get accessibilityStickKeysLabel => 'Tòcas remanentas';

  @override
  String get accessibilitySlowKeysLabel => 'Tòcas lentas';

  @override
  String get accessibilityMouseKeysLabel => 'Tòcas de la mirga';

  @override
  String get accessibilityDesktopZoomLabel => 'Agrandiment del buèu';

  @override
  String get errorPageTitle => 'Quicòm a trucat';

  @override
  String get errorPageUnexpected =>
      'O planhèm, mas sabèm pas quina error es. Podètz ensajar de reaviar l’ordenador e començar lo processús d’installacion tornamai. Podètz tanben<a>senhalar l’anomalia</a>.';

  @override
  String errorPageUbuntuBug(String SNAP) {
    return 'Per mandar un rapòrt d\'error automatizat qu’inclutz d\'informacions de desbugatge pertinentas, executatz <pre>sudo ubuntu-bug $SNAP</pre> dins un terminal, o dempuèi la consòla de comanda (Alt+F2).';
  }

  @override
  String get errorPageShowLog => 'Afichar lo jornal';

  @override
  String get errorPageHideLog => 'Amagar lo jornal';

  @override
  String get restart => 'Reaviar';

  @override
  String get close => 'Tampar';

  @override
  String get timezonePageTitle => 'Seleccionatz vòstre fus orari';

  @override
  String get timezoneLocationLabel => 'Localizacion';

  @override
  String get timezoneTimezoneLabel => 'Fus orari';

  @override
  String get keyboardTitle => 'Agençament del clavièr';

  @override
  String get keyboardHeader => 'Seleccionatz vòstre agençament de clavièr';

  @override
  String get keyboardTestHint => 'Picatz de tèxt aquí per ensajar lo clavièr';

  @override
  String get keyboardDetectTitle => 'Detectar l’agençament del clavièr';

  @override
  String get keyboardDetectButton => 'Detectar';

  @override
  String get keyboardVariantLabel => 'Varianta del clavièr :';

  @override
  String get keyboardPressKeyLabel =>
      'Mercés de quichar una de las tòcas seguentas :';

  @override
  String get keyboardKeyPresentLabel =>
      'La tòca seguenta es presenta sul clavièr ?';

  @override
  String get themePageTitle => 'Causissètz vòstre tèma';

  @override
  String get themePageHeader =>
      'La poiretz cambiar mai tard en anant a las preferéncias d’aparéncia.';

  @override
  String get themeDark => 'Fosc';

  @override
  String get themeLight => 'Clar';

  @override
  String localePageTitle(String DISTRO) {
    return 'La benvenguda a $DISTRO';
  }

  @override
  String get localeHeader => 'Causissètz vòstra lenga :';

  @override
  String get identityPageTitle => 'Configuratz vòstre compte';

  @override
  String get identityAutoLogin => 'Se connectar automaticament';

  @override
  String get identityRequirePassword =>
      'Demandar mon senhal per dobrir una session';

  @override
  String get identityRealNameLabel => 'Vòstre prenom';

  @override
  String get identityRealNameRequired => 'Cal un prenom';

  @override
  String get identityRealNameTooLong => 'Aqueste nom es tròp long.';

  @override
  String get identityHostnameLabel => 'Lo nom de l’ordenador';

  @override
  String get identityHostnameInfo =>
      'Lo nom qu’utiliza per comunicar amb d’autres ordenadors.';

  @override
  String get identityHostnameRequired => 'Un nom d’ordenador es requerit';

  @override
  String get identityHostnameTooLong => 'Aqueste nom d’ordenador es tròp long.';

  @override
  String get identityInvalidHostname => 'Lo nom de l’ordenador es invalid';

  @override
  String get identityUsernameLabel => 'Causissètz un nom d’utilizaire';

  @override
  String get identityUsernameRequired => 'Un nom d’utilizaire es requerit';

  @override
  String get identityInvalidUsername => 'Lo nom d’utilizaire es requerit';

  @override
  String get identityUsernameInUse => 'Aqueste nom d’utilizaire existís ja.';

  @override
  String get identityUsernameSystemReserved =>
      'Aqueste nom es reservat per l’usatge del sistèma.';

  @override
  String get identityUsernameTooLong => 'Aqueste nom es tròp long.';

  @override
  String get identityUsernameInvalidChars =>
      'Aqueste nom conten de caractèrs invalids.';

  @override
  String get identityPasswordLabel => 'Causissètz un senhal';

  @override
  String get identityPasswordRequired => 'Un senhal es requerit';

  @override
  String get identityConfirmPasswordLabel => 'Confirmatz lo senhal';

  @override
  String get identityPasswordMismatch => 'Los senhals correspondon pas';

  @override
  String get identityPasswordShow => 'Mostrar';

  @override
  String get identityPasswordHide => 'Rescondre';

  @override
  String get identityActiveDirectoryOption => 'Utilizar Active Directory';

  @override
  String get identityActiveDirectoryInfo =>
      'Picaretz lo domeni e los autres detalhs a l’etapa que ven.';

  @override
  String get activeDirectoryTitle => 'Configurar Active Directory';

  @override
  String get activeDirectoryHeader => 'Volètz accedir a Active Directory ?';

  @override
  String activeDirectoryInfo(String DISTRO) {
    return '$DISTRO es concebut per s’integrar sens de manièra transparenta a Active Directory per una administracion mai facila.';
  }

  @override
  String get activeDirectoryTestConnection => 'Ensajar la connexion al domeni';

  @override
  String get activeDirectoryDomainLabel => 'Domeni';

  @override
  String get activeDirectoryDomainEmpty => 'Obligatòri';

  @override
  String get activeDirectoryDomainTooLong => 'Tròp long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Caractèrs invalids';

  @override
  String get activeDirectoryDomainStartDot => 'Comença per un ponch (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Termina per un ponch (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Comença per un jonhent (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Termina per un jonhent (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Conten mantun ponch (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domeni introbable';

  @override
  String get activeDirectoryAdminLabel =>
      'Nom d’utilizaire per rejónher lo domeni';

  @override
  String get activeDirectoryAdminEmpty => 'Obligatòri';

  @override
  String get activeDirectoryAdminInvalidChars => 'Caractèrs invalids';

  @override
  String get activeDirectoryPasswordLabel => 'Senhal';

  @override
  String get activeDirectoryPasswordEmpty => 'Obligatòri';

  @override
  String get activeDirectoryErrorTitle =>
      'Error en configurant la connexion a l’Active Directory';

  @override
  String get activeDirectoryErrorMessage =>
      'O planhèm, se pòt pas configurar Active Directory pel moment. Un còp lo sistèma operacional, consultatz <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> per d’ajuda.';

  @override
  String get networkPageTitle => 'Se connectar a un ret';

  @override
  String get networkPageHeader =>
      'Connectar aqueste ordenador a internet permetrà a Ubuntu d’installar de logicials suplementaris e de definir vòstre fus orari.\n\nConnectatz un cable Ethernet, o causissètz un ret Wifi';

  @override
  String get networkPageBody =>
      'Una connexion Internet melhorarà l’installacion amb la verificacion de compatibilitat e los paquets logicials addicionals.';

  @override
  String get networkWiredOption => 'Utilizar una connexion filara';

  @override
  String get networkWiredNone => 'Cap de connexion filara pas detectada';

  @override
  String get networkWiredOff => 'La connexion filara es desactivada';

  @override
  String get networkWiredDisabled =>
      'Per utilizar l’Ethernet sus aqueste ordenador, una connexion filara deu èsser activada';

  @override
  String get networkWiredEnable => 'Activar la connexion filara';

  @override
  String get networkWifiOption => 'Se connectar a un ret Wifi';

  @override
  String get networkWifiOff => 'Lo ret sens fial es desactivat';

  @override
  String get networkWifiNone => 'Cap de periferic Wifi pas detectat';

  @override
  String get networkWifiDisabled =>
      'Per utilizar lo Wifi sus aqueste ordenador, lo ret sens fial deu èsser activat';

  @override
  String get networkWifiEnable => 'Activar lo Wifi';

  @override
  String get networkHiddenWifiOption => 'Se connectar a una ret Wi-Fi amagada';

  @override
  String get networkHiddenWifiNameLabel => 'Nom de la ret';

  @override
  String get networkHiddenWifiNameRequired => 'Un nom de ret es requerit';

  @override
  String get networkNoneOption => 'Me vòli pas connectar a internet pel moment';

  @override
  String get eulaPageTitle => 'Acòrd de licéncia';

  @override
  String get eulaReviewTerms => 'Repassar los tèrmes de licéncia';

  @override
  String get eulaReadAndAcceptTerms =>
      'Per contunhar la configuracion d’aquesta maquina, devètz legir e acceptar los tèrmes de l’acòrd de la licéncia.';

  @override
  String get eulaAcceptTerms => 'Ai legit e accèpti aqueste tèrmes';

  @override
  String get successIconSemanticLabel => 'Success';
}
