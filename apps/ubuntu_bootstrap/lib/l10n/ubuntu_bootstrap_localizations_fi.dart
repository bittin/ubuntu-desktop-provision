import 'ubuntu_bootstrap_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class UbuntuBootstrapLocalizationsFi extends UbuntuBootstrapLocalizations {
  UbuntuBootstrapLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Ubuntun työpöytäversion asennusohjelma';

  @override
  String windowTitle(String RELEASE) {
    return 'Asenna $RELEASE';
  }

  @override
  String get autoinstallDirectTitle => 'Automated installation';

  @override
  String get autoinstallDirectHeader => 'Import autoinstall file';

  @override
  String get autoinstallDirectUrlLabel => 'You can enter the URL of an autoinstall file:';

  @override
  String get autoinstallDirectFileLabel => 'Or select a local file:';

  @override
  String get autoinstallDirectFileButtonLabel => 'Select file...';

  @override
  String get autoinstallDirectFileClearButtonLabel => 'Clear file';

  @override
  String get autoinstallDirectFilePickerTitle => 'Choose file';

  @override
  String get autoinstallDirectFilePickerFilterLabel => 'YAML files';

  @override
  String get autoinstallDirectImportButtonLabel => 'Import';

  @override
  String get autoinstallDirectErrorNetworkTitle => 'Autoinstall file is not reachable';

  @override
  String get autoinstallDirectErrorNetworkBody => 'Check the URL is correct, test your internet connection, or try later.';

  @override
  String get autoinstallDirectErrorInvalidUrlTitle => 'Invalid URL';

  @override
  String get autoinstallDirectErrorInvalidUrlBody => 'Check the URL is correct or select a local file.';

  @override
  String get autoinstallDirectErrorInvalidContentTitle => 'Invalid autoinstall file';

  @override
  String get autoinstallDirectErrorInvalidContentBody => 'Check the file or provide a different one.';

  @override
  String get autoinstallDirectErrorFileSystemTitle => 'Autoinstall file is not readable';

  @override
  String get autoinstallDirectErrorFileSystemBody => 'Check your permissions or provide a different file.';

  @override
  String get autoinstallDirectErrorUnkownTitle => 'Unknown error';

  @override
  String get autoinstallTitle => 'Asennuksen tyyppi';

  @override
  String autoinstallHeader(String DISTRO) {
    return 'Miten haluat asentaa ${DISTRO}n?';
  }

  @override
  String get autoinstallInstructions => 'Kirjoita autoinstall.yaml-tiedoston verkko-osoite tai paikallinen polku:';

  @override
  String get autoinstallInteractiveOption => 'Vuorovaikutteinen asennus';

  @override
  String get autoinstallInteractiveDescription => 'Käyttäjille, jotka haluvat vaiheittaisesti opastetun asennuksen.';

  @override
  String get autoinstallDirectOption => 'Automated with autoinstall file';

  @override
  String get autoinstallDirectDescription => 'For advanced users who have an autoinstall.yaml for consistent and repeatable system setups.';

  @override
  String get autoinstallLandscapeOption => 'Automated with Landscape';

  @override
  String get autoinstallLandscapeDescription => 'For users in organizations that provide an autoinstall file via Landscape.';

  @override
  String get changeButtonText => 'Muuta';

  @override
  String get quitButtonText => 'Lopeta asennus';

  @override
  String loadingPageTitle(String DISTRO) {
    return 'Tervetuloa, tämä on $DISTRO';
  }

  @override
  String loadingHeader(String DISTRO) {
    return 'Valmistellaan ${DISTRO}a…';
  }

  @override
  String get warningLabel => 'Varoitus:';

  @override
  String tryOrInstallTitle(String DISTRO) {
    return 'Kokeile tai asenna ${DISTRO}a';
  }

  @override
  String tryOrInstallHeader(String DISTRO) {
    return 'Mitä haluat tehdä ${DISTRO}lla?';
  }

  @override
  String get tryOrInstallRepairOption => 'Korjaa asennus';

  @override
  String get tryOrInstallRepairDescription => 'Korjaus asentaa kaikki ohjelmat uudelleen, asiakirjat ja asetukset säilytetään.';

  @override
  String tryOption(String RELEASE) {
    return 'Kokeile ${RELEASE}a';
  }

  @override
  String tryDescription(String RELEASE) {
    return 'Voit kokeilla ${RELEASE}a tekemättä muutoksia tietokoneeseen.';
  }

  @override
  String installOption(String RELEASE) {
    return 'Asenna $RELEASE';
  }

  @override
  String installDescription(String RELEASE) {
    return 'Asenna $RELEASE nykyisen käyttöjärjestelmän rinnalle tai tilalle. Asentaminen ei kestä kauan.';
  }

  @override
  String tryOrInstallReleaseNotesLabel(String url) {
    return 'Voit halutessasi lukea <a href=\"$url\">julkaisumuistion</a>.';
  }

  @override
  String get rstTitle => 'RST on käytössä';

  @override
  String get rstHeader => 'Poista RST käytöstä jatkaaksesi';

  @override
  String get rstDisable => 'Your computer uses Intel RST (Rapid Storage Technology). You can disable RST either in:';

  @override
  String get rstDisableWindows => 'Windows, if you are using a dual boot setup with Windows';

  @override
  String get rstDisableBios => 'The BIOS settings';

  @override
  String rstInstructions(String url) {
    return 'Lue ohjeet skannaamalla QR-koodi tai käy toisella laitteella: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get configureSecureBootTitle => 'Määritä Secure Boot';

  @override
  String get configureSecureBootDescription => 'Valitsit kolmansien osapuolten ajurien asennuksen. Tämä vaatii että Secure Boot tulee määrittää.\nTämä vaatii, että valitset turva-avaimen nyt ja kirjoitat sen järjestelmän käynnistyessä uudelleen.';

  @override
  String get configureSecureBootOption => 'Määritä Secure Boot';

  @override
  String get chooseSecurityKey => 'Valitse salausavain';

  @override
  String get confirmSecurityKey => 'Vahvista salausavain';

  @override
  String get dontInstallDriverSoftwareNow => 'Älä asenna ajureita toistaiseksi';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Voit asentaa ne myöhemmin Ohjelmistot ja päivitykset -sovelluksessa.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Salausavain vaaditaan';

  @override
  String get secureBootSecurityKeysDontMatch => 'Salausavaimet eivät täsmää';

  @override
  String get showSecurityKey => 'Näytä';

  @override
  String get hideSecurityKey => 'Piilota';

  @override
  String get updatesOtherSoftwarePageTitle => 'Sovellukset';

  @override
  String get updatesOtherSoftwarePageDescription => 'Millä sovelluksilla haluat aloittaa?';

  @override
  String get codecsAndDriversPageTitle => 'Optimoi tietokoneesi';

  @override
  String get codecsAndDriversPageDescription => 'Asennetaanko suositellut käytöltään rajoitetut ohjelmistot?';

  @override
  String codecsAndDriversPageBody(String DISTRO) {
    return '$DISTRO ei sisällä oletuksena rajoitettuja tai suljetun lähdekoodin ohjelmistoja. Lisäohjelmistojen asentaminen saattaa parantaa tietokoneen suorituskykyä.';
  }

  @override
  String get codecsAndDriversNvidiaNote => 'NVIDIA:n näytönohjain havaittu';

  @override
  String get codecsAndDriversNvidiaBody => 'Lisäajureiden asentamista suositellaan, jotta NVIDIA:n näytönohjaimesta saadaan paras mahdollinen suorituskyky.';

  @override
  String get fullInstallationTitle => 'Laajennettu valikoima';

  @override
  String get fullInstallationSubtitle => 'Yhteydettömään tilaan soveltuva kokoelma toimisto-ohjelmistoja, työkaluja, verkkoselain ja pelejä.';

  @override
  String get minimalInstallationTitle => 'Oletusasennus';

  @override
  String get minimalInstallationSubtitle => 'Vain tarpeellinen, verkkoselain ja perustyökalut.';

  @override
  String get otherOptions => 'Muut valinnat';

  @override
  String get installThirdPartyTitle => 'Asenna kolmannen osapuolen ohjelmistot näytönohjainta ja wifi-laitteistoa sekä eri mediamuotoja varten';

  @override
  String get installThirdPartySubtitle => 'Näihin ohjelmistoihin kohdistuvat dokumentaation mukana olevat lisenssiehdot. Jotkin voivat olla suljetun lähdekoodin ohjelmistoja.';

  @override
  String get installDriversTitle => 'Asenna kolmannen osapuolen ohjelmistot näytönohjainta ja wifi-laitteistoa varten';

  @override
  String get installDriversSubtitle => 'Sisältäen mutta ei rajoittuen NVIDIA-ajurit ja vastaavat';

  @override
  String get installCodecsTitle => 'Lataa ja asenna tuki eri mediamuotoja varten';

  @override
  String get installCodecsSubtitle => 'Sisältäen mutta ei rajoittuen MP3, MP4, MOV ja vastaavat';

  @override
  String get batteryWarning => 'Tämä tietokone ei ole liitetty virtalähteeseen.';

  @override
  String get offlineWarning => 'Et ole yhteydessä verkkoon';

  @override
  String get choosePassphraseTitle => 'Levyn tunnuslause';

  @override
  String get choosePassphraseHeader => 'Luo tunnuslause';

  @override
  String get choosePassphraseBody => 'Tarvitset tunnuslauseen salataksesi tiedostosi. Tunnuslause tulee kirjoittaa joka kerta, kun tietokone käynnistetään.';

  @override
  String get choosePassphraseHint => 'Valitse tunnuslause';

  @override
  String get choosePassphraseConfirmHint => 'Vahvista tunnuslause';

  @override
  String get choosePassphraseRequired => 'Tunnuslause on pakollinen';

  @override
  String get choosePassphraseMismatch => 'Tunnuslauseet eivät vastaa toisiaan';

  @override
  String get choosePassphraseInfoHeader => 'Varmista, että talletat tunnuslauseen';

  @override
  String get choosePassphraseInfoBody => 'Jos unohdat tai kadotat tunnuslauseen, menetät pääsyn dataan.';

  @override
  String get chooseOptionalPassphraseHeader => 'Create a passphrase (optional)';

  @override
  String get chooseOptionalPassphraseBody => 'A passphrase can help protect your data even if your hardware gets compromised. You will need to enter the passphrase every time you turn on your computer. You will not be able to remove it later';

  @override
  String get chooseOptionalPassphraseInfoHeader => 'Store your passphrase and recovery key somewhere safe';

  @override
  String get chooseOptionalPassphraseInfoBody => 'If you lose your passphrase, you will lose all your data. The passphrase does not replace the recovery key or your user password.';

  @override
  String get createPassphrase => 'Luo tunnuslause';

  @override
  String get confirmPassphrase => 'Vahvista tunnuslause';

  @override
  String get installationTypeTitle => 'Levyasetukset';

  @override
  String installationTypeHeader(String DISTRO) {
    return 'Miten haluat asentaa ${DISTRO}n?';
  }

  @override
  String installationTypeOSDetected(String os) {
    return 'Tässä tietokoneessa on tällä hetkellä asennettuna käyttöjärjestelmä \"$os\". Mitä haluat tehdä?';
  }

  @override
  String installationTypeDualOSDetected(String os1, String os2) {
    return 'Tässä tietokoneessa on jo käyttöjärjestelmät $os1 ja $os2. Mitä haluat tehdä?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Tässä tietokoneessa on jo useita käyttöjärjestelmiä. Mitä haluat tehdä?';

  @override
  String get installationTypeNoOSDetected => 'Tässä tietokoneessa ei havaittu asennettuja käyttöjärjestelmiä. Mitä haluat tehdä?';

  @override
  String installationTypeErase(String DISTRO) {
    return 'Tyhjennä levy ja asenna $DISTRO';
  }

  @override
  String get installationTypeEraseInfo => 'Aloita tyhjästä valitsemallasi levyllä.';

  @override
  String get installationTypeAdvancedLabel => 'Edistyneet asetukset...';

  @override
  String get installationTypeAdvancedTitle => 'Edistyneet asetukset';

  @override
  String get installationTypeExperimental => 'Kokeellinen';

  @override
  String get installationTypeNone => 'Ei mitään';

  @override
  String get installationTypeNoneInfo => 'Standard file system without encryption.';

  @override
  String get installationTypeNoneSelected => 'Ei valintoja';

  @override
  String get installationTypeLVM => 'Käytä LVM:ää';

  @override
  String get installationTypeLVMSelected => 'LVM valittu';

  @override
  String get installationTypeLVMEncryption => 'Käytä LVM:ää ja salausta';

  @override
  String get installationTypeLVMEncryptionInfo => 'You will need to enter a passphrase every time you turn on your computer. This uses LUKS encryption with LVM.';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM ja salaus valittu';

  @override
  String get installationTypeEncryptInfo => 'Salausavain valitaan seuraavassa vaiheessa.';

  @override
  String get installationTypeZFS => 'Tyhjennä levy ja käytä ZFS:ää';

  @override
  String get installationTypeZFSEncryption => 'Tyhjennä levy ja käytä ZFS:ää sekä salausta';

  @override
  String get installationTypeZFSEncryptionInfo => 'Native encryption with ZFS. You will need to enter a passphrase every time you turn on your computer.';

  @override
  String get installationTypeZFSSelected => 'ZFS valittu';

  @override
  String get installationTypeZFSEncryptionSelected => 'ZFS ja salaus valittu';

  @override
  String get installationTypeTPM => 'Käytä laitteistopohjaista koko levyn salausta';

  @override
  String installationTypeTPMInfo(String DISTRO, String url) {
    return 'Tämä on kokeellinen ominaisuus. Se ei välttämättä toimi laitteistollasi tai tulevissa $DISTRO-jakeluissa. <a href=\"$url\">Lue TPM-salauksesta</a>, ennen kuin valitset tämän.';
  }

  @override
  String get installationTypeTPMSelected => 'TPM valittu';

  @override
  String installationTypeReinstall(String os) {
    return 'Poista $os ja asenna uudelleen';
  }

  @override
  String installationTypeReinstallWarning(String color, String os) {
    return '<font color=\"$color\">Varoitus:</font> Tämä poistaa kaikki käyttäjärjestelmän \"$os\" sovellukset, asiakirjat, valokuvat, musiikit ja muut tiedostot.';
  }

  @override
  String installationTypeAlongside(String product, String os) {
    return 'Asenna $product käyttöjärjestelmän \"$os\" rinnalle';
  }

  @override
  String installationTypeAlongsideDual(String product, String os1, String os2) {
    return 'Asenna $product käyttöjärjestelmien $os1 ja $os2 rinnalle';
  }

  @override
  String installationTypeAlongsideMulti(String product) {
    return 'Asenna $product niiden rinnalle';
  }

  @override
  String installationTypeAlongsideUnknown(String product) {
    return 'Asenna $product muiden osioiden rinnalle';
  }

  @override
  String installationTypeAlongsideInfo(String product) {
    return 'Voit valita käyttöjärjestelmän käynnistettäessä.';
  }

  @override
  String installationTypeEraseAndInstall(String os, String product) {
    return 'Erase $os and install $product';
  }

  @override
  String installationTypeEraseAndInstallInfo(String os) {
    return 'All files and data from the existing $os installation will be permanently deleted.';
  }

  @override
  String get installationTypeManual => 'Manuaalinen asennus';

  @override
  String installationTypeManualInfo(String DISTRO) {
    return 'Edistyneille käyttäjille, jotka haluavat mukauttaa levymäärityksiä.';
  }

  @override
  String selectGuidedStoragePageTitle(String DISTRO) {
    return 'Tyhjennä levy ja asenna $DISTRO';
  }

  @override
  String get selectGuidedStorageInfo => 'Aloita tyhjästä valitsemallasi levyllä.';

  @override
  String get selectGuidedStorageDriveDropdownLabel => 'Valitse asema:';

  @override
  String get selectGuidedStoragePartitionDropdownLabel => 'Valitse osio:';

  @override
  String get selectGuidedStorageInfoLabel => 'Koko levy käytetään:';

  @override
  String get selectGuidedStorageInstallNow => 'Asenna nyt';

  @override
  String guidedStoragePageHeader(String DISTRO) {
    return 'Valitse mihin $DISTRO asennetaan';
  }

  @override
  String get installAlongsideSpaceDivider => 'Varaa levytilaa raahaamalla alla olevaa erotinta:';

  @override
  String installAlongsideHiddenPartitions(int num, String url) {
    return '$num pienempää osiota on piilotettu, käytä <a href=\"$url\">edistynyttä osiointityökalua</a> saadaksesi lisää toiminnallisuuksia';
  }

  @override
  String get installAlongsideResizePartition => 'Muuta osion kokoa';

  @override
  String get installAlongsideAllocateSpace => 'Varaa tilaa';

  @override
  String get installAlongsideFiles => 'Tiedostot';

  @override
  String get installAlongsidePartition => 'Osio:';

  @override
  String get installAlongsideSize => 'Koko:';

  @override
  String get installAlongsideAvailable => 'Saatavilla:';

  @override
  String get allocateDiskSpace => 'Manuaalinen osiointi';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Liitospisteiden tulee alkaa merkillä \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Liitospisteet eivät voi sisältää välilyöntejä';

  @override
  String allocateDiskSpaceInvalidMountPointFormat(Object format, Object mountpoint) {
    return '$format is not a supported filesystem for $mountpoint';
  }

  @override
  String get diskHeadersDevice => 'Laite';

  @override
  String get diskHeadersType => 'Tyyppi';

  @override
  String get diskHeadersMountPoint => 'Liitoskohta';

  @override
  String get diskHeadersSize => 'Koko';

  @override
  String get diskHeadersUsed => 'Käytössä';

  @override
  String get diskHeadersSystem => 'Järjestelmä';

  @override
  String get diskHeadersFormat => 'Alusta';

  @override
  String get freeDiskSpace => 'Vapaata tilaa';

  @override
  String get newPartitionTable => 'Uusi osiotaulu';

  @override
  String get newPartitionTableConfirmationTitle => 'Uusi tyhjä osio';

  @override
  String get newPartitionTableConfirmationMessage => 'Uuden osiotaulun luominen koko laitteelle poistaa kaikki laitteen nykyiset levyosiot. Voit perua tämän toimenpiteen, jos haluat.';

  @override
  String get tooManyPrimaryPartitions => 'Liian monta ensisijaista osiota';

  @override
  String get partitionLimitReached => 'Raja saavutettu';

  @override
  String get bootLoaderDevice => 'Laite, jolle alkulatausohjelma asennetaan';

  @override
  String get partitionCreateTitle => 'Luo osio';

  @override
  String get partitionEditTitle => 'Muokkaa osiota';

  @override
  String get partitionSizeLabel => 'Koko:';

  @override
  String get partitionTypeLabel => 'Uuden osion tyyppi:';

  @override
  String get partitionTypePrimary => 'Ensisijainen';

  @override
  String get partitionTypeLogical => 'Looginen';

  @override
  String get partitionLocationLabel => 'Uuden osion paikka:';

  @override
  String get partitionLocationBeginning => 'Tilan alku';

  @override
  String get partitionLocationEnd => 'Tilan loppu';

  @override
  String get partitionFormatLabel => 'Käytetään kohteena:';

  @override
  String get partitionFormatNone => 'Jätä alustamatta';

  @override
  String partitionFormatKeep(String format) {
    return 'Jätä alustetuksi muotoon $format';
  }

  @override
  String get partitionErase => 'Alusta osio';

  @override
  String get partitionMountPointLabel => 'Liitoskohta:';

  @override
  String get confirmPageTitle => 'Valmis asennukseen';

  @override
  String get confirmHeader => 'Tarkista valintasi';

  @override
  String get confirmDiskEncryptionLVM => 'LUKS (LVM)';

  @override
  String get confirmDiskEncryptionZFS => 'LUKS (ZFS)';

  @override
  String get confirmDiskEncryptionTPM => 'TPM';

  @override
  String get confirmDiskEncryptionNone => 'Ei mitään';

  @override
  String get confirmDevicesTitle => 'Laitteet';

  @override
  String get confirmEntryApplications => 'Sovellukset';

  @override
  String get confirmEntryDiskSetup => 'Levymääritys';

  @override
  String get confirmEntryDiskEncryption => 'Levyn salaus';

  @override
  String get confirmEntryInstallationDisk => 'Asennuslevy';

  @override
  String get confirmEntryProprietarySoftware => 'Suljetun lähdekoodin ohjelmistot';

  @override
  String get confirmSectionGeneralTitle => 'Yleiset';

  @override
  String get confirmSectionSecurityAndMoreTitle => 'Tietoturva ja muu';

  @override
  String get confirmPartitionsTitle => 'Osiot';

  @override
  String get confirmPartitionTables => 'Seuraavien laitteiden osiotauluja on muutettu:';

  @override
  String confirmPartitionTable(String serial, String path) {
    return '$serial ($path)';
  }

  @override
  String get confirmProprietarySoftwareCodecs => 'Koodekit';

  @override
  String get confirmProprietarySoftwareCodecsDrivers => 'Koodekit ja ajurit';

  @override
  String get confirmProprietarySoftwareDrivers => 'Ajurit';

  @override
  String get confirmInstallButton => 'Asenna';

  @override
  String get confirmTableErased => 'Erased';

  @override
  String get confirmTableUnchanged => 'Unchanged';

  @override
  String confirmTableResized(String oldsize, String newsize) {
    return 'Resized from $oldsize to $newsize';
  }

  @override
  String confirmTableCreatedFormattedMounted(String format, String mountpoint) {
    return 'Created and formatted as $format used for $mountpoint';
  }

  @override
  String confirmTableFormattedMounted(String format, String mountpoint) {
    return 'Formatted as $format used for $mountpoint';
  }

  @override
  String confirmTableMounted(String mountpoint) {
    return 'Used for $mountpoint';
  }

  @override
  String confirmTableFormatted(String format) {
    return 'Formatted as $format';
  }

  @override
  String get installationCompleteTitle => 'Asennus on valmis';

  @override
  String readyToUse(String system) {
    return '$system on asennettu ja valmis käytettäväksi';
  }

  @override
  String rebootToConfigure(String system) {
    return '**$system** on kopioitu levylle';
  }

  @override
  String restartInto(String system) {
    return 'Käynnistä uudelleen käyttöjärjestelmään \"$system\"';
  }

  @override
  String get restartWarningBody => 'Käynnistä uudelleen viimeistelläksesi asennuksen tai jatka testaamista.\nTekemiäsi muutoksia ei tallenneta.';

  @override
  String get rebootToConfigureWarning => 'Tietokone tulee käynnistää uudelleen, jotta asennusta voidaan jatkaa.';

  @override
  String get shutdown => 'Sammuta';

  @override
  String get restartNow => 'Käynnistä uudelleen nyt';

  @override
  String get continueTesting => 'Jatka testaamista';

  @override
  String get bitlockerInfoTitle => 'BitLocker detected';

  @override
  String get bitlockerInfoDescription => 'One or more partitions are encrypted with BitLocker.';

  @override
  String get bitlockerInfoDisable => 'To install alongside Windows, disable BitLocker in Windows.';

  @override
  String get bitlockerInfoRecovery => 'Windows may request recovery keys on boot after installation.';

  @override
  String bitlockerInfoInstructions(String url) {
    return 'For instructions, visit the <a href=\"$url\">BitLocker guide</a>.';
  }

  @override
  String get bitlockerWarningTitle => 'You may lose all your data without BitLocker recovery keys';

  @override
  String get restartComputer => 'Restart computer';

  @override
  String get restartComputerTitle => 'Restart computer?';

  @override
  String get restartIntoWindows => 'Uudelleenkäynnistä Windowsiin';

  @override
  String get restartIntoWindowsTitle => 'Käynnistetäänkö uudelleen Windowsiin?';

  @override
  String restartIntoWindowsDescription(String DISTRO) {
    return 'Haluatko varmasti käynnistää tietokoneen uudelleen? Sinun tulee käynnistää uudelleen $DISTRO-asennusohjelma, jotta voit viimeistellä ${DISTRO}n asennuksen.';
  }

  @override
  String installationSlidesTitle(String RELEASE) {
    return 'Tervetuloa, tämä on $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Saatavilla:';

  @override
  String get installationSlidesIncluded => 'Sisältyy:';

  @override
  String get installationSlidesWelcomeTitle => 'Nopea, ilmainen ja täynnä uusia ominaisuuksia';

  @override
  String installationSlidesWelcomeHeader(String DISTRO) {
    return '${DISTRO}n uusin versio tekee tietojenkäsittelystä helpompaa kuin koskaan aiemmin.';
  }

  @override
  String installationSlidesWelcomeBody(String RELEASE) {
    return 'Oletpa sitten kehittäjä, sisällöntuottaja, pelaaja tai ylläpitäjä, $RELEASE:n uudet työkalut parantavat tuottavuuttasi ja kokemustasi.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Kaikki tarvitsemasi sovellukset';

  @override
  String installationSlidesSoftwareBody(String DISTRO) {
    return 'Asenna, hallitse ja päivitä sovelluksia Ubuntun sovelluskaupasta, mukaan lukien tuhansia sovelluksia Snap-sovelluskaupasta ja ${DISTRO}n arkistosta.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Kehitä avoimen lähdekoodin parhailla välineillä';

  @override
  String installationSlidesDevelopmentBody(String DISTRO) {
    return '$DISTRO on erinomainen valinta sovellus- tai web-kehitykseen, datatieteisiin, AI-/ML-työskentelyyn sekä devopsiin ja ylläpitotehtäviin. Jokainen $DISTRO-julkaisu sisältää uusimmat työkalut sekä tuen keskeisimmille sovelluskehitysympäristöille.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Paranna luovuuttasi';

  @override
  String installationSlidesCreativityBody(String DISTRO) {
    return 'Jos olet animaattori, suunnittelija, videokäsittelijä tai pelikehittäjä, työnkulkujesi tuominen ${DISTRO}un on helppoa avoimen lähdekoodin ja alan standardisovellusten tuen myötä.';
  }

  @override
  String get installationSlidesGamingTitle => 'Mainio pelaamiseen';

  @override
  String installationSlidesGamingBody(String DISTRO) {
    return '$DISTRO tukee uusimpia NVIDIA- ja Mesa-ajureita suorituskyvyn sekä yhteensopivuuden takaamiseksi. Tuhannet Windows-pelit toimivat erinomaisesti ${DISTRO}lla Steamin kaltaisten sovellusten avulla ilman ylimääräistä säätämistä.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Yksityinen ja turvallinen';

  @override
  String installationSlidesSecurityBody(String DISTRO) {
    return '$DISTRO tarjoaa kaikki tarvitsemasi työkalut, jotta pysyt verkossa yksityisenä ja turvassa. Sisäänrakennettu palomuuri ja VPN-tuki sekä yksityisyyteen keskittyvät sovellukset varmistavat, että hallitset itse omia tietojasi.';
  }

  @override
  String installationSlidesSecurityLts(String DISTRO) {
    return 'Kaikki $DISTRO LTS -julkaisut sisältävät viiden vuoden tietoturvatuen, Ubuntu Pro -tilauksella tietoturvatuki on laajennettavissa kymmeneen vuoteen.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Kiihdytä tuottavuuttasi';

  @override
  String installationSlidesProductivityBody(String DISTRO) {
    return '${DISTRO}n työpöytäversio sisältää LibreOfficen, kokoelman Microsoft Office -yhteensopivia avoimen lähdekoodin sovelluksia asiakirjojen, taulukoiden ja esitysten kanssa työskentelyyn. Myös muita yhteistyön mahdollistavia sovelluksia on saatavilla.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Esteetön kaikille';

  @override
  String installationSlidesAccessibilityBody(String DISTRO) {
    return '${DISTRO}n filosofian ytimessä on usko siihen, että tietokoneiden käyttö sopii kaikille. Tämän takia $DISTRO tarjoaa erilaisia mukauttamismahdollisuuksia ollakseen mahdollisimman helppokäyttöinen. Tarjolla ovat muun muassa edistyneet esteettömyystoiminnot sekä lukuisat valinnaiset kirjasimet, väriteemat ja kielet.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca-näytönlukija';

  @override
  String get installationSlidesAccessibilityLanguages => 'Kielituki';

  @override
  String get installationSlidesSupportTitle => 'Ohjeet ja tuki';

  @override
  String installationSlidesSupportHeader(String DISTRO) {
    return 'Virallinen $DISTRO-dokumentaatio on saatavilla verkossa ja telakan Ohje-kuvaketta napsauttamalla.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu -palvelu sisältää lukuisia kysymyksiä sekä vastauksia, ja Ubuntu Discourse tarjoaa ohjeita sekä keskusteluja niin uusille kuin vanhoillekin käyttäjille.';

  @override
  String get installationSlidesSupportEnterprise => 'Yrityskäyttäjille Canonical tarjoaa kaupallista tukea, jotta Ubuntu pysyy hallittavissa ja turvallisena työympäristössä.';

  @override
  String get installationSlidesSupportResources => 'Hyödyllisiä resursseja:';

  @override
  String get installationSlidesSupportDocumentation => 'Virallinen dokumentaatio';

  @override
  String get installationSlidesSupportUbuntuPro => 'Yritystason 24/7-tuki Ubuntu Pro -tilauksella';

  @override
  String get copyingFiles => 'Kopioidaan tiedostoja…';

  @override
  String get installingSystem => 'Asennetaan järjestelmää…';

  @override
  String get configuringSystem => 'Määritetään järjestelmää…';

  @override
  String get installationFailed => 'Asennus epäonnistui';

  @override
  String get notEnoughDiskSpaceTitle => 'Levytilaa ei ole riittävästi';

  @override
  String notEnoughDiskSpaceUbuntu(String DISTRO) {
    return 'Tilaa ei ole riittävästi, jotta $DISTRO olisi mahdollista asentaa';
  }

  @override
  String notEnoughDiskSpaceBody(String DISTRO) {
    return 'Valitula levylla ei ole riittävästi tilaa ${DISTRO}n asentamiseen. Poistu asennusohjelmasta ja vapauta tilaa, tai valitse toinen levy.';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Saatavilla:';

  @override
  String get notEnoughDiskSpaceRequired => 'Vaadittu:';

  @override
  String get refreshPageTitle => 'Päivitys saatavilla';

  @override
  String get refreshHeader => 'Asennusohjelmaan on saatavilla päivitys';

  @override
  String get refreshUpdateNow => 'Päivitä nyt';

  @override
  String get refreshInfo => 'Päivitä uusimpaan versioon entistä paremman luotettavuuden ja lisäominaisuuksien vuoksi.';

  @override
  String get refreshReady => 'Päivitys valmistui';

  @override
  String refreshCurrent(String snap, String version) {
    return 'Nykyinen $snap-versio on $version.';
  }

  @override
  String refreshInstall(String version) {
    return 'Päivitä versioon $version';
  }

  @override
  String refreshUpToDate(String version) {
    return 'Nykyinen versio $version on ajan tasalla.';
  }

  @override
  String refreshUpdating(String snap) {
    return 'Päivitetään $snap...';
  }

  @override
  String get refreshRestart => 'Sulje asennusohjelma ja käynnistä uudelleen jatkaaksesi';

  @override
  String get refreshCloseLabel => 'Sulje asennusohjelma';

  @override
  String refreshSnapPrerequisites(String snap) {
    return 'Varmistetaan snapin $snap edellytyksiä...';
  }

  @override
  String refreshSnapRefresh(String snap) {
    return 'Päivitetään $snap...';
  }

  @override
  String refreshSnapCheckRerefresh(String snap) {
    return 'Tarkistetaan $snap uudelleenpäivitys...';
  }

  @override
  String refreshSnapPrepare(String snap) {
    return 'Valmistellaan $snap...';
  }

  @override
  String refreshSnapDownload(String snap) {
    return 'Ladataan $snap...';
  }

  @override
  String refreshSnapValidate(String snap) {
    return 'Vahvistetaan $snap...';
  }

  @override
  String refreshSnapMount(String snap) {
    return 'Liitetään $snap...';
  }

  @override
  String refreshSnapStopServices(String snap) {
    return 'Pysäytetään $snap-palvelut...';
  }

  @override
  String refreshSnapRemoveAliases(String snap) {
    return 'Poistetaan $snap-aliakset...';
  }

  @override
  String refreshSnapUnlink(String snap) {
    return 'Poistetaan snapin $snap linkitys...';
  }

  @override
  String refreshSnapUpdateAssets(String snap) {
    return 'Päivitetään snapin $snap resurssit...';
  }

  @override
  String refreshSnapUpdateKernelCommandLine(String snap) {
    return 'Päivitetään snapin $snap ytimen komentorivi...';
  }

  @override
  String refreshSnapCopyData(String snap) {
    return 'Kopioidaan snapin $snap dataa...';
  }

  @override
  String refreshSnapSetupProfiles(String snap) {
    return 'Asetetaan snapin $snap tietoturvaprofiileja...';
  }

  @override
  String refreshSnapLink(String snap) {
    return 'Linkitetään $snap...';
  }

  @override
  String refreshSnapAutoConnect(String snap) {
    return 'Yhdistetään snapin $snap pistokkeet ja liittimet...';
  }

  @override
  String refreshSnapSetAutoAliases(String snap) {
    return 'Asetetaan automaattisia $snap-aliaksia...';
  }

  @override
  String refreshSnapSetupAliases(String snap) {
    return 'Asetetaan $snap-aliaksia...';
  }

  @override
  String refreshSnapStartServices(String snap) {
    return 'Käynnistetään $snap-palveluja...';
  }

  @override
  String refreshSnapCleanup(String snap) {
    return 'Siivotaan $snap...';
  }

  @override
  String get recoveryKeyTitle => 'TPM-palautusavain';

  @override
  String get recoveryKeyHeader => 'Get a recovery key';

  @override
  String get recoveryKeyInfoHeader => 'You may lose all your data without a recovery key';

  @override
  String recoveryKeyInfoBody(String distro) {
    return 'Get a recovery key as soon as you first log into $distro and store it somewhere safe.';
  }

  @override
  String get recoveryKeyCommand => 'Pääset palautusavaimeesi asennuksen jälkeen seuraavalla komennolla:';

  @override
  String get recoveryKeyStorageAdvice => 'Store the recovery key somewhere safe. Use it to decrypt the disk in case of certain system changes. For example, you may need it if you change the components in your computer or update firmware.';

  @override
  String get recoveryKeyConfirmation => 'I understand I may lose all my data if I don\'t have a recovery key';

  @override
  String get recoveryKeyLinkLabel => 'Learn more';

  @override
  String landscapeMagicAttachInstructions(Object url) {
    return 'Scan the QR code or enter the code below at <a href=\"https://$url\">$url</a>';
  }

  @override
  String get landscapePageTitle => 'Automated installation';

  @override
  String get landscapeHeader => 'Log in to Landscape';

  @override
  String get landscapeDomainHeader => 'Enter Landscape domain (FQDN)';

  @override
  String get landscapeDomainHintText => 'Landscape domain (FQDN)';

  @override
  String get landscapeDomainInstructions => 'Provide your organization\'s Landscape domain to log in and fetch an autoinstall file. You can get the FQDN from your IT support.';

  @override
  String get landscapeDomainTextField => 'Landscape domain (FQDN)';

  @override
  String get next => 'Next';

  @override
  String get landscapeDomainInvalidDomainWarning => 'Invalid domain, please check or contact your IT support';

  @override
  String get landscapeDomainNoInternetTitleWarning => 'Connect to the internet to continue';

  @override
  String get landscapeDomainNoInternetDescriptionWarning => 'Internet is needed to fetch the autoinstall file from Landscape';

  @override
  String get landscapeCodeExpiredWarning => 'Code expired, please try again';

  @override
  String get landscapeLoginFailedWarning => 'Login failed, please try again';

  @override
  String get landscapeErrorPageTitle => 'Automated install is not available for your account';

  @override
  String get landscapeErrorPageBody => 'Contact your IT support or try a different installation option.';

  @override
  String landscapeErrorPageCode(String code) {
    return 'Error code: $code';
  }

  @override
  String get landscapeConfirmPageSuccessInfoTitle => 'Ubuntu will install with the configuration provided by your organization';

  @override
  String get landscapeConfirmPageSuccessInfoContent => 'You can review the autoinstall file imported from Landscape below.';
}
