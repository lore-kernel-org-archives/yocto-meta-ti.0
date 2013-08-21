Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 844C9E00747
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 08:31:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7LFVhYI004625
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 10:31:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7LFVh7M012186
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 10:31:43 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 21 Aug 2013 10:31:42 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCHv2] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOd9y4IikHeESs8Em2xraap0+6U5mf2NIggAA9jUA=
Date: Wed, 21 Aug 2013 15:31:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596D51CE@DLEE11.ent.ti.com>
References: <1372849303-21311-1-git-send-email-mrinmayee@ti.com>
	<CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 21 Aug 2013 15:31:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Wednesday, August 21, 2013 6:48 AM
>To: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCHv2] abefw: Firmware for OMAP5 ABE
>
>Ping for comments!

For some reason I don't see this in my e-mails for the original post.  Sorr=
y for the delay.

>
>> -----Original Message-----
>> From: Hingolikar, Mrinmayee
>> Sent: Wednesday, July 03, 2013 4:32 PM
>> To: meta-ti@yoctoproject.org
>> Cc: Hingolikar, Mrinmayee; Heroor, Siddharth
>> Subject: [PATCHv2] abefw: Firmware for OMAP5 ABE
>>
>> * The OMAP5 Audio Backend requires a 'firmware' to enable
>>   sound. This recipe installs a prebuilt firmware. This
>>   part is a hack, as in the current form, the firmware
>>   cannot be cross-compiled. There is a plan to fix this
>>   and hopefully, this recipe is short-lived. Once the code
>>   is fixed, we should have new recipes that build the firmware
>>   and clean up this recipe.
>>
>> v2:
>> * Merged contents from abefw.inc and removed abefw.inc based
>>   on review.
>>
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>>  recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>>  1 files changed, 20 insertions(+), 0 deletions(-)  create mode
>100644
>> recipes-bsp/abefw/abefw_1.0.14.bb
>>
>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
>> bsp/abefw/abefw_1.0.14.bb
>> new file mode 100644
>> index 0000000..8db71e4
>> --- /dev/null
>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY =3D "Firmware for OMAP5 ABE"
>> +HOMEPAGE =3D "http://git.ti.com"
>> +LICENSE =3D "BSD/GPLv2"

This seems wrong.  I thought the convention is "BSD | GPLv2" for either lic=
ense or "BSD & GPLv2" if mixed license.

If it is mixed then you probably need 2 entries in LIC_FILES_CHKSUM, one fo=
r each license.

Also, does the GPLv2 use the "or later" clause such that it should be GPLv2=
+ ?

>> +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D923db086ed9463ab3215b24d87e05ec5"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +COMPATIBLE_MACHINE =3D "omap5-evm"
>> +
>> +SRC_URI =3D "git://git.ti.com/glsdk/abefw-
>omap4plus.git;protocol=3Dgit"

Not strictly required but PR =3D r0 here would help remind you to bump the =
PR in the future.

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

I'm sure this has been discussed before, but do you see any confusion about=
 this being omap5-evm only and yet the FW is omap4_abe_new?

>> --
>> 1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

