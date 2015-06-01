Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98BAEE00A6C; Mon,  1 Jun 2015 07:49:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C2AFE00A4B
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:49:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 571AC52A3F; Mon,  1 Jun 2015 14:49:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601144910.571AC52A3F@arago-project.org>
Date: Mon,  1 Jun 2015 14:49:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : common-csl-ip: Seperate source and version into include file.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:49:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: cb8640e9074df3def69f7eaddd99e6859eb26e14
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cb8640e9074df3def69f7eaddd99e6859eb26e14

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 20:10:36 2015 +0000

common-csl-ip: Seperate source and version into include file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip.inc    |   10 ++++++++++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb |   13 +++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
new file mode 100644
index 0000000..1fa34f3
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Chip support library low level interface"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
+
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
+SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
index 01f7fc5..8f622a5 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -1,15 +1,8 @@
-DESCRIPTION = "Chip support library low level interface"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
-
-COMPATIBLE_MACHINE = "keystone"
-ALLOW_EMPTY_${PN} = "1"
+require common-csl-ip.inc
 
 PR = "r3"
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
-# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
-SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
+
+ALLOW_EMPTY_${PN} = "1"
 
 S = "${WORKDIR}/git"
 


