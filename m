Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C472E009F5; Wed, 30 Aug 2017 15:42:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B22B7E00C7A
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:42:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UMgS42011585
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504132948;
	bh=1E9u0maY4AG7jeWSm/KOOG02ITW+ymKytyu0VrtKabo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T97YryVXRb1ZODZZNoJNk72C4aBwo18WvRrWbsXN01+FZkUXw7WDVPOTu6CKHr/G+
	I6QgnsJSq642kDXuJQKOZlB1VtyA9aQmmM9SZJCjEwKuViVNyX1WSho3HYUPdawztX
	z8exHSLKNti5UlyWJhruW4Z1KBmnfBr11LeQMcmA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgSwV009795
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:28 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 17:42:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 17:42:28 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgL0f004119;
	Wed, 30 Aug 2017 17:42:27 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 30 Aug 2017 18:42:14 -0400
Message-ID: <1504132936-7725-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 5/7] ti-ndk: Adding recipe for ti-ndk
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
X-List-Received-Date: Wed, 30 Aug 2017 22:42:29 -0000
Content-Type: text/plain

Upstreaming recipe for TI RTOS Networking development kit

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v3 - Removed references to srcipk
 v2 - Added summmary  & merged in to a single recipe

 recipes-ti/ndk/ti-ndk.inc           | 21 +++++++++++++++++++++
 recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 13 +++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-ti/ndk/ti-ndk.inc
 create mode 100644 recipes-ti/ndk/ti-ndk_2.25.01.11.bb

diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
new file mode 100644
index 0000000..09d9ea0
--- /dev/null
+++ b/recipes-ti/ndk/ti-ndk.inc
@@ -0,0 +1,21 @@
+SUMMARY = "TI RTOS_Networking"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/index.html"
+SECTION = "devel"
+LICENSE = "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+
+S = "${WORKDIR}/ndk_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=ndkzip"
+
+do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${NDK_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
new file mode 100644
index 0000000..d5d926b
--- /dev/null
+++ b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
@@ -0,0 +1,13 @@
+require ti-ndk.inc
+
+PV = "2_25_01_11"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=80a8d9b76cf700929d3f5b6df09052d6"
+
+SRC_URI[ndkzip.md5sum] = "e42bfcc8c3a6d183d60f26ec01ccc79b"
+SRC_URI[ndkzip.sha256sum] = "a15bc9b570dc0628dd8b8c3665037a162610a6f86c5f17ebb6a329d3db60f071"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_SYSROOT_STRIP = "1"
-- 
1.9.1


