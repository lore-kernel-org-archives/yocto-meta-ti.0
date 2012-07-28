Return-Path: <joshua.marinacci@nokia.com>
Received: from mgw-da02.nokia.com (smtp.nokia.com [147.243.128.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D5CFE013EB
	for <meta-ti@yoctoproject.org>; Sat, 28 Jul 2012 12:30:45 -0700 (PDT)
Received: from vaebh104.NOE.Nokia.com (vaebh104.europe.nokia.com
	[10.160.244.30])
	by mgw-da02.nokia.com (Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with
	ESMTP id q6SJUhiv017401
	for <meta-ti@yoctoproject.org>; Sat, 28 Jul 2012 22:30:44 +0300
Received: from smtp.mgd.nokia.com ([65.54.30.56]) by vaebh104.NOE.Nokia.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Sat, 28 Jul 2012 22:31:27 +0300
Received: from 008-AM1MPN1-072.mgdnok.nokia.com ([169.254.2.76]) by
	008-AM1MMR1-001.mgdnok.nokia.com ([65.54.30.56]) with mapi id
	14.02.0283.004; Sat, 28 Jul 2012 21:30:29 +0200
From: <joshua.marinacci@nokia.com>
To: <meta-ti@yoctoproject.org>
Thread-Topic: Gumstix Wifi
Thread-Index: AQHNbPdyKck16OkwMUiNLuyywd/NZg==
Date: Sat, 28 Jul 2012 19:30:29 +0000
Message-ID: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [97.125.57.15]
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Jul 2012 19:31:27.0540 (UTC)
	FILETIME=[94F4B740:01CD6CF7]
X-Nokia-AV: Clean
Subject: Gumstix Wifi
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 19:30:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3228E8B2E9F41E4C9DB4E58F7A7A57BA@mgd.nokia.com>
Content-Transfer-Encoding: quoted-printable

Hi guys. After becoming very frustrated with Gumstix' prefab images I came =
to the  Yocto presentation at OSCON a week ago and was very impressed.  I'v=
e started building a distro for my Gumstix Overo but have ran into a few ro=
adblocks that I'm hoping you can help with.

First, I started with the latest Yocto, meta-gumstix and meta-ti from git a=
nd I can successfully compile and boot core-image-minimal.  Of course that =
doesn't have networking. =20

Next, I tried running Hob to add networking packages.  Hob does not seem to=
 work with meta-ti.  I can launch but when I add the meta-ti layer and choo=
se a machine it fails with "ExpansionError during parsing %s:%s".  Of cours=
e it is not helpful in providing which file the parsing error was in. :)

Next, I tried simply adding  wpa_supplicant to the image by adding this lin=
e to my local.conf and compiling from the command line.

CORE_IMAGE_EXTRA_INSTALL +=3D "wpa-supplicant"


This does work. When I boot the wpa stuff is included but I still don't hav=
e a network driver loaded.  If I include the built modules-3.2.19-r0-overo.=
tgz in my rootfs I can cd into the directory with all of the modules.  Howe=
ver insmod libertas.ko fails with=20

	insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in module, or un=
known parameter

and modprobe fails with

	modprobe: module libertas not found in modules.dep


So, what should I do to make sure the libertas module is compiled correctly=
, included in my kernel, and then actually used at runtime?

Thank you all for your help. I'm very excited about the Yocto project.

- Josh=

