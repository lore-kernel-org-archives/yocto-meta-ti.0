Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B736FE0099B; Thu, 12 Feb 2015 08:03:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30AA7E00994
	for <meta-ti@yoctoproject.org>; Thu, 12 Feb 2015 08:03:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1D4315297F; Thu, 12 Feb 2015 16:03:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150212160302.1D4315297F@arago-project.org>
Date: Thu, 12 Feb 2015 16:03:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.14.33 with A&D, connectivity, platform and rpmsg updates
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
X-List-Received-Date: Thu, 12 Feb 2015 16:03:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: e757a6de61b5c8110ea7a3f04fbbf4202c228764
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e757a6de61b5c8110ea7a3f04fbbf4202c228764

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 12 21:31:37 2015 +0000

linux-ti-staging: update to 3.14.33 with A&D, connectivity, platform and rpmsg updates

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 48219d5..a154a42 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -45,8 +45,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "476152084592bce5316990f7e0008052c0b70aad"
-PV = "3.14.31"
+SRCREV = "378082268043f955f26c532a5a1be33f6dccb043"
+PV = "3.14.33"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


