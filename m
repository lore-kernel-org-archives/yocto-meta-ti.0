Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2638AE00BD5; Thu, 22 Oct 2015 10:01:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B1F8E00B52
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 10:01:02 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C07F952A9D; Thu, 22 Oct 2015 17:01:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151022170101.C07F952A9D@arago-project.org>
Date: Thu, 22 Oct 2015 17:01:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : cmem: Bump SRCREV to support LPAE in DT processing
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
X-List-Received-Date: Thu, 22 Oct 2015 17:01:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 44e55b67814f3f629c770fbe4a22c9a815c5656b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=44e55b67814f3f629c770fbe4a22c9a815c5656b

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Oct 22 20:57:31 2015 +0000

cmem: Bump SRCREV to support LPAE in DT processing

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 0d3e918..ddf50a4 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e27
 
 BRANCH ?= "lu-next"
 # This corresponds to version 4.10.02.03
-SRCREV = "d47ac635699da6bee6daff31b87b0123e13af4ac"
+SRCREV = "00241c45f810c8b8e4f5ac66c3323fec8e43b621"
 
-PV = "4.10.02.03+git${SRCPV}"
+PV = "4.10.02.04+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


