Return-Path: <jdk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07AEDE005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 21:01:42 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9Q41fuS006754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:01:41 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9Q41flp013220
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:01:41 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9Q41fMT027487
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:01:41 -0500 (CDT)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Tue, 25 Oct 2011 23:01:41 -0500
From: "Kridner, Jason" <jdk@ti.com>
To: "Fernandes, Joel A" <joelagnel@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial
	drivers
Thread-Index: AQHMk3ZQMcGjqeOzhUeiwejCH1rbk5WN/kq6
Date: Wed, 26 Oct 2011 04:01:40 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
In-Reply-To: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Oct 2011 21:19:02 -0700
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
X-List-Received-Date: Wed, 26 Oct 2011 04:01:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Joel,=0A=
=0A=
This looks good to me.=0A=
=0A=
Can you also enable other types of USB host adapters?  We want to have a fa=
irly exhaustive set, including just about every USB-to-serial adapter.=0A=
=0A=
I had been thinking that Koen has some mechanism where USB drivers are regi=
stered after boot based on this set of messages in the kernel bootlog:=0A=
=0A=
[    0.254977] usbcore: registered new interface driver catc=0A=
[    0.254991] catc: v2.8:CATC EL1210A NetMate USB Ethernet driver=0A=
[    0.255057] usbcore: registered new interface driver kaweth=0A=
[    0.255074] pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB Ethern=
et driver=0A=
[    0.255142] usbcore: registered new interface driver pegasus=0A=
[    0.255157] rtl8150: v0.6.2 (2004/08/27):rtl8150 based usb-ethernet driv=
er=0A=
[    0.255233] usbcore: registered new interface driver rtl8150=0A=
[    0.255299] usbcore: registered new interface driver asix=0A=
[    0.255366] usbcore: registered new interface driver cdc_ether=0A=
[    0.255433] usbcore: registered new interface driver dm9601=0A=
[    0.255500] usbcore: registered new interface driver cdc_subset=0A=
[    0.255566] usbcore: registered new interface driver zaurus=0A=
[    0.255623] cdc_ncm: 04-Aug-2011=0A=
[    0.255693] usbcore: registered new interface driver cdc_ncm=0A=
[    0.255817] usbcore: registered new interface driver cdc_acm=0A=
[    0.255831] cdc_acm: USB Abstract Control Model driver for USB modems an=
d ISDN adapters=0A=
[    0.255927] usbcore: registered new interface driver usblp=0A=
[    0.255997] usbcore: registered new interface driver cdc_wdm=0A=
=0A=
However, looking at the defconfig, it seems these are just set as Y, the sa=
me as you have done.  Just wondering if you had any clarity to add to that =
with ideas on how we can make the kernel smaller for a fast boot while stil=
l handling more devices.  I hate for people to have to reconfigure the kern=
el just because we didn't compile something useful into it.=0A=
=0A=
Regards,=0A=
Jason=0A=
________________________________________=0A=
From: Fernandes, Joel A=0A=
Sent: Tuesday, October 25, 2011 8:13 PM=0A=
To: meta-ti@yoctoproject.org=0A=
Cc: Fernandes, Joel A; Kridner, Jason=0A=
Subject: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drive=
rs=0A=
=0A=
Enable the PL2303 usb-to-serial driver required for serial output=0A=
from the beaglebone tester.=0A=
=0A=
Signed-off-by: Joel A Fernandes <joelagnel@ti.com>=0A=
---=0A=
 .../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig |    3 ++-=0A=
 recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    2 +-=0A=
 2 files changed, 3 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defc=
onfig b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig=
=0A=
index 4b3c21d..478ec3e 100644=0A=
--- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig=
=0A=
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig=
=0A=
@@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=3Dy=0A=
 # USB port drivers=0A=
 #=0A=
 # CONFIG_USB_USS720 is not set=0A=
-# CONFIG_USB_SERIAL is not set=0A=
+CONFIG_USB_SERIAL=3Dy=0A=
+CONFIG_USB_SERIAL_PL2303=3Dy=0A=
=0A=
 #=0A=
 # USB Miscellaneous drivers=0A=
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb b/recipes-ke=
rnel/linux/linux-ti33x-psp_3.0+3.1rc.bb=0A=
index bffebea..fbee01f 100644=0A=
--- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb=0A=
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb=0A=
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX =3D ""=0A=
=0A=
 BRANCH =3D "master"=0A=
 SRCREV =3D "1955a86594526e18f03c8d62db81119ffc4ccf0f"=0A=
-MACHINE_KERNEL_PR_append =3D "k+gitr${SRCREV}"=0A=
+MACHINE_KERNEL_PR_append =3D "l+gitr${SRCREV}"=0A=
=0A=
 COMPATIBLE_MACHINE =3D "(ti33x)"=0A=
=0A=
--=0A=
1.7.0.4=0A=
=0A=

