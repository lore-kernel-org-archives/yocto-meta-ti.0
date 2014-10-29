Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50B4BE00877; Wed, 29 Oct 2014 07:40:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B970E00799
	for <meta-ti@yoctoproject.org>; Wed, 29 Oct 2014 07:40:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9TEeGpQ031326
	for <meta-ti@yoctoproject.org>; Wed, 29 Oct 2014 09:40:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9TEeGDr022279
	for <meta-ti@yoctoproject.org>; Wed, 29 Oct 2014 09:40:16 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 29 Oct 2014 09:40:15 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R, Karthik"
	<karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] Karthik Ramanan : dspdce-fw: Updated dspdce firmware
	for	latest IPC version
Thread-Index: AQHP8lQdzzJwHymd00S/k7SfHjLazJxHJ3AA
Date: Wed, 29 Oct 2014 14:40:15 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B72CE@DFLE09.ent.ti.com>
References: <20141028020412.9D39452A6A@arago-project.org>
In-Reply-To: <20141028020412.9D39452A6A@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Karthik Ramanan : dspdce-fw: Updated dspdce firmware for	latest IPC version
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
X-List-Received-Date: Wed, 29 Oct 2014 14:40:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik,

What is the version of IPC with which this fw and the ipumm-fw is built?

Thank you,
Jake

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Arago Project git
Sent: Monday, October 27, 2014 10:04 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Karthik Ramanan : dspdce-fw: Updated dspdce firmware for=
 latest IPC version

Module: meta-ti
Branch: daisy
Commit: 19c88084c2818e30907d8a10fe24f9f87b59430a
URL:    http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D19c88084c28=
18e30907d8a10fe24f9f87b59430a

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Oct 27 14:41:20 2014 +0000

dspdce-fw: Updated dspdce firmware for latest IPC version

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ce-fw_1.00.00.02.bb =3D> dspdce-fw_1.00.00.04.bb} |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb b/recipes-bsp/ds=
pdce-fw/dspdce-fw_1.00.00.04.bb
similarity index 52%
rename from recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
rename to recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
index 69e9814..d8d5b01 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
@@ -1,16 +1,16 @@
-DESCRIPTION =3D "Firmware for DSP "
+DESCRIPTION =3D "Firmware for DSP for an example application called copyco=
dectest"
 LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM =3D "file://DSPDCE-${PV}-Manifest.doc;md5=3D587a7b9fdd99f=
98fbe99af4a4ba3362a"
+LIC_FILES_CHKSUM =3D "file://DSPDCE-${PV}-Manifest.doc;md5=3Db8feda5a3ed81=
97d05993c0d0ff5590e"
=20
 COMPATIBLE_MACHINE =3D "dra7xx-evm"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00=
_00_02/exports/dspdce-${MACHINE}-1.00.00.02.tar.gz;protocol=3Dhttp"
+SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00=
_00_04/exports/dspdce-${MACHINE}-1.00.00.04.tar.gz;protocol=3Dftp"
=20
 S =3D "${WORKDIR}/dspdce-${MACHINE}-${PV}"
=20
-SRC_URI[md5sum] =3D "df19baf16f828b5d32b4eed50f0364f5"
-SRC_URI[sha256sum] =3D "0c0f34674110d1ef0300b61b572a326daffb95a31cc9d45888=
b2e50a83c6f555"
+SRC_URI[md5sum] =3D "72722b12e90c26a85f7f1b56d749cad0"
+SRC_URI[sha256sum] =3D "64057db41dbee5a992db88129a9154f27c67cfbba8efdc0f09=
b7de38df4d58eb"
=20
 TARGET =3D "dra7-dsp1-fw.xe66"
=20
@@ -22,3 +22,5 @@ do_install() {
 FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
=20
 INSANE_SKIP_${PN} =3D "arch"
+
+PR =3D "r1"

--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

