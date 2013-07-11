Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DFDFE013D6
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 10:13:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6BHD9sH024846
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 12:13:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6BHD9Ah018710
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 12:13:09 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 11 Jul 2013 12:13:08 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [master & danny][PATCH 2/2 v2] u-boot: Add memory
	alignment fix for armv7 for am37x and am3517
Thread-Index: AQHOfNaLqAaJzmGWlUCJ8ghx2OpmiplgDakA//+sfmU=
Date: Thu, 11 Jul 2013 17:13:08 +0000
Message-ID: <587C890B-E2B1-4B66-8668-A237CB41BE30@ti.com>
References: <1373397456-967-1-git-send-email-fcooper@ti.com>,
	<20130711171202.GI18647@edge>
In-Reply-To: <20130711171202.GI18647@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master & danny][PATCH 2/2 v2] u-boot: Add memory alignment fix for armv7 for am37x and am3517
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
X-List-Received-Date: Thu, 11 Jul 2013 17:13:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes :)

On Jul 11, 2013, at 12:12 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> Quick question: you said danny and master - don't you need it in dylan as=
=20
> well?
>=20
> On Tue, Jul 09, 2013 at 02:17:36PM -0500, Franklin S. Cooper Jr wrote:
>> * On am335x a memory alignment issue was found when using the Linaro too=
lchain.
>> * A similar patch was applied for am335x that fixed this well documented=
 issue.
>> * Add a similar fix to am37x and am3517 since this is a generic armv7 is=
sue.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>>=20
>> Version 2 changes:
>> Place patch in a single generic directory
>>=20
>> recipes-bsp/u-boot/u-boot-am3517_2011.09.bb        |    6 ++-
>> recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb      |    3 ++
>> .../u-boot/0001-armv7-Unaligned-access-fix.patch   |   30 ++++++++++++++=
++++++
>> 3 files changed, 37 insertions(+), 2 deletions(-)
>> create mode 100644 recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access=
-fix.patch
>>=20
>> diff --git a/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb b/recipes-bsp/u=
-boot/u-boot-am3517_2011.09.bb
>> index 6321406..06b8cf1 100644
>> --- a/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
>> +++ b/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
>> @@ -6,9 +6,11 @@ COMPATIBLE_MACHINE =3D "omap3"
>>=20
>> DEFAULT_PREFERENCE =3D "-1"
>>=20
>> -PR =3D "r0+gitr${SRCPV}"
>> +PR =3D "r1+gitr${SRCPV}"
>>=20
>> -SRC_URI =3D "git://arago-project.org/git/projects/u-boot-am33x.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
>> +SRC_URI =3D "git://arago-project.org/git/projects/u-boot-am33x.git;prot=
ocol=3Dgit;branch=3D${BRANCH} \
>> +           file://0001-armv7-Unaligned-access-fix.patch \
>> +"
>>=20
>> BRANCH =3D "AM335XPSP_04.06.00.08"
>>=20
>> diff --git a/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb b/recipes-bsp=
/u-boot/u-boot-am37x_2012.04.01.bb
>> index c25cf1e..1cd96b6 100644
>> --- a/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
>> @@ -6,6 +6,8 @@ COMPATIBLE_MACHINE =3D "am37x-evm|beagleboard"
>>=20
>> BRANCH ?=3D "master"
>>=20
>> +PR =3D "r1+gitr${SRCPV}"
>> +
>> # v2012.04.01
>> SRCREV =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"
>>=20
>> @@ -33,6 +35,7 @@ SRC_URI +=3D "file://0001-omap3_beagle-add-usbethaddr-=
setting-to-enable-networ.pat
>>             file://0002-omap3evm-Make-the-board-start-at-800MHz.patch \
>>             file://0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch \
>>             file://0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54K=
B.patch \
>> +            file://0001-armv7-Unaligned-access-fix.patch \
>>             "
>>=20
>> SPL_BINARY =3D "MLO"
>> diff --git a/recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.p=
atch b/recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.patch
>> new file mode 100644
>> index 0000000..35307ac
>> --- /dev/null
>> +++ b/recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.patch
>> @@ -0,0 +1,30 @@
>> +From 40f1e7db785f477a2aa145a3b47bd498c48ad52d Mon Sep 17 00:00:00 2001
>> +From: Steve Kipisz <s-kipisz2@ti.com>
>> +Date: Fri, 14 Jun 2013 05:16:52 -0500
>> +Subject: [PATCH] armv7:Unaligned access fix
>> +
>> +This fixes an unaligned access data abort introduced when using gcc 4.7
>> +or higher. The Linaro toolchain uses gcc 4.7.3. This is documented in u=
-boot
>> +doc/README.arm-unaligned-accesses.
>> +
>> +Signed-off-by: Steve Kipisz <s-kipisz2@ti.com>
>> +---
>> + arch/arm/cpu/armv7/config.mk |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/arch/arm/cpu/armv7/config.mk b/arch/arm/cpu/armv7/config.m=
k
>> +index 9c3e2f3..9736da8 100644
>> +--- a/arch/arm/cpu/armv7/config.mk
>> ++++ b/arch/arm/cpu/armv7/config.mk
>> +@@ -20,7 +20,7 @@
>> + # Foundation, Inc., 59 Temple Place, Suite 330, Boston,
>> + # MA 02111-1307 USA
>> + #
>> +-PLATFORM_RELFLAGS +=3D -fno-common -ffixed-r8 -msoft-float
>> ++PLATFORM_RELFLAGS +=3D -fno-common -ffixed-r8 -msoft-float -mno-unalig=
ned-access
>> +=20
>> + # If armv7-a is not supported by GCC fall-back to armv5, which is
>> + # supported by more tool-chains
>> +--=20
>> +1.7.9.5
>> +
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

