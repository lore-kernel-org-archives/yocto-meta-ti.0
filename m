Return-Path: <joshua.marinacci@nokia.com>
Received: from mgw-da01.nokia.com (smtp.nokia.com [147.243.128.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4ECE9E00288
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 17:31:27 -0700 (PDT)
Received: from vaebh105.NOE.Nokia.com (in-mx.nokia.com [10.160.244.31])
	by mgw-da01.nokia.com (Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with
	ESMTP id q6V0VCDR032181; Tue, 31 Jul 2012 03:31:13 +0300
Received: from smtp.mgd.nokia.com ([65.54.30.24]) by vaebh105.NOE.Nokia.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 31 Jul 2012 03:31:58 +0300
Received: from 008-AM1MPN1-072.mgdnok.nokia.com ([169.254.2.76]) by
	008-AM1MMR1-008.mgdnok.nokia.com ([65.54.30.24]) with mapi id
	14.02.0283.004; Tue, 31 Jul 2012 02:31:11 +0200
From: <joshua.marinacci@nokia.com>
To: <denys@ti.com>
Thread-Topic: [meta-ti] Gumstix Wifi
Thread-Index: AQHNbPdyKck16OkwMUiNLuyywd/NZpdBWVuAgAC5HQCAAAjfgIAAUMMA
Date: Tue, 31 Jul 2012 00:31:10 +0000
Message-ID: <1DDA99E7-9D0B-42DF-977F-EC15832B6795@nokia.com>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
	<CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
	<40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
	<20120730194207.GA23003@edge>
In-Reply-To: <20120730194207.GA23003@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [97.125.57.15]
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Jul 2012 00:31:58.0484 (UTC)
	FILETIME=[E50FED40:01CD6EB3]
X-Nokia-AV: Clean
Cc: meta-ti@yoctoproject.org
Subject: Re: Gumstix Wifi
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
X-List-Received-Date: Tue, 31 Jul 2012 00:31:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <160E34C7FBEEEE409AC42D465E9B88D7@mgd.nokia.com>
Content-Transfer-Encoding: quoted-printable

ah, that explains it then.

Okay, so I've made a bit more progress. I added some more packages to my bu=
ild my appending this to my build/conf/local.conf

CORE_IMAGE_EXTRA_INSTALL +=3D "wpa-supplicant"
CORE_IMAGE_EXTRA_INSTALL +=3D "wireless-tools"
#CORE_IMAGE_EXTRA_INSTALL +=3D "resolveconf"
CORE_IMAGE_EXTRA_INSTALL +=3D "openssl"
CORE_IMAGE_EXTRA_INSTALL +=3D "zeroconf"
CORE_IMAGE_EXTRA_INSTALL +=3D "modutils-initscripts"
CORE_IMAGE_EXTRA_INSTALL +=3D "update-modules"


This gives me depmod and the rest.  Now I can manually load drivers and dep=
mod -a succeeds.  However, I still can't activate the wlan0.   ifup wlan0 g=
ives me

root@overo:~# ifup wlan0
Could not read interface wlan0 flags: No such device
WEXT: Could not set interface 'wlan0' UP
wlan0: Failed to initialize driver interface

On a hunch I looked at /var/log/messages and it says near the end:


Jul 30 23:17:03 overo user.info kernel: libertas_sdio: Libertas SDIO driver
Jul 30 23:17:03 overo user.info kernel: libertas_sdio: Copyright Pierre Oss=
man
Jul 30 23:17:03 overo user.err kernel: libertas_sdio: failed to find firmwa=
re (-2)


You mentioned the firmware. Where do I get that?


Incidentally, I don't get all of the kernel boot messages when my gumstix b=
oots.  It says=20

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

Yocto (Built by Poky 7.0) 1.2+snapshot-20120730 overo ttyO2

overo login:


And then I'm at the login prompt.  I'm assuming there is some boot setting =
which controls this? All of the messages are showing up in /var/log/message=
s, however.

Thanks,

 Josh


On Jul 30, 2012, at 12:42 PM, ext Denys Dmytriyenko wrote:

> On Mon, Jul 30, 2012 at 07:10:23PM +0000, joshua.marinacci@nokia.com wrot=
e:
>> Hmm. I don't see to have depmod installed.  Perhaps that is part of my=20
>> problem. What package would I need to add to the minimal-core-image to g=
et=20
>> that?
>=20
> Josh,
>=20
> core-image-minimal uses busybox for tools like insmod and modprobe. The=20
> default configuration for busybox does not have depmod enabled. As of=20
> module-init-tools, they are being built, but not installed on the filesys=
tem.=20
> So, you can either modify busybox config to enable depmod, or add=20
> module-init-tools-depmod package to your filesystem. The new way is to us=
e=20
> kmod, which is available in oe-core master, or meta-oe in denzil. But oe-=
core=20
> master setup is broken for me at the moment, so I can't verify that kmod =
is=20
> included. At least it's not listed in the image/task...
>=20
> Denys
>=20
>=20
>> On Jul 30, 2012, at 1:07 AM, ext Enrico wrote:
>>=20
>>> On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
>>>> This does work. When I boot the wpa stuff is included but I still don'=
t have a network driver loaded.  If I include the built modules-3.2.19-r0-o=
vero.tgz in my rootfs I can cd into the directory with all of the modules. =
 However insmod libertas.ko fails with
>>>>=20
>>>>       insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in mod=
ule, or unknown parameter
>>>>=20
>>>> and modprobe fails with
>>>>=20
>>>>       modprobe: module libertas not found in modules.dep
>>>>=20
>>>>=20
>>>> So, what should I do to make sure the libertas module is compiled corr=
ectly, included in my kernel, and then actually used at runtime?
>>>=20
>>> try with "depmod -a" (this must be done only once after you untar the
>>> modules) before modprobe libertas.
>>>=20
>>> I am not sure but i think it was "modprobe libertas_sdio", try that
>>> too. And of course you will need the libertas firmware
>>> (sd8686....bin).
>>>=20
>>> Enrico
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


