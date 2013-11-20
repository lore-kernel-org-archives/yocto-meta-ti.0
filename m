Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B0FCE0055C
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 02:38:55 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKAcs8I004938
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 04:38:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKAcs5J010742
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 04:38:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 04:38:54 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKAcqSB032524	for
	<meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 04:38:53 -0600
Date: Wed, 20 Nov 2013 16:08:52 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131120103852.GA20454@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] ti: libdce: Library for invoking the hw accelerated codec on IVA-HD.
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
X-List-Received-Date: Wed, 20 Nov 2013 10:38:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 recipes-ti/libdce/libdce_git.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-ti/libdce/libdce_git.bb

diff --git a/recipes-ti/libdce/libdce_git.bb b/recipes-ti/libdce/libdce_git.bb
new file mode 100644
index 0000000..fcb9984
--- /dev/null
+++ b/recipes-ti/libdce/libdce_git.bb
@@ -0,0 +1,14 @@
+inherit autotools pkgconfig
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
+
+PR = "r0"
+
+DEPENDS = "libdrm ti-ipc"
+
+SRC_URI = "git://git.ti.com/glsdk/libdce2.git;protocol=git"
+SRCREV = "0aa6627d59a2a7c4837a40fe67f610b3318d23c1"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_DIR_TARGET}/usr/include/ti/ipc/mm"
-- 
1.7.9.5


