Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32BE3E006B3; Tue, 14 Aug 2018 12:40:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26643E00AA5
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 12:40:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EJeAC7104386
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 14:40:10 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EJeAbQ013755
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 14:40:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 14:40:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 14 Aug 2018 14:40:09 -0500
Received: from hao-Ubuntu16.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EJe9J1009395;
	Tue, 14 Aug 2018 14:40:09 -0500
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 14 Aug 2018 10:37:58 -0400
Message-ID: <1534257478-36797-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH V3 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.00.12
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
X-List-Received-Date: Tue, 14 Aug 2018 19:40:13 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>

---
Changes from previous version of patch
Remove old version of tools
---
---
 recipes-ti/bios/ti-dspbios_5.41.11.38.bb                     |  9 ---------
 recipes-ti/bios/ti-sysbios_6.33.00.19.bb                     |  9 ---------
 recipes-ti/bios/ti-sysbios_6.46.05.55.bb                     | 12 ------------
 .../{ti-sysbios_6.52.00.12.bb => ti-sysbios_6.73.00.12.bb}   |  8 ++++----
 4 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-dspbios_5.41.11.38.bb
 delete mode 100644 recipes-ti/bios/ti-sysbios_6.33.00.19.bb
 delete mode 100644 recipes-ti/bios/ti-sysbios_6.46.05.55.bb
 rename recipes-ti/bios/{ti-sysbios_6.52.00.12.bb => ti-sysbios_6.73.00.12.bb} (52%)

diff --git a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
deleted file mode 100644
index f60f6c0..0000000
--- a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-dspbios.inc
-
-PV = "5_41_11_38"
-
-SRC_URI[biosbin.md5sum] = "7fab13740c25f5b34b331bcdc759536e"
-SRC_URI[biosbin.sha256sum] = "96b8e090f79420a4c11d9c0c10d182d1d3b4afb48f11ec375c97b4c91970d0a0"
-
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/bios/ti-sysbios_6.33.00.19.bb b/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
deleted file mode 100644
index 4e2b445..0000000
--- a/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-sysbios.inc
-
-PV = "6_33_00_19"
-LIC_FILES_CHKSUM = "file://sysbios_${PV}_manifest.html;md5=94136ca9815f76603b7202a41f1d6f5e"
-
-SRC_URI[sysbiosbin.md5sum] = "e1a2f28a8b3087896bbd986696e1a908"
-SRC_URI[sysbiosbin.sha256sum] = "b7e096662f5d928eb818bbb14474deb1e3e038fea34b516b248de637835121ec"
-
-S = "${WORKDIR}/ti/bios_${PV}"
diff --git a/recipes-ti/bios/ti-sysbios_6.46.05.55.bb b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
deleted file mode 100644
index e910d53..0000000
--- a/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-ti/bios/ti-sysbios.inc
-
-PV = "6_46_05_55"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=1c88b63f0ce751d88354de0727623eba"
-
-SRC_URI[sysbiosbin.md5sum] = "8182effcbeea90778e393818ec4d65e8"
-SRC_URI[sysbiosbin.sha256sum] = "2ad3432cafd1a93dd8cd1e56b722c979852d5c72f5defc29843d507cdd7b667a"
-
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
diff --git a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
similarity index 52%
rename from recipes-ti/bios/ti-sysbios_6.52.00.12.bb
rename to recipes-ti/bios/ti-sysbios_6.73.00.12.bb
index ebdb135..b727673 100644
--- a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
+++ b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
@@ -1,12 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_52_00_12"
+PV = "6_73_00_12"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=ca549c223d732e6f69efc449795c4eeb"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=99771475f3621a6bf690df10327eaaa9"
 
-SRC_URI[sysbiosbin.md5sum] = "3c16af0843b5b6c5ff10512d1b586665"
-SRC_URI[sysbiosbin.sha256sum] = "4a2b9b76f52a57f02725337db9361787eae4c917d7cf989a697ed41eb4a1e701"
+SRC_URI[sysbiosbin.md5sum] = "f8ff74bf0cfebdd5689fba843272ac61"
+SRC_URI[sysbiosbin.sha256sum] = "4fdf76696fb43984a9cae739fd2ee091ca9d031ad0277d2bb94dbb26eae63f43"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
2.7.4


