Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CAD81E00964; Tue, 10 Feb 2015 13:28:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B504E008CC
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 13:28:28 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1ALSR1C026653
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ALSQhY025014
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 15:28:25 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1ALSCZk030822;	Tue, 10 Feb 2015 15:28:23 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 16:28:09 -0500
Message-ID: <1423603690-30013-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
References: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/4] dfe-lld: Add recipe for dfe test code
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
X-List-Received-Date: Tue, 10 Feb 2015 21:28:33 -0000
Content-Type: text/plain

- Adds test code for Digital front end low level driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld-test_git.bb

diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
new file mode 100644
index 0000000..acaaf63
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "TI Digital Radio Front End lld test application"
+
+DEPENDS = "common-csl-ip dfe-lld iqn2-lld"
+
+include dfe-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	oe_runmake clean DEVICE=k2l
+	oe_runmake tests DEVICE=k2l
+	oe_runmake tests DEVICE=k2l USEDYNAMIC_LIB=yes
+}
+
+do_install () {
+	oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}
-- 
1.7.9.5


