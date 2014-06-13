Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB07CE00C0E; Fri, 13 Jun 2014 15:34:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.43 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DD03E00BEA
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
Received: by mail-pa0-f43.google.com with SMTP id lf10so2543824pab.2
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jmGLQSHGOXe/SBeXF/aHWB3vM12JxU58mvDA+2r2jfY=;
	b=FJzqZcNLO65VAW2D/5ZxO6sAuZpDjEz5jxFM9I6OeiudfaeuDLmLfRzbQlNdvhYsRh
	jD52P+2S1er6WsRy6p2/JjNP9W6RaFHa2bys6/FlLhxGUI8YtShbMeuzN9jrNkuAox1/
	5EIyr287mSFJZngCFR7VsQXkqaE5Q/yJ8KMf8Wz+B0nSC09dLOn73pNGxfVugwiFVV+m
	0kEE6A63yBnewbtAPxzrVGzSB9WF3Du+LPUCiHFxoadzM0Y4tm8RcKzfcxD7L1fhZZtb
	EWE8BoVsZ4dsNwuN99TBpM0eapAte3jWNRn3jRDFuJ8IdkN7+L1JU13qudJ+08p9nAhM
	fo+A==
X-Received: by 10.68.235.6 with SMTP id ui6mr6578029pbc.45.1402698890830;
	Fri, 13 Jun 2014 15:34:50 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xk1sm27397061pac.21.2014.06.13.15.34.49 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 15:34:50 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 15:34:07 -0700
Message-Id: <1402698848-13759-5-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
Subject: [PATCH 5/6] Use INSANE_SKIP_${PN} = "installed-vs-shipped"
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
X-List-Received-Date: Fri, 13 Jun 2014 22:34:56 -0000

A number of recipes in recipes-ti install more files than are
packaged causing lots of QA errors.  We choose to ignore these.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 recipes-ti/bios/ti-biosutils_1.02.02.bb                               | 1 +
 recipes-ti/bios/ti-dspbios_5.41.11.38.bb                              | 2 ++
 recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb                 | 2 ++
 recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb              | 2 +-
 recipes-ti/devtools/ti-cgt6x_7.2.7.bb                                 | 2 ++
 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb                         | 2 ++
 recipes-ti/dmai/ti-dmai_svn.bb                                        | 1 +
 recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb                           | 1 +
 recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb                        | 1 +
 recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb | 2 +-
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb                     | 1 +
 recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb   | 1 +
 recipes-ti/xdais/ti-xdais_6.26.01.03.bb                               | 2 +-
 13 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-biosutils_1.02.02.bb
index 918f124..5b6b4f4 100644
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
+++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
@@ -6,3 +6,4 @@ PVsuffix = "_02"
 SRC_URI[biosutilstarball.md5sum] = "0654e9e72b0a6fc7a6575829c0cd90c9"
 SRC_URI[biosutilstarball.sha256sum] = "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
index 9e3b695..f60f6c0 100644
--- a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
+++ b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
@@ -5,3 +5,5 @@ PV = "5_41_11_38"
 SRC_URI[biosbin.md5sum] = "7fab13740c25f5b34b331bcdc759536e"
 SRC_URI[biosbin.sha256sum] = "96b8e090f79420a4c11d9c0c10d182d1d3b4afb48f11ec375c97b4c91970d0a0"
 
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
index bcb89b7..4a27b1d 100644
--- a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
+++ b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
@@ -8,3 +8,5 @@ SRC_URI += "file://bypass-GCArmv5T-used-is-sealed.patch"
 
 SRC_URI[cetarball.md5sum] = "4f755f77119e4da19ab5cc7ae7ccfdb4"
 SRC_URI[cetarball.sha256sum] = "17fa053719265e0901fe3c3f90c9204957c6d0f5351d6b3ba4900df58cb7300f"
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index ea9f389..5c87b4c 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -205,4 +205,4 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES += "ti-codecs-omap3530-server"
 FILES_ti-codecs-omap3530-server = "${installdir}/ti-codecs-server/*"
 
-
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
index aab1b96..a226600 100644
--- a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
+++ b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
@@ -9,3 +9,5 @@ PVwithdots = "7.2.7"
 SRC_URI[cgt6xbin.md5sum] = "71a0768a541fdebd9c35d44301019d1d"
 SRC_URI[cgt6xbin.sha256sum] = "211477f0142d603975544abe3c45cc3b77a3b38038158676c60812806378738b"
 
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
index b2db76c..7f00d9e 100644
--- a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
@@ -9,3 +9,5 @@ SRC_URI[xdcbin.md5sum] = "263aa11795670265551d36a8c77ad27d"
 SRC_URI[xdcbin.sha256sum] = "880b4e263850f2a3c0ea7352c5b6e0a86692361e26634c3b70dddc42c71231a5"
 
 S = "${WORKDIR}/ti/xdctools_${PV}"
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 3ac7a81..536bb78 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -36,3 +36,4 @@ SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=
                    file://r642-fix-config-bld.diff;striplevel=3 \
                  "
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
index a124b21..1d6fb00 100644
--- a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
+++ b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
@@ -14,3 +14,4 @@ SRC_URI += "file://dsplink-BKL-fix.patch \
 SRC_URI[dsplinktarball.md5sum] = "1bda596b631bd2f517edc70f6be4f2ca"
 SRC_URI[dsplinktarball.sha256sum] = "4b1bda89bd8465b887f5bcdf7b95018bc1d1f8968c0c44f8cbad2a9e1c52bcb7"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb b/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
index 9b03e9b..549e020 100644
--- a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
+++ b/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
@@ -7,3 +7,4 @@ SRC_URI_edma3lldsite = "sdo_tii/psp"
 SRC_URI[edma3lldbin.md5sum] = "b3c41cb946e2e4b94348fc6bcbe30b16"
 SRC_URI[edma3lldbin.sha256sum] = "617db3eadff33a88e3d42818c204f379906da3b312bc120092408043e7e2aaeb"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
index b7ea9b8..7abe793 100644
--- a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
+++ b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
@@ -5,4 +5,4 @@ PV = "2_26_00_01"
 SRC_URI[fctarball.md5sum] = "40b51cade2f9ae6e6f6dca73c17065af"
 SRC_URI[fctarball.sha256sum] = "3f7a12a51dfe87310828a31518d7ef8f9039e59269c0ca24f74a68433c235048"
 
-
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
index 2a67e6a..75a32da 100644
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
@@ -8,3 +8,4 @@ PV = "2_26_01_02"
 SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
 SRC_URI[sha256sum] = "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb b/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
index 759561f..195b177 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
+++ b/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
@@ -8,3 +8,4 @@ SRC_URI += "file://lpm-BKL-fix.patch"
 SRC_URI[lpmtarball.md5sum] = "3d05453df26dfc811de04839d74c2f2b" 
 SRC_URI[lpmtarball.sha256sum] = "7335959a6217df17289f81839e6c6948f31cc0797ebc5389edef7190ed3ea589"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
index f8bef79..0451b2d 100644
--- a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
+++ b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
@@ -5,4 +5,4 @@ PV = "6_26_01_03"
 SRC_URI[xdaistarball.md5sum] = "9b2bea3408254e737ec0d819a031adf6"
 SRC_URI[xdaistarball.sha256sum] = "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc30bc5296e98d5d43b0b5a237a0d"
 
-
+INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
1.8.3.2


