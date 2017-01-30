Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCBC8E003C1; Mon, 30 Jan 2017 12:51:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 703ABE00405
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2017 12:51:56 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9E93A52AD3; Mon, 30 Jan 2017 20:51:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170130205155.9E93A52AD3@arago-project.org>
Date: Mon, 30 Jan 2017 20:51:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gowtham Tammana : ti-gc320-driver: Update SRCREV
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
X-List-Received-Date: Mon, 30 Jan 2017 20:51:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 0d128cff49f185651e6cf219dcb3d41320a5b23b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0d128cff49f185651e6cf219dcb3d41320a5b23b

Author: Gowtham Tammana <g-tammana@ti.com>
Date:   Mon Jan 30 21:55:57 2017 +0000

ti-gc320-driver: Update SRCREV

This update includes the following
  - Remove dependency on dmac_flus/inv/clean_range
  - Remove spurious page count increment

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 8ad7e4b..976904f 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -11,7 +11,7 @@ PR = "${MACHINE_KERNEL_PR}"
 # Need to branch out with ${PV} var
 BRANCH = "ti-${PV}-k4.4"
 
-SRCREV = "65887c911db495fb66c6847c8b6eadc76c7470f4"
+SRCREV = "7c0f4dc755dc2ecb95195ed42ef24fea16ef2667"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"


