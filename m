Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BA35E00B6F; Wed, 28 May 2014 18:41:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RCVD_IN_DNSWL_NONE,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from vms173017pub.verizon.net (unknown [206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33A1DE00B6A
	for <meta-ti@yoctoproject.org>; Wed, 28 May 2014 18:41:47 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6B00MLCBCNR360@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 28 May 2014 20:41:26 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E740A20086; Wed,
	28 May 2014 21:41:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 28 May 2014 21:41:08 -0400
Message-id: <1401327668-3680-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] linux-ti-staging: lower the preference for 3.15 recipe for now
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
X-List-Received-Date: Thu, 29 May 2014 01:41:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

* It breaks libgles/SGX due to missing omafb/omafb.h header
* Will be switching to 3.14 instead for LTS

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.15.bb | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.9.3


