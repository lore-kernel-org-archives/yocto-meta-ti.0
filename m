Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B29DE00A4F; Fri,  4 Dec 2015 19:12:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1ED22E00A4F
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AC99B52AC8; Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031210.AC99B52AC8@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: e-ruei1@ti.com : omapdrm-pvr: Bump SRCREV of ti33x and ti43x to pick up the latest DDK KM fix
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b5f84f1b1b016f3d0c513eee528efe204a33a6bf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b5f84f1b1b016f3d0c513eee528efe204a33a6bf

Author: e-ruei1@ti.com <e-ruei1@ti.com>
Date:   Sat Dec  5 04:37:08 2015 +0000

omapdrm-pvr:Bump SRCREV of ti33x and ti43x to pick up the latest DDK KM fix

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 50df3d9..7683dbf 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -20,8 +20,8 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
 S = "${WORKDIR}/git"
 
 SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
-SRCREV_ti33x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
-SRCREV_ti43x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
+SRCREV_ti33x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
+SRCREV_ti43x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
 
 PVR_NULLDRM_ti33x = "1"
 PVR_NULLDRM_ti43x = "0"


