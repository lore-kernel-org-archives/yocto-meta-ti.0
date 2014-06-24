Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0664EE003D2; Mon, 23 Jun 2014 20:16:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1133E00283
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 20:16:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N002C9L3B8T00@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Jun 2014 22:16:23 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E487320368; Mon,
	23 Jun 2014 23:16:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Jun 2014 23:16:21 -0400
Message-id: <1403579781-6436-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403579781-6436-1-git-send-email-denis@denix.org>
References: <1403579781-6436-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] linux-ti-staging: temporarily lower default priority due to sgx breakage
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
X-List-Received-Date: Tue, 24 Jun 2014 03:16:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 32c6f5a..5c8022b 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -3,6 +3,8 @@ DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
-- 
2.0.0


