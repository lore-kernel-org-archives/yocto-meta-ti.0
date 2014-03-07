Return-Path: <steve.jacot-guillarmod@swissdotnet.ch>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1lp0013.outbound.protection.outlook.com [213.199.154.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A454E009FC
	for <meta-ti@yoctoproject.org>; Thu,  6 Mar 2014 22:44:06 -0800 (PST)
Received: from AM3PR02MB033.eurprd02.prod.outlook.com (10.242.242.16) by
	AM3PR02MB228.eurprd02.prod.outlook.com (10.242.248.26) with Microsoft
	SMTP Server (TLS) id 15.0.893.10; Fri, 7 Mar 2014 06:44:03 +0000
Received: from AM3PR02MB033.eurprd02.prod.outlook.com ([169.254.4.45]) by
	AM3PR02MB033.eurprd02.prod.outlook.com ([169.254.4.190]) with mapi id
	15.00.0888.003; Fri, 7 Mar 2014 06:44:03 +0000
From: Steve Jacot-Guillarmod <steve.jacot-guillarmod@swissdotnet.ch>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: USB gadget with yocto>meta-ti
Thread-Index: Ac850F6yvC8e9KSASWyjJ90397c2dw==
Date: Fri, 7 Mar 2014 06:44:02 +0000
Message-ID: <9afd2ebb07d84f29a8e935ac9b5c8f57@AM3PR02MB033.eurprd02.prod.outlook.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.2.191.67]
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(199002)(189002)(479174003)(65816001)(575784001)(93516002)(95666003)(86362001)(74876001)(92566001)(76482001)(2656002)(54356001)(54316002)(53806001)(87936001)(93136001)(77096001)(81542001)(19580395003)(80976001)(74482001)(51856001)(95416001)(74366001)(80022001)(56776001)(87266001)(85306002)(31966008)(74316001)(83072002)(74662001)(94946001)(4396001)(94316002)(69226001)(74706001)(85852003)(97336001)(63696002)(56816005)(33646001)(76176001)(47736001)(49866001)(77982001)(90146001)(97186001)(79102001)(59766001)(83322001)(76576001)(19580405001)(76786001)(47976001)(76796001)(81686001)(46102001)(47446002)(74502001)(66066001)(81816001)(50986001)(81342001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR02MB228;
	H:AM3PR02MB033.eurprd02.prod.outlook.com; CLIP:62.2.191.67;
	FPR:8F5E616.AF2E5442.5470A1D5.1E2EC91.20285; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
received-spf: None (: swissdotnet.ch does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: swissdotnet.ch
Subject: USB gadget with yocto>meta-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 06:44:11 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm using Yocto (poky-dora-10.0.1) with [meta-ti] layer to create images fo=
r the Ti's AM335x EVM Starter Kit or a BBB (using kernel linux-ti-staging 3=
.12.10)
I'm trying to get the USB gadget working, but without success!=20

1st test - [g_mass_storage]
  modprobe g_mass_storage file=3D/dev/mmcblk0p1

[  246.227255] Number of LUNs=3D8
[  246.231310] Mass Storage Function, version: 2009/09/11
[  246.236803] LUN: removable file: (no medium)
[  246.241963] Number of LUNs=3D1
[  246.245323] LUN: file: /dev/mmcblk0p2
[  246.249218] Number of LUNs=3D1
[  246.253638] g_mass_storage gadget: Mass Storage Gadget, version: 2009/09=
/11
[  246.261122] g_mass_storage gadget: userspace failed to provide iSerialNu=
mber
[  246.268614] g_mass_storage gadget: g_mass_storage ready

My host PC detect the drive, but my OS (Win7) doesn't see the partition (di=
sk manager says Drive 4 49MB "not allocated")... very strange!

Now more important for us, the g_ether and g_serial (or g_multi)

root@am335x-evm:~# modprobe g_ether
[  857.663478] g_ether musb-hdrc.0.auto: failed to start g_ether: -2
modprobe: can't load module g_ether (kernel/drivers/usb/gadget/g_ether.ko):=
 unknown symbol in module, or unknown parameter

[  879.223249] g_serial musb-hdrc.0.auto: failed to start g_serial: -2
modprobe: can't load module g_serial (kernel/drivers/usb/gadget/g_serial.ko=
): unknown symbol in module, or unknown parameter

[  892.214224] g_multi musb-hdrc.0.auto: failed to start g_multi: -2
modprobe: can't load module g_multi (kernel/drivers/usb/gadget/g_multi.ko):=
 unknown symbol in module, or unknown parameter

Your help will be very welcome, this is an important feature for us. My goa=
l is to get an ethernet and storage gadget working (and if possible also a =
serial...)

Best regards

Steve Jacot-Guillarmod

