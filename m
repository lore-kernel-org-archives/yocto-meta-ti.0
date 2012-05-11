Return-Path: <cliff.brake@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CD2FE0044A
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 04:10:54 -0700 (PDT)
Received: by lboj14 with SMTP id j14so2484449lbo.35
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Udo0fLzWdBGIDCQt/iCNx764UHuF4LRYgn5vV+WYG8A=;
	b=UCv5fDheLWIBTtL/lOydhwTQWuCdNO7ckyirTVQCDZimTYgfcQtWR0JQMUUlOzgD0/
	+e5i4JE/VyV9x06Lv94tjNzHuCaL12XnRezhFoyO23EDo9UaqdummVGE6czSnMwVRmxc
	nafrgZzwnzVqTxn79XK2vPNGVzldwgNXdgHfURZ28KfdMdI9LFqOMUotR9nGrzt8CB9j
	ZH204wdzhDg3kXN9unUK/4QadlxZz98kzxe6hI+ijFql0tutp978CtUNjN9qco4JDlT4
	eG43+8bp5YRSnrU1qkyt84sPdLgZPgLSAJKfl8GdsANVWpn77eabjfE+6ViuOFcQAYUj
	uPgA==
MIME-Version: 1.0
Received: by 10.112.26.10 with SMTP id h10mr3466852lbg.79.1336734653647; Fri,
	11 May 2012 04:10:53 -0700 (PDT)
Received: by 10.112.5.231 with HTTP; Fri, 11 May 2012 04:10:53 -0700 (PDT)
In-Reply-To: <20120511044725.GC26492@denix.org>
References: <1336686499-29891-1-git-send-email-cliff.brake@gmail.com>
	<20120511044725.GC26492@denix.org>
Date: Fri, 11 May 2012 07:10:53 -0400
Message-ID: <CAOd_LFwCH3aCuNsUnX1JHWEyNKVREqdoNAiBZrWLWmevqNsHeQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: add directory prefix to patch URIs
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
X-List-Received-Date: Fri, 11 May 2012 11:10:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Denys,

Thanks for the clarification -- I made the mistake of thinking the
meta-ti master was on Github (saw it there when Angstrom moved).

https://github.com/Angstrom-distribution/meta-ti

I notice now at the top of the above page, it says it is a mirror, but
it may be a good idea to mention in the README where the master repo
is to avoid confusion.

Thanks,
Cliff

On Fri, May 11, 2012 at 12:47 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> Cliff,
>
> Thanks for the patch. But it is already the case of proper paths being us=
ed in
> the recipe:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/diff/recipes-bsp/u-boot=
/u-boot_2011.12.bb?id=3D07913cca6cfd7f35a9bb5d6b2cca41c6b5f07ec3
>
> diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-=
boot_2011.12.bb
> index 9616a05..45c64a6 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.12.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
> @@ -6,7 +6,7 @@ UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
> =A0UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
>
> =A0PV =3D "2011.12"
> -PR =3D "r7"
> +PR =3D "r8"
>
> =A0# No patches for other machines yet
> =A0COMPATIBLE_MACHINE =3D "(beagleboard|pandaboard|hawkboard|am3517-evm|a=
m37x-evm|omap3evm)"
> @@ -30,6 +30,9 @@ SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=
=3Dgit \
> =A0 =A0 =A0 =A0 =A0 =A0${CACHEFIX} \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.12/0009-Beagleboard-Correct-memory-siz=
e-on-rev-C4.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offse=
t-mask.patch \
> + =A0 =A0 =A0 =A0 =A0 file://2011.12/0011-ext2load-increase-read-speed.pa=
tch \
> + =A0 =A0 =A0 =A0 =A0 file://2011.12/0012-ext4fs-ls-load-support.patch \
> + =A0 =A0 =A0 =A0 =A0 file://2011.12/0013-beagleboard-switch-mmcroots-to-=
ext4.patch \
> =A0 =A0 =A0 =A0 =A0 =A0${FWENV} \
> =A0 =A0 =A0 =A0 =A0 "
>
> Did you happen to pick an intermediate version from Koen's WIP tree on gi=
thub?
> That's not how it was submitted and eventually went into the official tre=
e.
> Sorry for confusion.
>
> --
> Denys
>
>
> On Thu, May 10, 2012 at 05:48:19PM -0400, Cliff Brake wrote:
>> From: Cliff Brake <cbrake@bec-systems.com>
>>
>>
>> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
>> ---
>> =A0recipes-bsp/u-boot/u-boot_2011.12.bb | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u=
-boot_2011.12.bb
>> index 39f77bd..45c64a6 100644
>> --- a/recipes-bsp/u-boot/u-boot_2011.12.bb
>> +++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
>> @@ -30,9 +30,9 @@ SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=
=3Dgit \
>> =A0 =A0 =A0 =A0 =A0 =A0 ${CACHEFIX} \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://2011.12/0009-Beagleboard-Correct-memory-s=
ize-on-rev-C4.patch \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://2011.12/0010-OMAP3-Correct-get_sdr_cs_off=
set-mask.patch \
>> - =A0 =A0 =A0 =A0 =A0 file://0011-ext2load-increase-read-speed.patch \
>> - =A0 =A0 =A0 =A0 =A0 file://0012-ext4fs-ls-load-support.patch \
>> - =A0 =A0 =A0 =A0 =A0 file://0013-beagleboard-switch-mmcroots-to-ext4.pa=
tch \
>> + =A0 =A0 =A0 =A0 =A0 file://2011.12/0011-ext2load-increase-read-speed.p=
atch \
>> + =A0 =A0 =A0 =A0 =A0 file://2011.12/0012-ext4fs-ls-load-support.patch \
>> + =A0 =A0 =A0 =A0 =A0 file://2011.12/0013-beagleboard-switch-mmcroots-to=
-ext4.patch \
>> =A0 =A0 =A0 =A0 =A0 =A0 ${FWENV} \
>> =A0 =A0 =A0 =A0 =A0 =A0"
>>
>> --
>> 1.7.1
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com

