Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A917E005B9
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  8 Dec 2011 08:34:27 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qcsf13 with SMTP id f13so1666987qcs.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 08 Dec 2011 08:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=h1bESQTILofIuT7C6YLHwNi/fyFUvtL2inHGmgbGbus=;
	b=nY8faKEE8TxVeWUh2jkC9oAZwzVpdURleqNhTmQuCgtv86DfDDrNJULlqi6bKoqMa8
	mkrbmdUy7raU41ijZ2WcxUQnbZAH9cgxoVs0fAxnf0HjQjHXg+5EtxQnXcmoQkkwl+Kj
	At6quy/jbfiipitsr3yTG7DKQxEkWwAhJxHKs=
MIME-Version: 1.0
Received: by 10.229.46.4 with SMTP id h4mr987592qcf.188.1323362066088; Thu, 08
	Dec 2011 08:34:26 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 8 Dec 2011 08:34:26 -0800 (PST)
In-Reply-To: <999FD5FD-6566-4A36-A1B3-37E98EB8D735@dominion.thruhere.net>
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXkeKBdeEjdQ8K6pEv0SNp_QdT+gemvBkujY7TRbFCFAvQ@mail.gmail.com>
	<999FD5FD-6566-4A36-A1B3-37E98EB8D735@dominion.thruhere.net>
Date: Thu, 8 Dec 2011 09:34:26 -0700
Message-ID: <CA+M6bXk+OSfgfdffryw_MdZbP2MAX3vnJw4XtEZsRQF8peu68g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot 2011.09: add pandaboard support
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
X-List-Received-Date: Thu, 08 Dec 2011 16:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 8:55 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> Op 7 dec. 2011, om 16:38 heeft Tom Rini het volgende geschreven:
>> On Wed, Dec 7, 2011 at 7:42 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> =A0recipes-bsp/u-boot/u-boot_2011.09.bb | =A0 =A09 ++++++---
>>> =A01 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/=
u-boot_2011.09.bb
>>> index 74c8518..955bd5e 100644
>>> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
>>> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
>>> @@ -8,9 +8,9 @@ UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
>>> =A0UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
>>>
>>> =A0# No patches for other machines yet
>>> -COMPATIBLE_MACHINE =3D "(beagleboard)"
>>> +COMPATIBLE_MACHINE =3D "(beagleboard|omap4430-panda)"
>>>
>>> -SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>>> +SRC_URI_pn-${PN}_beagleboard =3D "git://www.denx.de/git/u-boot.git;pro=
tocol=3Dgit \
>>> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0001-omap3-mem-Comment-enable_gpm=
c_cs_config-more.patch \
>>> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0002-OMAP3-Update-SDRC-dram_init-=
to-always-call-make_cs1_.patch \
>>> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0003-OMAP3-Add-a-helper-function-=
to-set-timings-in-SDRC.patch \
>>> @@ -35,7 +35,10 @@ SRC_URI =3D "git://www.denx.de/git/u-boot.git;protoc=
ol=3Dgit \
>>> =A0 =A0 =A0 =A0 =A0 =A0file://fw_env.config \
>>> =A0 =A0 =A0 =A0 =A0 "
>>>
>>> -SRCREV =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
>>> +SRCREV_pn-${PN}_beagleboard =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a=
0e3"
>>> +
>>> +SRC_URI_pn-${PN}_omap4430-panda =3D "git://git.linaro.org/boot/u-boot-=
linaro-stable.git"
>>> +SRCREV_pn-${PN}_omap4430-panda =3D "3d343a62b8240100d6ce76b9126ff1e97b=
e1eb5f"
>>>
>>> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a=
5651ecb"
>>
>> On the beagle rev, what doesn't work for pandaboard? =A0And/or, what
>> doesn't work on pandaboard on u-boot git mainline? =A02011.12 is near
>> and that will have the Beagle SPL patches and I'd like to say it's
>> safe for pandas too.
>
> U-Boot SPL 2011.09-01433-g01baa05 (Dec 08 2011 - 16:49:37)
> Texas Instruments OMAP4460 ES1.1
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.09-01433-g01baa05 (Dec 08 2011 - 16:49:37)
>
> CPU =A0: OMAP4460 ES1.1
> Board: OMAP4 Panda
> I2C: =A0 ready
> DRAM: =A01 GiB
> MMC: =A0 OMAP SD/MMC: 0
> Using default environment
>
> In: =A0 =A0serial
> Out: =A0 serial
> Err: =A0 serial
> Hit any key to stop autoboot: =A00
> reading boot.scr
>
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
>
> 4079360 bytes read
> Booting from mmc0 ...
> ## Booting kernel from Legacy Image at 82000000 ...
> =A0 Image Name: =A0 Angstrom/2.6.35.7/omap4430-panda
> =A0 Image Type: =A0 ARM Linux Kernel Image (uncompressed)
> =A0 Data Size: =A0 =A04079296 Bytes =3D 3.9 MiB
> =A0 Load Address: 80008000
> =A0 Entry Point: =A080008000
> =A0 Verifying Checksum ... OK
> =A0 Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> So mainline works, I'll wait for 2011.12 final and move beagle, panda, cr=
ane, hawk to that. What's the state of TI EVMs in mainline?

AM3517EVM and OMAP3EVM are also good and SPL'd.  Mainline isn't yet
appropriate for am335x evm nor beaglebone.

--=20
Tom

