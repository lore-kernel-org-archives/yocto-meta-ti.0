Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16E87E00D11; Fri,  8 Mar 2019 16:46:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFD0EE00BE8
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2019 16:46:16 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x290kGpG018782
	for <meta-ti@yoctoproject.org>; Fri, 8 Mar 2019 18:46:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552092376;
	bh=6PMQ8aNEgklxhXN46Bvrpd5EhwpvVoN+BvgaMWKyUy4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=AE+EhD+qHTZgUE6bWFje7k24KTIREmc2X+cw815Sz5ziT5U9kzPCg1foqB3ktZePQ
	pIMNs129FG5AsKxoU4i6FaO2L36RNLpeTsw8O/KWy17MMmhxhu2egpNWZfMyIJGMkk
	/9uMhIYna5yYUp+iP32q0zZdY+e/D/KKxGn+Jpzg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x290kG65034008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 8 Mar 2019 18:46:16 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 18:46:15 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1591.008; Fri, 8 Mar 2019 18:46:16 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2] ti-cg-xml: Update to version
	2.61.00
Thread-Index: AQHU03fRVVTk1p7BjUagJNjlad+VFaYCe92Q
Date: Sat, 9 Mar 2019 00:46:15 +0000
Message-ID: <27bb515432a945c5bf165139817aef2c@ti.com>
References: <1551806342-16708-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551806342-16708-2-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1551806342-16708-2-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.71.56]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [rocko/master][PATCH v2] ti-cg-xml: Update to version	2.61.00
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
X-List-Received-Date: Sat, 09 Mar 2019 00:46:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/=
cg_xml/cg_xml_v2.61.00/cgxml-2.61.00-linux-installer.run

Not Found
The requested URL /ccs/non-esd/releases/other/applications_packages/cg_xml/=
cg_xml_v2.61.00/cgxml-2.61.00-linux-installer.run was not found on this ser=
ver.


-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Radhakrishnan, Mahesh
Sent: Tuesday, March 5, 2019 12:19 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [rocko/master][PATCH v2] ti-cg-xml: Update to version 2.=
61.00

The license checksum change is due to the copyright year and version.
The license itself has not changed.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cg-xml_2.41.00.bb =3D> ti-cg-xml_2.61.00.bb}      | 17 ++++++++---=
------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename recipes-ti/devtools/{ti-cg-xml_2.41.00.bb =3D> ti-cg-xml_2.61.00.bb=
} (64%)

diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools=
/ti-cg-xml_2.61.00.bb
similarity index 64%
rename from recipes-ti/devtools/ti-cg-xml_2.41.00.bb
rename to recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index 5c0ff63..2caac8f 100644
--- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
+++ b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -7,22 +7,21 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-unpack.inc
=20
-PV =3D "2_41_00"
-
+PV =3D "2.61.00"
+PE =3D "1"
 S =3D "${WORKDIR}/cg_xml_${PV}"
=20
 SRC_URI =3D "\
-    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_pack=
ages/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Linux-x86-Install;name=3Dcgxmlbin_l=
inux \
+    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_pack=
ages/cg_xml/cg_xml_v${PV}/cgxml-${PV}-linux-installer.run;name=3Dcgxmlbin_l=
inux \
 "
+LIC_FILES_CHKSUM =3D "file://cg_xml_${PV}_Manifest.pdf;md5=3Dfc02a39748ba5=
0373f32b2f4a5e3a684"
=20
-LIC_FILES_CHKSUM =3D "file://cg_xml_${PV}_Manifest.pdf;md5=3Dba23d76ef3d5e=
c111b03267105c91bd4"
-
-SRC_URI[cgxmlbin_linux.md5sum] =3D "9e421f25f6da455b0155570ce0e62628"
-SRC_URI[cgxmlbin_linux.sha256sum] =3D "bbc25f4abe27a8b93bae1d8581c3dee8711=
1c3769c305d086287038ee9038cbf"
+SRC_URI[cgxmlbin_linux.md5sum] =3D "6ce60caa97bbf15158d806fb062fadff"
+SRC_URI[cgxmlbin_linux.sha256sum] =3D "da77cb10bd3d5de89e27e4ce8f4408a2e50=
775c8980225f9a828ddc242bb81f9"
=20
-BINFILE=3D"cg_xml-v${PV}-Linux-x86-Install"
+BINFILE=3D"cgxml-${PV}-linux-installer.run"
 TI_BIN_UNPK_CMDS=3D""
-TI_BIN_UNPK_ARGS=3D"--prefix ${S} --mode silent"
+TI_BIN_UNPK_ARGS=3D"--prefix ${S} --mode unattended"
=20
 do_install() {
     CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership=
"
--=20
1.9.1

--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

