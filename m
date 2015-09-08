Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E610E00B6D; Tue,  8 Sep 2015 08:58:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB601E00CBC
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 08:57:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8021352A02; Tue,  8 Sep 2015 15:57:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908155758.8021352A02@arago-project.org>
Date: Tue,  8 Sep 2015 15:57:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omapdrm-pvr: Bump SRCREV for am4/k4.1 branch
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
X-List-Received-Date: Tue, 08 Sep 2015 15:58:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 27f6c6ff4002b9145afe2429a08a57e17597b34c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=27f6c6ff4002b9145afe2429a08a57e17597b34c

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Tue Sep  8 20:38:35 2015 +0000

omapdrm-pvr: Bump SRCREV for am4/k4.1 branch

* Sync up with the current kernel code

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 0978b43..15ccb54 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -20,8 +20,8 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
 S = "${WORKDIR}/git"
 
 SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
-SRCREV_ti33x = "696eaf6cff0e4ab6abedc3ff639ec158f8a6177f"
-SRCREV_ti43x = "696eaf6cff0e4ab6abedc3ff639ec158f8a6177f"
+SRCREV_ti33x = "ad7c4fa37897b59b6d9ddabb9aba03fd515ffa29"
+SRCREV_ti43x = "ad7c4fa37897b59b6d9ddabb9aba03fd515ffa29"
 
 PVR_NULLDRM_ti33x = "1"
 PVR_NULLDRM_ti43x = "1"


