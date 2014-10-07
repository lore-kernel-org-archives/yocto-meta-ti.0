Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CA47E00853; Tue,  7 Oct 2014 12:24:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96DE1E0084F
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:24:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 04647529D1; Tue,  7 Oct 2014 19:23:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141007192358.04647529D1@arago-project.org>
Date: Tue,  7 Oct 2014 19:23:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : omap5-sgx-ddk-um-linux: Updated SRCREV to include bugfixes
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
X-List-Received-Date: Tue, 07 Oct 2014 19:24:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6c4d8ab62bacd54006605c1e6baca58d0fb82dd2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6c4d8ab62bacd54006605c1e6baca58d0fb82dd2

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Tue Sep 23 22:00:35 2014 +0000

omap5-sgx-ddk-um-linux: Updated SRCREV to include bugfixes

* This version is compatible with version Kernel 3.12

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index b875328..37ea088 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -4,9 +4,9 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git"
-SRCREV = "994922a5655c63b05343a9238cb30e6ef61744be"
+SRCREV = "0af11b676900de5a3e5550728fe18acd88c29848"
 
-PR = "r2"
+PR = "r3"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"


