Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B51C6E009B8; Fri, 23 Dec 2016 18:09:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94BDDE00843
	for <meta-ti@yoctoproject.org>; Fri, 23 Dec 2016 18:09:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E936952A7B; Sat, 24 Dec 2016 02:09:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161224020912.E936952A7B@arago-project.org>
Date: Sat, 24 Dec 2016 02:09:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gowtham Tammana : ti-gc320-driver: add support for RT kernel
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
X-List-Received-Date: Sat, 24 Dec 2016 02:09:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 059a6b1c1794ea642872b1f83a9b8b2187e40f1c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=059a6b1c1794ea642872b1f83a9b8b2187e40f1c

Author: Gowtham Tammana <g-tammana@ti.com>
Date:   Thu Dec 22 11:43:12 2016 -0600

ti-gc320-driver: add support for RT kernel

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 9344e30..8ad7e4b 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
 BRANCH = "ti-${PV}-k4.4"
 
-SRCREV = "7a2b06ad1df46a274336f7ae0e24a9d67e72cd66"
+SRCREV = "65887c911db495fb66c6847c8b6eadc76c7470f4"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"


