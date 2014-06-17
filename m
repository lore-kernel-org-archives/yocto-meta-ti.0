Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 530BDE00BFD; Tue, 17 Jun 2014 04:22:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D43FE00B71
	for <meta-ti@yoctoproject.org>; Tue, 17 Jun 2014 04:22:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5HBMbw2028526
	for <meta-ti@yoctoproject.org>; Tue, 17 Jun 2014 06:22:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5HBMb9r005813
	for <meta-ti@yoctoproject.org>; Tue, 17 Jun 2014 06:22:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 17 Jun 2014 06:22:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [for dora & master][PATCH]
	u-boot-ti-staging:_2013.10: Update to pull in critical fixes
Thread-Index: AQHPhXyghKlVPCpK3UaBkqUomWnLCZt0udQAgAB4FMs=
Date: Tue, 17 Jun 2014 11:22:36 +0000
Message-ID: <665B6C21-BDD3-47A0-9F29-B99C2B112773@ti.com>
References: <1402494847-29713-1-git-send-email-fcooper@ti.com>,
	<20140616231250.GF1825@edge>
In-Reply-To: <20140616231250.GF1825@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for dora & master][PATCH] u-boot-ti-staging:_2013.10: Update to pull in critical fixes
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
X-List-Received-Date: Tue, 17 Jun 2014 11:22:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

These are 2 production stop patches that have been pushed to the same LCPD =
git tree and branch that is apart of your last release.

With out them beta and production boards will frequently not boot and even =
if they do running any intensive task can kill the display requiring a rebo=
ot.

It's 2 patches that affect am4x only. For all other devices nothing has cha=
nged.

> On Jun 16, 2014, at 6:12 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
>> On Wed, Jun 11, 2014 at 08:54:07AM -0500, Franklin S. Cooper Jr wrote:
>> * Critical fixes have been added to the ti-u-boot-2013.10 branch for AM4=
x.
>> * Update commit id to point to this new commit.
>> * For all other platforms nothing should have changed.
>> ---
>> recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    6 +++---
>> 1 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-b=
sp/u-boot/u-boot-ti-staging_2013.10.bb
>> index b8f5ce6..d954db4 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
>> @@ -5,14 +5,14 @@ DESCRIPTION =3D "u-boot bootloader for TI devices"
>> LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D025bf9f768cbcb1a165db=
e1a110babfb"
>>=20
>> PV =3D "2013.10"
>> -PR =3D "r7+gitr${SRCPV}"
>> +PR =3D "r8+gitr${SRCPV}"
>>=20
>> SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
>>=20
>> BRANCH ?=3D "ti-u-boot-2013.10"
>>=20
>> -# Corresponds to tag ti2013.12.01
>> -SRCREV =3D "78d8ebd4a0214b72a125f5b98c5ed2f9a3e5e783"
>> +# Corresponds to tag ti2013.12.01_amsdk-07.01
>=20
> I'm still not sure of how to handle this kind of change...
>=20
>=20
>> +SRCREV =3D "259ff9a577cc66cb40e3cdff3e41628e466f0fef"
>>=20
>> SPL_BINARY =3D "MLO"
>> SPL_UART_BINARY =3D "u-boot-spl.bin"
>> --=20
>> 1.7.0.4
>>=20
>> --=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

