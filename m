Return-Path: <jdk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DA96E005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:27:42 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9Q5ReWP028711
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Oct 2011 00:27:41 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9Q5Re4r009108;
	Wed, 26 Oct 2011 00:27:40 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9Q5ReKQ011039;
	Wed, 26 Oct 2011 00:27:40 -0500 (CDT)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Wed, 26 Oct 2011 00:27:40 -0500
From: "Kridner, Jason" <jdk@ti.com>
To: Koen Kooi <koen@beagleboard.org>
Thread-Topic: [meta-ti] [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable
	usb-to-serial drivers
Thread-Index: AQHMk3ZQMcGjqeOzhUeiwejCH1rbk5WN/kq6gABmyQD//6+Blw==
Date: Wed, 26 Oct 2011 05:27:39 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3590B9C55@DFLE34.ent.ti.com>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>,
	<CB6184BC-17D4-43C4-8BBA-2945CD411452@dominion.thruhere.net>
In-Reply-To: <CB6184BC-17D4-43C4-8BBA-2945CD411452@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Fernandes,
	Joel A" <joelagnel@ti.com>
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 05:27:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for the top-post.  I've subscribed now with my @beagleboard.org accou=
nt as well, so after this e-mail, I should be able to use a slightly better=
 mail tool.=0A=
=0A=
Will udev or some other mechanism enable all of them to be loaded automatic=
ally?  Other than USB flash drives that might want to be used for rootfs, d=
o any of these other modules need to be compiled in?=0A=
=0A=
BTW, I verified that 'loadaddr=3D0x80007fc0' speeds up the boot process (av=
oids kernel copy).=0A=
=0A=
________________________________________=0A=
From: Koen Kooi [koen@beagleboard.org]=0A=
Sent: Wednesday, October 26, 2011 12:59 AM=0A=
To: Kridner, Jason=0A=
Cc: Fernandes, Joel A; meta-ti@yoctoproject.org=0A=
Subject: Re: [meta-ti] [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-t=
o-serial drivers=0A=
=0A=
Op 26 okt 2011, om 06:01 heeft Kridner, Jason het volgende geschreven:=0A=
=0A=
> Joel,=0A=
>=0A=
> This looks good to me.=0A=
>=0A=
> Can you also enable other types of USB host adapters?  We want to=0A=
> have a fairly exhaustive set, including just about every USB-to-=0A=
> serial adapter.=0A=
>=0A=
> I had been thinking that Koen has some mechanism where USB drivers=0A=
> are registered after boot based on this set of messages in the=0A=
> kernel bootlog:=0A=
>=0A=
> [    0.254977] usbcore: registered new interface driver catc=0A=
> [    0.254991] catc: v2.8:CATC EL1210A NetMate USB Ethernet driver=0A=
> [    0.255057] usbcore: registered new interface driver kaweth=0A=
> [    0.255074] pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB=0A=
> Ethernet driver=0A=
> [    0.255142] usbcore: registered new interface driver pegasus=0A=
> [    0.255157] rtl8150: v0.6.2 (2004/08/27):rtl8150 based usb-=0A=
> ethernet driver=0A=
> [    0.255233] usbcore: registered new interface driver rtl8150=0A=
> [    0.255299] usbcore: registered new interface driver asix=0A=
> [    0.255366] usbcore: registered new interface driver cdc_ether=0A=
> [    0.255433] usbcore: registered new interface driver dm9601=0A=
> [    0.255500] usbcore: registered new interface driver cdc_subset=0A=
> [    0.255566] usbcore: registered new interface driver zaurus=0A=
> [    0.255623] cdc_ncm: 04-Aug-2011=0A=
> [    0.255693] usbcore: registered new interface driver cdc_ncm=0A=
> [    0.255817] usbcore: registered new interface driver cdc_acm=0A=
> [    0.255831] cdc_acm: USB Abstract Control Model driver for USB=0A=
> modems and ISDN adapters=0A=
> [    0.255927] usbcore: registered new interface driver usblp=0A=
> [    0.255997] usbcore: registered new interface driver cdc_wdm=0A=
>=0A=
> However, looking at the defconfig, it seems these are just set as Y,=0A=
> the same as you have done.=0A=
=0A=
All those usb ethernet drivers and usb serial drivers should be made=0A=
modules. That will also shrink the uImage size a bit :)=0A=
=0A=
regards,=0A=
=0A=
Koen=0A=

