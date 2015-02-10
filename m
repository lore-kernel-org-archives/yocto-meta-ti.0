Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 850C7E00717; Tue, 10 Feb 2015 15:04:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4285DE002F9
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:04:42 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AN4fCn018071
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 17:04:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AN4ecf012706
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 17:04:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 17:04:40 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1AN4bl2015565;	Tue, 10 Feb 2015 17:04:38 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 18:04:35 -0500
Message-ID: <1423609475-4356-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] engine-pkcs11: Add recipe for PKCS11 engine
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
X-List-Received-Date: Tue, 10 Feb 2015 23:04:48 -0000
Content-Type: text/plain

- Provides OpenSSL PKCS11 engine

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
new file mode 100644
index 0000000..226beac
--- /dev/null
+++ b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "OpenSSL PKCS11 engine"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=471dacb7f0586e35729f422b8098585f"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libtool libp11"
+
+PV = "1.3.0.0"
+BRANCH="master"
+# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.00
+SRCREV = "0b14500b0ea8b37453b6d93aac02278465e7e732"
+
+SRC_URI = "git://git.ti.com/keystone-linux/engine-pkcs11.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}/engines/*.so*"
+FILES_${PN}-dbg += "${libdir}/engines/.debug"
-- 
1.7.9.5


