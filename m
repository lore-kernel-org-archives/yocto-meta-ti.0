Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7F24E00A44; Thu, 29 May 2014 12:13:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4D9AE00A44
	for <meta-ti@yoctoproject.org>; Thu, 29 May 2014 12:13:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B35BB52A28; Thu, 29 May 2014 19:13:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140529191325.B35BB52A28@arago-project.org>
Date: Thu, 29 May 2014 19:13:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: lower the preference for 3. 15 recipe for now
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
X-List-Received-Date: Thu, 29 May 2014 19:13:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: da24e976246146c6a42244998eedbce41d000c5c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=da24e976246146c6a42244998eedbce41d000c5c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 29 07:41:08 2014 +0000

linux-ti-staging: lower the preference for 3.15 recipe for now

* It breaks libgles/SGX due to missing omafb/omafb.h header
* Will be switching to 3.14 instead for LTS

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.15.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
index a55b581..64db8da 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.15.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
@@ -3,6 +3,8 @@ DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc


