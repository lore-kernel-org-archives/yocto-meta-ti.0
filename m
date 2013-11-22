Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBC58E006E7
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 11:29:13 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMJTCSS020899
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 13:29:12 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMJTCdH019386
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 13:29:12 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 22 Nov 2013 13:29:12 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 3/3] machine config: Use Graphics SDK
	05.00.00.01 by default on AM335x and AM43x
Thread-Index: AQHO55NZzVdwq8WB4kqS62cSdrZefJoyBd+A//+dNyw=
Date: Fri, 22 Nov 2013 19:29:10 +0000
Message-ID: <B959AD6B-5155-4BDC-8DE5-7505D02C8F05@ti.com>
References: <1385136047-15830-1-git-send-email-fcooper@ti.com>
	<1385136047-15830-3-git-send-email-fcooper@ti.com>,
	<20131122192245.GD690@edge>
In-Reply-To: <20131122192245.GD690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 3/3] machine config: Use Graphics SDK 05.00.00.01 by default on AM335x and AM43x
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
X-List-Received-Date: Fri, 22 Nov 2013 19:29:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Nov 22, 2013, at 1:22 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
>> On Fri, Nov 22, 2013 at 10:00:47AM -0600, Franklin S. Cooper Jr wrote:
>> * The latest Graphics SDK is required for the 3.12 kernel being used by =
AM335x
>>  and AM43x machines.
>> * Set the preferred version to insure that the proper version of the gra=
phics
>>  sdk is being used.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> conf/machine/include/ti33x.inc |    3 +++
>> conf/machine/include/ti43x.inc |    3 +++
>> 2 files changed, 6 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x=
.inc
>> index af340d2..8cdf580 100644
>> --- a/conf/machine/include/ti33x.inc
>> +++ b/conf/machine/include/ti33x.inc
>> @@ -23,6 +23,9 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-stagin=
g"
>> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
>> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>>=20
>> +PREFERRED_VERSION_libgles-omap3 =3D "5.00.00.01"
>> +PREFERRED_VERSION_omap3-sgx-modules =3D "5.00.00.01"
>=20
> I'm worried about setting specific preferred versions in the machine conf=
igs -=20
> it doesn't look very scalable...
>=20
> I'm willing to suggest to drop all DEFAULT_PREFERENCE =3D "-1" from the=20
> corresponding recipes and let the build pick the latest "compatible" vers=
ion,=20
> unless overwritten by a distro with own PREFERRED_VERSION.
>=20
> The only drawback I see is that some people still use 4.05 Gfx SDK on oma=
p3=20
> and beagleboard, as that version had the best x11 support (or the least=20
> broken).
>=20
> So, we can fix that particular issue by adding DEFAULT_PREFERENCE_omap3 =
=3D "99"=20
> to that recipe to bump it up.
>=20
> Or, if not removing DEFAULT_PREFERENCE =3D "-1" from all Gfx SDK recipes,=
 then=20
> just add overrides for ti33x and ti43x to bump the preference in 5.00.00.=
01=20
> recipe only...
I like this option since I'm not sure about the quality of the alpha SDK fo=
r any other platforms. If we did this would we need to make the recipes mac=
hine specific? I'm not sure how setting DEFAULT_PREFERENCE works in this si=
tuation when using machine overrides.
>=20
> Thoughts?
>=20
> --=20
> Denys
>=20
>=20
>> KERNEL_IMAGETYPE =3D "zImage"
>>=20
>> UBOOT_ARCH =3D "arm"
>> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x=
.inc
>> index d9bfd25..948fd99 100644
>> --- a/conf/machine/include/ti43x.inc
>> +++ b/conf/machine/include/ti43x.inc
>> @@ -23,6 +23,9 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-stagin=
g"
>> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
>> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>>=20
>> +PREFERRED_VERSION_libgles-omap3 =3D "5.00.00.01"
>> +PREFERRED_VERSION_omap3-sgx-modules =3D "5.00.00.01"
>> +
>> KERNEL_IMAGETYPE =3D "zImage"
>>=20
>> UBOOT_ARCH =3D "arm"
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

