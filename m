Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61B71E00803; Mon, 18 Jan 2016 09:44:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40121E0088B
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 09:44:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B2FE9529C9; Mon, 18 Jan 2016 17:44:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160118174442.B2FE9529C9@arago-project.org>
Date: Mon, 18 Jan 2016 17:44:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omapdrm-pvr: bump SRCREV for AM57x/DRA7xx
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
X-List-Received-Date: Mon, 18 Jan 2016 17:44:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c9af6488651183962776f21482fb404126eb8b5c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c9af6488651183962776f21482fb404126eb8b5c

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Fri Dec 11 15:19:17 2015 +0000

omapdrm-pvr: bump SRCREV for AM57x/DRA7xx

* Fix use of freed GEM object
* Disable debug options in release build

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 7683dbf..4552fe1 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -19,7 +19,7 @@ BRANCH_ti43x = "am4/k4.1"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
+SRCREV_omap-a15 = "c53a5dfb9f4d5612c372ec8e252cb13a731c9c10"
 SRCREV_ti33x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
 SRCREV_ti43x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
 


