Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C244E00AB0; Mon,  9 Nov 2015 11:34:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DE8EE00A81
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:09 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BDEE952A64; Mon,  9 Nov 2015 19:34:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193408.BDEE952A64@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap5-sgx-ddk-um-linux: explicitly specify RDEPENDS on libdrm
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dca006ff39b42c4023299cebff79753dc2baf68e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dca006ff39b42c4023299cebff79753dc2baf68e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep  9 03:42:13 2015 +0000

omap5-sgx-ddk-um-linux: explicitly specify RDEPENDS on libdrm

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 55fa33a..cd01d6f 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -22,6 +22,8 @@ inherit update-rc.d
 PR = "r11"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
+RDEPENDS_${PN} += "libdrm"
+
 RREPLACES_${PN} = "libegl libgles1 libgles2"
 RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
 RREPLACES_${PN}-dbg = "libegl-dbg"


