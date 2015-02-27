Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4539CE008CE; Thu, 26 Feb 2015 17:33:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E13D3E0077E
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 17:33:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2CBCD529AF; Fri, 27 Feb 2015 01:33:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150227013301.2CBCD529AF@arago-project.org>
Date: Fri, 27 Feb 2015 01:33:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with fixes from feature trees
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
X-List-Received-Date: Fri, 27 Feb 2015 01:33:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: bb97d02d5f6388326bd32a932dbeb98920d61d60
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb97d02d5f6388326bd32a932dbeb98920d61d60

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 26 14:13:14 2015 -0500

linux-ti-staging: update with fixes from feature trees

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index a154a42..7fcea58 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -45,11 +45,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "378082268043f955f26c532a5a1be33f6dccb043"
+SRCREV = "b984449dc3a451dbbb669467718b01e3855df64f"
 PV = "3.14.33"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


