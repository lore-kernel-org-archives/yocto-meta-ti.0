Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 743BAE016B6
	for <meta-ti@yoctoproject.org>; Wed, 23 Oct 2013 04:44:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9NBi2aB023758
	for <meta-ti@yoctoproject.org>; Wed, 23 Oct 2013 06:44:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9NBi204001995
	for <meta-ti@yoctoproject.org>; Wed, 23 Oct 2013 06:44:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 23 Oct 2013 06:44:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv3] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHOnmPlaQN+5orR/kKK6WzlP0oCpJm2sNcwgABsG8CASwTvYIAAa3yA
Date: Wed, 23 Oct 2013 11:44:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597D1BC4@DLEE11.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5451C2A@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015970890B@DLEE11.ent.ti.com>
	<CF956B779D819D41BBC043B7082161D545ADFC@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D545ADFC@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv3] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Wed, 23 Oct 2013 11:44:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Wednesday, October 23, 2013 12:24 AM
>To: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCHv3] libgles: Added prebuilt userspace
>libraries for graphics acceleration
>
>
>
>> -----Original Message-----
>> From: Maupin, Chase
>> Sent: Thursday, September 05, 2013 5:14 PM
>> To: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org
>> Subject: RE: [meta-ti] [PATCHv3] libgles: Added prebuilt
>userspace
>> libraries for graphics acceleration
>>
>>
>> >-----Original Message-----
>> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>> >Sent: Thursday, September 05, 2013 12:15 AM
>> >To: meta-ti@yoctoproject.org
>> >Subject: [meta-ti] [PATCHv3] libgles: Added prebuilt userspace
>> >libraries for graphics acceleration
>> >
>> >
>> >* These libraries are not distributable in source and hence
>> >  are available only as binary. They implement OpenGLES 1.x and
>> >  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
>> >  class of devices.
>> >
>> >v2:
>> >
>> >Addressed Chases's comments:
>> >* Updated the PR
>> >* Added shasum for the tarball
>> >* Removed redundant FILES section
>> >
>> >v3:
>> >*Replaced shasum by sha256sum
>> >
>> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> >---
>> > .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20
>> >++++++++++++++++++++
>> > 1 file changed, 20 insertions(+)
>> > create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
>> >linux_1.9.0.10.bb
>> >
>> >diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
>> >linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>> >linux_1.9.0.10.bb
>> >new file mode 100644
>> >index 0000000..15d5be0
>> >--- /dev/null
>> >+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>> >@@ -0,0 +1,20 @@
>> >+DESCRIPTION =3D "Userspace libraries for sgx"
>> >+HOMEPAGE =3D
>"http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
>> >+LICENSE =3D "TI"
>> >+
>> >+SRC_URI =3D
>>
>>"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent
>/
>> >gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-
>> >${PV}.tar.gz;protocol=3Dhttp"
>> >+
>> >+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
>> >Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8"
>>
>> I still have a question about a manifest acting as a license
>file.
>> Also is the LICENSE value of "TI" cleared through OSRB?
>Sorry, my bad! The license should be "TI TSPA" not "TI".
>About the Manifest file, it contains the license information and
>its header, so there shouldn't be an issue there.
>It is the standard doc released to the customers by the graphics
>team.
>If you are ok with it, can I send out a revised patch with correct
>license field?

As long as it has the terms of the license and what you mean by TI TSPA the=
n it should be fine.

>>
>> >+
>> >+PR =3D "r0"
>> >+
>> >+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
>> >+SRC_URI[sha256sum] =3D
>>
>>"20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a
>"
>> >+
>> >+S =3D "${WORKDIR}/${PN}-${PV}"
>> >+
>> >+do_install () {
>> >+    oe_runmake install DESTDIR=3D${D}
>> >+}
>> >+
>> >+FILES_${PN} +=3D " ${libdir}/gbm/"
>> >--
>> >1.7.9.5
>> >
>> >_______________________________________________
>> >meta-ti mailing list
>> >meta-ti@yoctoproject.org
>> >https://lists.yoctoproject.org/listinfo/meta-ti
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

