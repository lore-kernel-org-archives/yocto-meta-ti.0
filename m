Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D193BE013DF
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 05:52:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7LCqSRW004667
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 07:52:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7LCqSsm022853
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 07:52:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 21 Aug 2013 07:52:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-ti] [PATCHv2] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOnm1KyZtz69Xsp0WMTJ1UpbuSOA==
Date: Wed, 21 Aug 2013 12:52:27 +0000
Message-ID: <11D7D156-B5DC-45EC-9D98-C65E76900235@ti.com>
References: <1372849303-21311-1-git-send-email-mrinmayee@ti.com>,
	<CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Wed, 21 Aug 2013 12:52:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Only one real comment below but overall looks good

On Aug 21, 2013, at 6:48 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com> wro=
te:

> Ping for comments!
>=20
>> -----Original Message-----
>> From: Hingolikar, Mrinmayee
>> Sent: Wednesday, July 03, 2013 4:32 PM
>> To: meta-ti@yoctoproject.org
>> Cc: Hingolikar, Mrinmayee; Heroor, Siddharth
>> Subject: [PATCHv2] abefw: Firmware for OMAP5 ABE
>>=20
>> * The OMAP5 Audio Backend requires a 'firmware' to enable
>>  sound. This recipe installs a prebuilt firmware. This
>>  part is a hack, as in the current form, the firmware
>>  cannot be cross-compiled. There is a plan to fix this
>>  and hopefully, this recipe is short-lived. Once the code
>>  is fixed, we should have new recipes that build the firmware
>>  and clean up this recipe.
>>=20
>> v2:
>> * Merged contents from abefw.inc and removed abefw.inc based
>>  on review.
>>=20
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>> 1 files changed, 20 insertions(+), 0 deletions(-)  create mode 100644
>> recipes-bsp/abefw/abefw_1.0.14.bb
>>=20
>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
>> bsp/abefw/abefw_1.0.14.bb
>> new file mode 100644
>> index 0000000..8db71e4
>> --- /dev/null
>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY =3D "Firmware for OMAP5 ABE"
>> +HOMEPAGE =3D "http://git.ti.com"
Not a big deal but probably should use the git.ti link to the actual reposi=
tory so people can find it easier"
>> +LICENSE =3D "BSD/GPLv2"
This should be "BSD | GPLv2"
>> +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D923db086ed9463ab3215b24d87e05ec5"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +COMPATIBLE_MACHINE =3D "omap5-evm"
>> +
>> +SRC_URI =3D "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=3Dgit"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
>> +
>> +do_install() {
>> +        mkdir -p ${D}/lib/firmware
>> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
>> +
>> +FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
>> --
>> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

