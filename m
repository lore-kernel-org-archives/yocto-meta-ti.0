Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84C1BE00C6D; Mon, 31 Jul 2017 22:46:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5FDFE00C59
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 22:46:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v715km2k032693
	for <meta-ti@yoctoproject.org>; Tue, 1 Aug 2017 00:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501566409;
	bh=TTchtK63pe0H1S39qD96VJL1vLcMQs5af3ckQ44V0ns=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=b5CdAw43vMuyFiad4+lJzZeWIXotcwzFY0oBlWCLyb4yJZmKvs/iaUI8bE89j2ZTL
	U9Ato7kqILIjs31dPHOuc3C0MDYYx07bKTY6ISC0TyzIdVHMdk5Ca+BnStB5D9lWpn
	aht/vETIRKhZatu0ocvR9/NHbP53KOf3/AptfGto=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v715kmsx028333
	for <meta-ti@yoctoproject.org>; Tue, 1 Aug 2017 00:46:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 1 Aug 2017 00:46:48 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v3 2/4] ti-cgt6x-7: added recipe for TI CGT6x
	7.x.x
Thread-Index: AQHTCkk1R2Xsl7/jX0Kqe6qRZWUdv6Ju/lLQ
Date: Tue, 1 Aug 2017 05:46:47 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A4062B49E@DFLE08.ent.ti.com>
References: <1501538742-10101-1-git-send-email-i-pang@ti.com>
	<1501538742-10101-2-git-send-email-i-pang@ti.com>
In-Reply-To: <1501538742-10101-2-git-send-email-i-pang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
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
X-List-Received-Date: Tue, 01 Aug 2017 05:46:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please review v4 instead; I missed the removal of PE and PR here in v3.

Ivan

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Pang, Ivan
Sent: Monday, July 31, 2017 5:06 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [PATCH v3 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x=
.x

This recipe specifically installs the 7.x.x series of TI CGT6x.

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb | 44 +++++++++++++++++++++=
++++
 1 file changed, 44 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb

diff --git a/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb b/recipes-ti/d=
evtools/ti-cgt6x-7-native_7.4.16.bb
new file mode 100644
index 0000000..4212743
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
@@ -0,0 +1,44 @@
+SUMMARY =3D "TI DSP Code Generation Tools"
+DESCRIPTION =3D "Texas Instrument (TI) Code Generation Tools are custom \=
=20
+utilities targeted for TI embedded processors. This Digital Signal \=20
+Processor (DSP) suite contains tools needed to create and debug \=20
+applications for the C6000 DSP family. This includes tools such as: \=20
+compiler, linker, assembler, etc. This also includes C runtime \=20
+libraries and standard header files needed to produce a working DSP applic=
ation."
+
+HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegenerationT=
ools/download.htm"
+LICENSE =3D "TI-TSPA"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db6311962635a4f15630e36ec2d8=
75eca"
+
+PE =3D "0"
+PR =3D "r0"
+
+S =3D "${WORKDIR}/c6000_7.4.16"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc require=20
+recipes-ti/includes/ti-unpack.inc
+
+BINFILE =3D "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
+BINFILE_NAME =3D "cgt6x_7.4.16_x86_installer"
+TI_BIN_UNPK_ARGS =3D "--prefix ${WORKDIR} --mode unattended"
+TI_BIN_UNPK_CMDS=3D""
+
+SRC_URI =3D "http://install.source.dir.local/${BINFILE};name=3D${BINFILE_N=
AME}"
+
+SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] =3D "21ca55c5b1f6b2d8d4fb7570d5=
eb5513"
+SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] =3D "baa0d1ef20397383f99f450=
68a6d160963a01419d42fbbb851263b54c91df82f"
+
+do_install() {
+    install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
+    cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership=20
+${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} +=3D "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN} +=3D "arch staticdev"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_SYSROOT_STRIP =3D "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

