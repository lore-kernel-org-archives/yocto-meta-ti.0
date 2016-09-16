Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D4EEE00CAA; Fri, 16 Sep 2016 09:19:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8DB3E00CB4
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F2B86529AA; Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161910.F2B86529AA@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 2.0.2.0
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: d1578d2766e62f65949c0f0c4ba9b2f5b3b95b2c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d1578d2766e62f65949c0f0c4ba9b2f5b3b95b2c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Sep 15 09:07:49 2016 +0000

mpm-transport: Update to new version 2.0.2.0

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 280a5e1..bfbf85b 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -15,10 +15,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.01.02
-SRCREV = "5c1f177b8d5802227dfe7e86fc026620e1e10189"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00
+SRCREV = "696a9ec37559b671860ef393194c6032b7b6d9ef"
 
-PV = "2.0.1.2"
+PV = "2.0.2.0"
 PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"


