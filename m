Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501FDC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 22:28:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1230.1741818485148743195
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 15:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZPKmulVs;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CMS1FR1192020
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 17:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741818481;
	bh=OOJCsBR5SPzqyQpS+e50gNYD7lDGWdCIxeWElTDfQYA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZPKmulVs7uNpom6FWA9lReYRQITKswvW/KNM1x1kTQO5t4ObOc7TVqOu7hcy+OlwX
	 zmVb7ZaK6Ayt4AFwNJ7I01mQ+OLh2YGzh0FteNPapmsS4maSLAoi8SIi/khIujzb6o
	 uFYUeQXTgO1Y5gwCFH1zLRGLBBm9zE2vObYNJMIo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CMS1F4023260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 17:28:01 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 17:28:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 17:28:00 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CMS0Sp031579;
	Wed, 12 Mar 2025 17:28:00 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Mar 2025 17:28:00 -0500
Message-ID: <D8EN4BI2CBBK.R545KF51QKM0@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <detheridge@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-img-rogue-umlibs: ship
 module blacklist
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250312213803.1160562-1-rs@ti.com>
 <CAMKF1sprtyknfht+5XmL4Ee76kybV4mqr0Ewg+Sz1RLXDqYgTg@mail.gmail.com>
In-Reply-To: <CAMKF1sprtyknfht+5XmL4Ee76kybV4mqr0Ewg+Sz1RLXDqYgTg@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Mar 2025 22:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18376

On Wed Mar 12, 2025 at 4:43 PM CDT, Khem Raj wrote:
> On Wed, Mar 12, 2025 at 2:38=E2=80=AFPM Randolph Sapp via
> lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
>>
>> From: Randolph Sapp <rs@ti.com>
>>
>> Well, this is the evil vendor driver. Time to start acting like it.
>> Blacklist the upstream powervr module if this driver is present.
>>
>> This patch also does away with the bin_package components. It was cool
>> and found some interesting bugs, but we might as well start leveraging
>> that Makefile more now that we're starting to get some more common
>> files between devices.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  .../ti-img-rogue-umlibs_24.2.6643903.bb       | 23 ++++++++++++-------
>>  1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-r=
ogue-umlibs_24.2.6643903.bb
>> index b8153711..565e92eb 100644
>> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24=
.2.6643903.bb
>> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24=
.2.6643903.bb
>> @@ -3,19 +3,15 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-=
umlibs"
>>  LICENSE =3D "TI-TFL"
>>  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f=
99e3baa03de5207e76f"
>>
>> -inherit bin_package
>> -
>> -INHIBIT_DEFAULT_DEPS =3D ""
>> -
>>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s=
"
>>
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>>  BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>>  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;prot=
ocol=3Dhttps;branch=3D${BRANCH}"
>> -SRCREV =3D "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
>> -S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}=
"
>> +SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
>> +S =3D "${WORKDIR}/git"
>>
>>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>> @@ -54,7 +50,12 @@ def get_file_list(package_list_var, d):
>>                      file_list.append(f"{prefix}{package_file}")
>>      return " ".join(file_list)
>>
>> -do_install:append() {
>> +EXTRA_OEMAKE +=3D 'BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TARGET_PRODU=
CT} WINDOW_SYSTEM=3D${PVR_WS}'
>> +
>> +do_configure[noexec] =3D "1"
>> +do_compile[noexec] =3D "1"
>> +do_install() {
>> +    oe_runmake 'DESTDIR=3D${D}' install
>>      if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true',=
 d)}; then
>>          for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
>>              rm -rf ${file}
>> @@ -78,6 +79,9 @@ do_install:append() {
>>
>>      # clean up any empty directories
>>      find "${D}" -empty -type d -delete
>> +
>> +    # fix permissions
>> +    chown -R root:root "${D}"
>
> Why is this needed ?
>

When you're copying over groups of file the permissions normally end up man=
gled.
You could install each dirctory manually before the copy to ensure proper
permissions, or you could just chown them after the fact.

The rust package in oe-core does the same thing.

>>  }
>>
>>  GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
>> @@ -141,6 +145,9 @@ INSANE_SKIP:${PN}-tools =3D "ldflags"
>>  FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
>>  INSANE_SKIP:${PN}-firmware +=3D "arch"
>>
>> +# common libraries
>> +FILES:${PN} =3D "${libdir}"
>> +
>>  RRECOMMENDS:${PN} +=3D " \
>>      ${PN}-tools \
>>  "
>> --
>> 2.48.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18374): https://lists.yoctoproject.org/g/meta-ti/mes=
sage/18374
>> Mute This Topic: https://lists.yoctoproject.org/mt/111668777/1997914
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [raj.khem@gm=
ail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


