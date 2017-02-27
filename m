Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80951E00726; Mon, 27 Feb 2017 12:43:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F5F9E0052B
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 12:43:15 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 75A7C52980; Mon, 27 Feb 2017 20:43:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170227204314.75A7C52980@arago-project.org>
Date: Mon, 27 Feb 2017 20:43:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Dan Murphy : uboot-ti-staging: update to ti2017.00-rc2 tag
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
X-List-Received-Date: Mon, 27 Feb 2017 20:43:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty-next
Commit: 9961951d569d13be195535e06d960169d00926f9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9961951d569d13be195535e06d960169d00926f9

Author: Dan Murphy <dmurphy@ti.com>
Date:   Tue Feb 28 01:19:13 2017 +0000

uboot-ti-staging: update to ti2017.00-rc2 tag

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index bd8b9ca..ebf29cd 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -2,4 +2,4 @@ require u-boot-ti.inc
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "438d0991e5a913323f6e38293a3d103d82284d9d"
+SRCREV = "3ca4ec25c8a6a3586601e8926bac4f5861ccaa2d"


