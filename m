Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7EF0E008BC; Mon,  2 Feb 2015 12:50:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7990BE00824
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 12:50:25 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12KoPH7004701
	for <meta-ti@yoctoproject.org>; Mon, 2 Feb 2015 14:50:25 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12KoO9D009647
	for <meta-ti@yoctoproject.org>; Mon, 2 Feb 2015 14:50:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Feb 2015 14:50:24 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t12KoNws004099;	Mon, 2 Feb 2015 14:50:23 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 2 Feb 2015 15:50:20 -0500
Message-ID: <1422910220-24142-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libp11: Add recipe for libp11
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
X-List-Received-Date: Mon, 02 Feb 2015 20:50:27 -0000
Content-Type: text/plain

- Provides PKCS11 abstraction library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/libp11/libp11_git.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-ti/libp11/libp11_git.bb

diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
new file mode 100644
index 0000000..87fc10b
--- /dev/null
+++ b/recipes-ti/libp11/libp11_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "PKCS11 abstraction library"
+LICENSE = "LGPL2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
+SECTION = "libs"
+PROVIDES = "libp11"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libtool"
+RDEPENDS_${PN} = "ti-softhsmv2"
+
+SRC_URI = "git://git.ti.com/keystone-linux/libp11.git;protocol=git;branch=${BRANCH}"
+BRANCH="master"
+# Following commit corresponds to DEV.LIBP11-01.03.00.00
+SRCREV = "43c4f63a8d803fde2bcd8e4f8969e5fe9edf0e33"
+PV = "1.3.0.0"
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5


