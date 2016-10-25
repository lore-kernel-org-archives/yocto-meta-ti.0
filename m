Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF094E00C93; Mon, 24 Oct 2016 19:29:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD994E00C25
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2016 19:29:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 185B652AC4; Tue, 25 Oct 2016 02:29:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025022934.185B652AC4@arago-project.org>
Date: Tue, 25 Oct 2016 02:29:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : ti-sgx-ddk-um: remove invalid tests for sgx
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
X-List-Received-Date: Tue, 25 Oct 2016 02:29:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f227a0045f3e860051d727067fab1586da828692
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f227a0045f3e860051d727067fab1586da828692

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Thu Oct 13 18:37:41 2016 +0000

ti-sgx-ddk-um: remove invalid tests for sgx

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index b905ac0..9d0c406 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "4cdbb6b192fc5cac53695faca3c3f8be16ca871d"
+SRCREV = "f65d06843ef21964e266a7618c1529840653d563"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r14"
+PR = "r15"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"


