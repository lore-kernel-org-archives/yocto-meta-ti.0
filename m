Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE254E00805; Tue, 14 Aug 2018 12:39:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9B03E00519
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 12:39:44 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EJdi8F112715
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 14:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534275584;
	bh=RBp6olMCDQK7Dwds8cZhGTjSpJtFToAVWlt/Q79SzlE=;
	h=From:To:CC:Subject:Date;
	b=Zmh4bgwF1D1P60PqoN438fwdUpamrXPgO7J1eJv3ao0x3AEQbMPEpyoLvDLsQUrOx
	pApPJsSuv7ZzlIfQJvUEb5Sy9isgFe624CqcBv3+E5g+FRAbZdQGDEx1y7o8LPaCHS
	jjt3w8Ss61uGTgvjYROcI7ozOFV4UpODxckfyV7I=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EJdi2n007861
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 14:39:44 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 14:39:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 14 Aug 2018 14:39:43 -0500
Received: from hao-Ubuntu16.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EJdhYi008478;
	Tue, 14 Aug 2018 14:39:43 -0500
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 14 Aug 2018 10:37:31 -0400
Message-ID: <1534257451-36752-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH V3 1/2] recipes-ti: devtools: add TI XDC tools 3.50.07.20
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
X-List-Received-Date: Tue, 14 Aug 2018 19:39:45 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>

---
Changes from previous version of patch
Remove old version of tools
---
---
 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb            | 13 -------------
 recipes-ti/devtools/ti-xdctools_3.30.06.67.bb            | 16 ----------------
 ...-xdctools_3.50.03.33.bb => ti-xdctools_3.50.07.20.bb} |  6 +++---
 3 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
 delete mode 100644 recipes-ti/devtools/ti-xdctools_3.30.06.67.bb
 rename recipes-ti/devtools/{ti-xdctools_3.50.03.33.bb => ti-xdctools_3.50.07.20.bb} (51%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
deleted file mode 100644
index 7f00d9e..0000000
--- a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ti-xdctools.inc
-
-PV = "3_23_00_32"
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=49b2dfbf48860a0da844709c3ce63a9c"
-
-SRC_URI += "file://fix-hardcoded-paths.diff"
-
-SRC_URI[xdcbin.md5sum] = "263aa11795670265551d36a8c77ad27d"
-SRC_URI[xdcbin.sha256sum] = "880b4e263850f2a3c0ea7352c5b6e0a86692361e26634c3b70dddc42c71231a5"
-
-S = "${WORKDIR}/ti/xdctools_${PV}"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/devtools/ti-xdctools_3.30.06.67.bb b/recipes-ti/devtools/ti-xdctools_3.30.06.67.bb
deleted file mode 100644
index 6de8181..0000000
--- a/recipes-ti/devtools/ti-xdctools_3.30.06.67.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ti-xdctools.inc
-
-PV = "3_30_06_67"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=117e3c5f48df3e785edee50f5f34a738"
-
-SRC_URI[xdcbin.md5sum] = "b500f53e00c4422c7124e1825eee6352"
-SRC_URI[xdcbin.sha256sum] = "e5ca1f55c09b64bc9414adb55b2fcca301178194abed80f1d75d94cae442fd08"
-
-S = "${WORKDIR}/xdctools_${PV}"
-
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-TI_BIN_UNPK_CMDS = ""
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
similarity index 51%
rename from recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
rename to recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
index 73ab3bd..d45f373 100644
--- a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_50_03_33"
+PV = "3_50_07_20"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
 
-SRC_URI[xdczip.md5sum] = "21310b647275a7c7dd5b37dcb96c0b1b"
-SRC_URI[xdczip.sha256sum] = "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
+SRC_URI[xdczip.md5sum] = "52e4b5ddf2e004c6acff52104840724e"
+SRC_URI[xdczip.sha256sum] = "bef631c110ca9243790de06cd51839170d7979b92e01396e4265009776ff7a07"
-- 
2.7.4


