Return-Path: <Yasir_Khan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 975C1E007CE; Tue, 26 Aug 2014 07:27:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ED2EE0078F
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 07:27:26 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XMHiX-00061r-H2 from Yasir_Khan@mentor.com ;
	Tue, 26 Aug 2014 07:27:25 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Aug 2014 07:27:25 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: meta-ti@yoctoproject.org
Message-Id: <1409063209-47771-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 26 Aug 2014 14:27:25.0408 (UTC)
	FILETIME=[DB548600:01CFC139]
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: [PATCH 1/5] linux-ti-staging_3.12: add missing dep on bc-native
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
Date: Tue, 26 Aug 2014 14:27:30 -0000
X-Original-Date: Tue, 26 Aug 2014 19:26:49 +0500
X-List-Received-Date: Tue, 26 Aug 2014 14:27:30 -0000

Add the missing dependency to resolve the following error.

|   BC      kernel/timeconst.h
| /bin/sh: 1: bc: not found
| make[1]: *** [kernel/timeconst.h] Error 127
| make: *** [kernel] Error 2
| make: *** Waiting for unfinished jobs....

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 427bd97..c6e7d42 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 inherit kernel
 
+DEPENDS += "bc-native"
+
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-- 
1.7.9.5


