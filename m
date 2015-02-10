Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1CBFE00988; Tue, 10 Feb 2015 13:28:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7CCDE008CF
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 13:28:32 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1ALSVdb004592
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:31 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ALSUw6032386
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 15:28:30 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1ALSCZl030822;	Tue, 10 Feb 2015 15:28:28 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 16:28:10 -0500
Message-ID: <1423603690-30013-4-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
References: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] iqn2-lld: Add recipe for iqn2 lld test code
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
X-List-Received-Date: Tue, 10 Feb 2015 21:28:35 -0000
Content-Type: text/plain

- Adds test code for iqn2 peripheral low level driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
new file mode 100644
index 0000000..f1aa9e4
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI IQN2 peripheral module low level driver test binaries"
+
+DEPENDS = "common-csl-ip iqn2-lld dfe-lld"
+
+include iqn2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
+
+do_compile () {
+	oe_runmake clean DEVICE=k2l
+	oe_runmake tests DEVICE=k2l
+}
+
+do_install () {
+	oe_runmake installbin DEVICE=k2l IQN2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}
-- 
1.7.9.5


