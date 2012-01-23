Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24434E0074A
	for <meta-ti@yoctoproject.org>; Mon, 23 Jan 2012 08:55:08 -0800 (PST)
Received: by wgbds10 with SMTP id ds10so1639321wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 23 Jan 2012 08:55:07 -0800 (PST)
Received: by 10.180.83.72 with SMTP id o8mr15516630wiy.22.1327337707754;
	Mon, 23 Jan 2012 08:55:07 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm9552500wib.0.2012.01.23.08.55.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 08:55:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201201231752.12060.schnitzeltony@gmx.de>
Date: Mon, 23 Jan 2012 17:55:07 +0100
Message-Id: <B6BB4942-0E12-4A95-A52E-10132586B5F2@dominion.thruhere.net>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
	<3E3A330E-A821-4CD4-A983-EE798CEF58DF@dominion.thruhere.net>
	<201201231752.12060.schnitzeltony@gmx.de>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/7] SGX recipe rework
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
X-List-Received-Date: Mon, 23 Jan 2012 16:55:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 jan. 2012, om 17:52 heeft Andreas M=FCller het volgende =
geschreven:

> On Monday, January 23, 2012 03:20:05 PM Koen Kooi wrote:
>> Op 23 jan. 2012, om 15:18 heeft Koen Kooi het volgende geschreven:
>>> This series reworks the packaging of the sgx recipes in the =
following
>>> ways:
>>>=20
>>> 1) all the es 'versions' are now subpackaged in to PN-foo-es<version =
and
>>> PN-foo RRECOMMENDS all of them 2) the DRI WS is now packaged as well
>>> 3) For recent SDKs the X11 WS is packaged, but nothing is done to =
shuffle
>>> the base libraries around 4) all the PN-foo subpackages remove
>>> /etc/powervr-esrev to trigger the relocation code 5) the initscript
>>> doesn't depend in the the 'initscripts' package anymore making use =
work
>>> in a systemd world as well as a sysvinit world.
>>>=20
>>> The most noticable effect is that user can now deinstall (e.g. using
>>> BAD_RECOMMENDATIONS) all the es 'versions' they don't need saving a =
few
>>> megabytes of space.
>>>=20
>>> Koen Kooi (7):
>>> libgles-omap3: split support for ES revisions into subpackages where
>>>=20
>>>   possible
>>>=20
>>> libgles-omap3: merge in updates from arago
>>> libgles-omap3: package DRI windowing system as well
>>> libgles-omap3: install X11 windowing system for newer SDK releases =
as
>>>=20
>>>   well
>>>=20
>>> libgles-omap3: adjust packaging for all windowing systems to remove
>>>=20
>>>   the magic esrev file
>>>=20
>>> omap3-sgx-modules: add 4.05.00.03
>>> libgles-omap3: add 4.05.00.03
>>=20
>> And you can find it as a git branch at
>> =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=

>> s/log/?h=3Dsgx-rework _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> I checked out that branch, build omap3-sgx-modules and get
>=20
> WARNING: /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
> gnueabi/omap3-sgx-modules-4.05.00.03-
> r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM/COPYING could not be copied =
for=20
> some reason. It may not exist. WARN for now.
> ERROR: Function failed: omap3-sgx-modules: LIC_FILES_CHKSUM points to =
an=20
> invalid file: =
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
> gnueabi/omap3-sgx-modules-4.05.00.03-
> r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM/COPYING
> ERROR: Logfile of failure stored in: /home/andreas/tmp/oe-core-
> eglibc/work/overo-angstrom-linux-gnueabi/omap3-sgx-modules-4.05.00.03-
> r115a/temp/log.do_configure.17459
> Log data follows:
> | NOTE: Checking autotools environment for common misconfiguration
> | ERROR: Function failed: omap3-sgx-modules: LIC_FILES_CHKSUM points =
to an=20
> invalid file: =
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
> gnueabi/omap3-sgx-modules-4.05.00.03-
> r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM/COPYING
> | + cd /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
> gnueabi/omap3-sgx-modules-4.05.00.03-
> r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM
> | + do_configure
> | + base_do_configure
> | + :
> NOTE: package omap3-sgx-modules-4.05.00.03-r115a: task do_configure: =
Failed
>=20
> The error is a bit different from [1] but reason is same: workdir only =
contains=20
> an empty folder GFX_Linux_KM.

Right, you need 32 bit libs installed for installjammer to work

> The error is different only because there are no=20
> more patches to apply. In do_unpack I see
>=20
> NOTE: Unpacking=20
> =
/home/andreas/data/Downloads/packets/dl/Graphics_SDK_setuplinux_4_05_00_03=
.bin=20
> to =
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-
> sgx-modules-4.05.00.03-r115a/
>=20
> Interesting: At console I moved into workdir and entered
> ./Graphics_SDK_setuplinux_4_05_00_03.bin -> nothing happened and I get =
return=20
> value 127. Is there some packet which needs installation on my build =
hosts?

On fedora: yum install glibc.i686

regards,

Koen=

