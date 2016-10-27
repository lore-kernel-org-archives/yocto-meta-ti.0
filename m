Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 706DEE00D30; Thu, 27 Oct 2016 16:44:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6E39E00CEA
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 16:44:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9B54D529A0; Thu, 27 Oct 2016 23:44:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161027234406.9B54D529A0@arago-project.org>
Date: Thu, 27 Oct 2016 23:44:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Khem Raj : ti-unpack.inc: Use absolute paths in require directive
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
X-List-Received-Date: Thu, 27 Oct 2016 23:44:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1124b4bfd069cf3d7fbb1a86277dc849a184007e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1124b4bfd069cf3d7fbb1a86277dc849a184007e

Author: Khem Raj <raj.khem@gmail.com>
Date:   Wed Oct 26 06:08:57 2016 +0000

ti-unpack.inc: Use absolute paths in require directive

This helps in using this inc file from other BSP
layers which are dependent on meta-ti

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-eula-unpack.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 912cd18..ead0610 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -9,7 +9,7 @@
 #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
 #                       the output in some internal directory
 
-require ../includes/ti-unpack.inc
+require recipes-ti/includes/ti-unpack.inc
 
 TI_BIN_UNPK_ARGS = "--mode console"
 


