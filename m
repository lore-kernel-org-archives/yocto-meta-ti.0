Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61A00E00A92; Mon,  9 Nov 2015 11:34:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A279AE007C9
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:06 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 191CC52A5A; Mon,  9 Nov 2015 19:34:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193406.191CC52A5A@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omapdrm-pvr: disable PVR_NULLDRM to support DRI_DRM for AM4
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 0690c3fc4e17c27e4e92f4d334b74343a47b0577
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0690c3fc4e17c27e4e92f4d334b74343a47b0577

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Thu Nov  5 01:53:14 2015 +0000

omapdrm-pvr: disable PVR_NULLDRM to support DRI_DRM for AM4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 5d5119e..50df3d9 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -24,7 +24,7 @@ SRCREV_ti33x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
 SRCREV_ti43x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
 
 PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "1"
+PVR_NULLDRM_ti43x = "0"
 PVR_NULLDRM_omap-a15 = "0"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'


