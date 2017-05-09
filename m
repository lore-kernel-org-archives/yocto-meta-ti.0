Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1FBBE00B2F; Tue,  9 May 2017 11:16:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71418E00AA2
	for <meta-ti@yoctoproject.org>; Tue,  9 May 2017 11:16:34 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A7B2B20BEE;
	Tue,  9 May 2017 18:06:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cjU5FRChphw6; Tue,  9 May 2017 18:06:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80A3620B85;
	Tue,  9 May 2017 18:06:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E19931624B3;
	Tue,  9 May 2017 14:06:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue,  9 May 2017 14:06:47 -0400
Message-Id: <1494353208-50981-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494353208-50981-1-git-send-email-denis@denix.org>
References: <1494353208-50981-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/3] layer.conf: update with "doxygen" host tool dependency for openmp-rtos
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
X-List-Received-Date: Tue, 09 May 2017 18:16:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also, drop host tool for CCS, as it no longer provided.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b59effa..87a28de 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -28,5 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     multiprocmgr \
 "
 
-# Required by CCS installer
-HOSTTOOLS += "unzip"
+# Required by openmp-rtos "docs" target
+HOSTTOOLS += "doxygen"
-- 
2.7.4


