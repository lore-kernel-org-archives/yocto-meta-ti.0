Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C59BDE0078E; Mon, 11 Aug 2014 18:13:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D492E004F2
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 18:13:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7C1D46s030397
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 20:13:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7C1D4e0026876
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 20:13:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Mon, 11 Aug 2014 20:13:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: Updated staging tree
	commit. Pull in am57x evm support
Thread-Index: AQHPtcb79RejBCvcFkGt1ok30jP765vMexYA//+ufTg=
Date: Tue, 12 Aug 2014 01:13:03 +0000
Message-ID: <5BA53001-76E4-4796-9C3A-FDB4D282054B@ti.com>
References: <1407804439-24568-1-git-send-email-fcooper@ti.com>,
	<20140812010448.GD23523@edge>
In-Reply-To: <20140812010448.GD23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: Updated staging tree commit. Pull in am57x evm support
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
X-List-Received-Date: Tue, 12 Aug 2014 01:13:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Lol. Well either patch works for me although in your patch it would be nice=
 to limit the dtb for am57 evm to a single dtb.

> On Aug 11, 2014, at 8:04 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
> Heh, I was doing the same update here... Was testing my changes when you =
sent=20
> it.
>=20
>> On Mon, Aug 11, 2014 at 07:47:19PM -0500, Franklin S. Cooper Jr wrote:
>> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>>=20
>> * Update the commit of the 3.14 staging tree.
>> * Add support for accelerated cryptos on am335x/am437x.
>> * Adds HDMI audio support for Beaglebone Black
>> * Brings in am57x evm support.
>> * This also updates the base kernel to 3.14.16.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> recipes-kernel/linux/linux-ti-staging_3.14.bb |    7 ++++---
>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-ker=
nel/linux/linux-ti-staging_3.14.bb
>> index 6088bee..37e6259 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
>> @@ -29,7 +29,8 @@ KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evm=
sk.dtb am335x-bone.dtb am335
>> KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb"
>> KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-boneblack.dtb"
>> KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
>> -KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb"
>> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb am57xx-beagle-x15.dtb"
>> +KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb"
>> KERNEL_DEVICETREE_omap3 =3D "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-=
evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
>> KERNEL_DEVICETREE_am3517-evm =3D "am3517-evm.dtb"
>> KERNEL_DEVICETREE_am37x-evm =3D "omap3-evm-37xx.dtb"
>> @@ -43,8 +44,8 @@ S =3D "${WORKDIR}/git"
>>=20
>> BRANCH =3D "ti-linux-3.14.y"
>>=20
>> -SRCREV =3D "780f0589876618911eb9cd7ad5a83db249ad1638"
>> -PV =3D "3.14.15"
>> +SRCREV =3D "8f69b4c2243fb3b0d85fd2a0b575d5170d53dbea"
>> +PV =3D "3.14.16"
>>=20
>> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
>> MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>> --=20
>> 1.7.9.5
>>=20
>> --=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

