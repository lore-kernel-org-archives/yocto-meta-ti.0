Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77B11E008CC; Tue, 10 Feb 2015 12:51:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F861E00717
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:51:03 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AKp2Ji009002
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 14:51:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKp1SS029957
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 14:51:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 14:51:01 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1AKovHv032253;	Tue, 10 Feb 2015 14:50:59 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 15:50:56 -0500
Message-ID: <1423601456-8302-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] libp11: Add recipe for libp11
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
X-List-Received-Date: Tue, 10 Feb 2015 20:51:07 -0000
Content-Type: text/plain

- Provides PKCS11 abstraction library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- Removed redundant PROVIDES definition
---
---
 recipes-ti/libp11/libp11_git.bb |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 recipes-ti/libp11/libp11_git.bb

diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
new file mode 100644
index 0000000..459c751
--- /dev/null
+++ b/recipes-ti/libp11/libp11_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "PKCS11 abstraction library"
+LICENSE = "LGPL2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
+SECTION = "libs"
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


