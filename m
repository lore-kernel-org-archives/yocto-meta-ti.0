Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6659E00CE9; Tue,  8 Sep 2015 08:58:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01119E00C9A
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 08:57:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 42026529D7; Tue,  8 Sep 2015 15:57:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908155755.42026529D7@arago-project.org>
Date: Tue,  8 Sep 2015 15:57:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with latest connectivity changes
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
X-List-Received-Date: Tue, 08 Sep 2015 15:58:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: deca190cc85b7fc97a7355b1a099ba3ebd81547d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=deca190cc85b7fc97a7355b1a099ba3ebd81547d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep  8 20:55:11 2015 +0000

linux-ti-staging: update with latest connectivity changes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index a423ca7..c1ca9c7 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -50,11 +50,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "3adfb503c87468c448ee30191511184fb0c65dd0"
+SRCREV = "72c971cc113833c7a1f22a3c0ac3260f3a9a3378"
 PV = "4.1.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "h"
+MACHINE_KERNEL_PR_append = "i"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


