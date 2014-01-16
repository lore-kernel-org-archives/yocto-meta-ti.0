Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2240E00870
	for <meta-ti@yoctoproject.org>; Thu, 16 Jan 2014 06:11:40 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0GEBdHT002234;
	Thu, 16 Jan 2014 08:11:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GEBcT0000872;
	Thu, 16 Jan 2014 08:11:38 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 16 Jan 2014 08:11:38 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] vpe-vpdma: update SRCREV and pass CROSS_COMPILE
Thread-Index: AQHPEjctUonR7ZbwUk+4Gp5MwRhOk5qGXK8QgABnHQCAAKFScA==
Date: Thu, 16 Jan 2014 14:11:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598FCB79@DLEE11.ent.ti.com>
References: <1389820588-17906-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101598FA0D1@DLEE11.ent.ti.com>
	<20140115223333.GF12727@edge>
In-Reply-To: <20140115223333.GF12727@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] vpe-vpdma: update SRCREV and pass CROSS_COMPILE
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
X-List-Received-Date: Thu, 16 Jan 2014 14:11:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, January 15, 2014 4:34 PM
>To: Maupin, Chase
>Cc: Denys Dmytriyenko; meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH] vpe-vpdma: update SRCREV and pass
>CROSS_COMPILE
>
>On Wed, Jan 15, 2014 at 10:25:01PM +0000, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>> >Sent: Wednesday, January 15, 2014 3:16 PM
>> >To: meta-ti@yoctoproject.org
>> >Subject: [meta-ti] [PATCH] vpe-vpdma: update SRCREV and pass
>> >CROSS_COMPILE
>> >
>> >From: Denys Dmytriyenko <denys@ti.com>
>> >
>> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >---
>> > recipes-bsp/ti/vpe-vpdma_git.bb | 6 +++---
>> > 1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-
>bsp/ti/vpe-
>> >vpdma_git.bb
>> >index d506791..fb3012a 100644
>> >--- a/recipes-bsp/ti/vpe-vpdma_git.bb
>> >+++ b/recipes-bsp/ti/vpe-vpdma_git.bb
>> >@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM =3D
>> >"file://COPYING;md5=3D74d2f71d8898c54e3d1c9d0058c484aa"
>> > COMPATIBLE_MACHINE =3D "dra7xx-evm"
>> >
>> > PV =3D "1b8"
>> >-PR =3D "r0"
>> >+PR =3D "r1"
>> >
>> >-SRCREV =3D "24a5487ec13bf560f0e7fb24a9d4747f9f358be2"
>> >+SRCREV =3D "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
>> > BRANCH ?=3D "master"
>> >
>> > SRC_URI =3D
>>
>>"git://git.ti.com/vpe_tests/vpe_tests.git;protocol=3Dgit;branch=3D${B
>R
>> >ANCH}"
>> >@@ -18,7 +18,7 @@ SRC_URI =3D
>>
>>"git://git.ti.com/vpe_tests/vpe_tests.git;protocol=3Dgit;branch=3D${B
>R
>> >ANCH
>> > S =3D "${WORKDIR}/git"
>> >
>> > # The test application needs additional include headers from
>the
>> >kernel
>> >-EXTRA_OEMAKE =3D 'KDIR=3D"${STAGING_KERNEL_DIR}/include/uapi -
>> >I${STAGING_KERNEL_DIR}/include"'
>> >+EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D"${TARGET_PREFIX}"
>> >KDIR=3D"${STAGING_KERNEL_DIR}/include/uapi -
>> >I${STAGING_KERNEL_DIR}/include"'
>>
>> Shouldn't the setting of CC in OE already take care of this?  Or
>did the rebase affect the Makefile?
>
>I believe it has been affected by this commit:
>http://git.ti.com/gitweb/?p=3Dvpe_tests/vpe_tests.git;a=3Dcommitdiff;h
>=3De3d8db1aa935775f9d196ad7428e0cd9864a36ca
>
>It overrides CC in the Makefile and the simplest way is to pass
>CROSS_COMPILE.

Ah.  The commit I was on used CC ?=3D .... so you didn't have to pass CROSS=
_COMPILE.  Thanks.

>
>
>> > do_install() {
>> >     oe_runmake DESTDIR=3D"${D}" install
>> >--
>> >1.8.3.2
>> >
>> >_______________________________________________
>> >meta-ti mailing list
>> >meta-ti@yoctoproject.org
>> >https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

