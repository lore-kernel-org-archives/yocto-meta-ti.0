Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BC5AE00C93; Wed,  6 Mar 2019 10:07:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34457E00C71
	for <meta-ti@yoctoproject.org>; Wed,  6 Mar 2019 10:07:20 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x26I7JRi007191
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 12:07:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551895639;
	bh=CBTbDWviy2NuqoBXUsnWBase3TjljJDPj3fBrTRkWdU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zP01O9SDKhz3XpEX5o7djJ4Q3LrgjtXkfG1cLrs2UXNBTz0KgZ5fr9kuglaaPbF9I
	o29jG7njQMG+hugHTJcKbnxc8nSjp4vnQsB/50Bsl8coF0izPBFXgz1+oVwZQ1Ohe3
	Y51AnGExB3RoBtT+Ek85a7Fa6aV2UrbWHIR4odyM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x26I7I3R103645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 12:07:19 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 12:07:18 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 12:07:18 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x26I7IDu009944
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 12:07:18 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 6 Mar 2019 13:07:16 -0500
Message-ID: <1551895636-19041-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551895636-19041-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1551895636-19041-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-cgt6x: Update to version 8.3.2
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
X-List-Received-Date: Wed, 06 Mar 2019 18:07:21 -0000
Content-Type: text/plain

The license checksum changed due to the version, licenses have not
changed.
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cgt6x_8.2.2.bb => ti-cgt6x_8.3.2.bb}       | 32 ++++++++--------------
 1 file changed, 11 insertions(+), 21 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.2.2.bb => ti-cgt6x_8.3.2.bb} (70%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
similarity index 70%
rename from recipes-ti/devtools/ti-cgt6x_8.2.2.bb
rename to recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index 53f5252..cf1d4eb 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.2.x_CodeGenerationTools_Manifest.htm;md5=66147c95fc5d3f900b73414f8258c91e"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.2.x_CodeGenerationTools_Manifest.htm;md5=66147c95fc5d3f900b73414f8258c91e"
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
 
 PE = "1"
 
@@ -37,11 +37,13 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "548c841b231c2fbd954218d4e370c995"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "f269e51eb29de2efd32b3ea93beebd7b00a1a156c923be1a33ba7d785c4c6a24"
+SRC_URI[cgt6x_x86_installer.md5sum] = "f1f534e6a4bdee6df39e8d0cb458d161"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "1fba2a8f5532b33a23677771d686a866171ce7a0e567fed50d900d0ecd2e17e6"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "56f5e5464ab87af517a6cdd5fed06f3f"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "4b2e605a4afc3d4d0ac74013ee32496541abf093aedd70bc7ef040597933b1ea"
+SRC_URI[cgt6x_arm_installer.md5sum] = "425d82308e71202ad004a36b7ec3cec9"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "70c387ddde379194fed712087be6cb0ca5f4f0e65d7f29bd7462c38ee011928f"
+
+CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 
 do_install() {
     install -d ${D}${bindir}
@@ -54,10 +56,7 @@ do_install() {
         install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
     done
 
-    install -d ${D}${datadir}/ti/cgt-c6x/include
-    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
-        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
-    done
+    cp ${CP_ARGS}  ${S}/ti-cgt-c6000_${PV}/include ${D}${datadir}/ti/cgt-c6x/include 
 
     install -d ${D}${datadir}/ti/cgt-c6x/lib
     for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
@@ -72,11 +71,6 @@ do_install() {
         install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
     done
 
-    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
-    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
-        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
-    done
-
     install -d ${D}${datadir}/man/man1
     for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
         if [ -e ${manfile} ]; then
@@ -89,7 +83,7 @@ do_install() {
         install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
     done
 
-    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
+    for docfile in ${S}/ti-cgt-c6000_${PV}/*.html; do
         install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
     done
 
@@ -97,10 +91,6 @@ do_install() {
         install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
     done
 
-    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
-        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
-    done
-
 }
 
 do_install_class-target() {
-- 
1.9.1


