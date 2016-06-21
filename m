Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 378A0E00708; Mon, 20 Jun 2016 21:48:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5FC2E00708
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 21:48:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1C66A52A8E; Tue, 21 Jun 2016 04:48:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160621044839.1C66A52A8E@arago-project.org>
Date: Tue, 21 Jun 2016 04:48:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : amx3-cm3: update to the latest for am3 ddr fixes
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
X-List-Received-Date: Tue, 21 Jun 2016 04:48:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 667794c92b1359834c65e39b915bef4e349d584b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=667794c92b1359834c65e39b915bef4e349d584b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun 21 04:44:33 2016 +0000

amx3-cm3: update to the latest for am3 ddr fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 7d4626b..448a5d3 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -4,9 +4,9 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.1"
-PR = "r2"
+PR = "r3"
 
-SRCREV = "730f0695ca2dda65abcff5763e8f108517bc0d43"
+SRCREV = "97c2c32d0bc8ca0254710dcb5df055aa9a569ae6"
 BRANCH ?= "ti-v4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"


