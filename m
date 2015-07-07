Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C60EE00A2C; Tue,  7 Jul 2015 13:29:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B51EE00AA5
	for <meta-ti@yoctoproject.org>; Tue,  7 Jul 2015 13:29:02 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 448BC5298F; Tue,  7 Jul 2015 20:29:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150707202902.448BC5298F@arago-project.org>
Date: Tue,  7 Jul 2015 20:29:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : omap5-sgx-ddk-um-linux: Bug fixes for memory leak
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
X-List-Received-Date: Tue, 07 Jul 2015 20:29:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ad67b710ae424bdcb8c829af3c05fc3d3e828351
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ad67b710ae424bdcb8c829af3c05fc3d3e828351

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Jul  6 14:28:33 2015 +0000

omap5-sgx-ddk-um-linux: Bug fixes for memory leak

* Fix memory leak in Wayland WSEGL
* Refactor the code for print messages

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index f806ae8..2f3f6aa 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -4,9 +4,9 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git"
-SRCREV = "53be02a24a30a4c74eb48f2c84fda789bd95ab33"
+SRCREV = "b6e57ccf36fc8c36d988246bc7510f0dec42d991"
 
-PR = "r4"
+PR = "r7"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"


