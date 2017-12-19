Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 903EEE00D7E; Mon, 18 Dec 2017 22:01:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC150E00CFF
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 22:01:37 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE5BC20AF3;
	Tue, 19 Dec 2017 06:01:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8Awf1Fxpm-pd; Tue, 19 Dec 2017 06:01:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AF85520B3A;
	Tue, 19 Dec 2017 06:01:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 406101631FF;
	Tue, 19 Dec 2017 01:01:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 19 Dec 2017 01:01:32 -0500
Message-Id: <1513663292-22396-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513663292-22396-1-git-send-email-denis@denix.org>
References: <1513663292-22396-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 4/4] layer.conf: remove doxygen from HOSTTOOLS, depend on doxygen-native instead
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
X-List-Received-Date: Tue, 19 Dec 2017 06:01:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4c2cf5f..a07e62f 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -27,6 +27,3 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     qmss-lld \
     multiprocmgr \
 "
-
-# Required by openmp-rtos "docs" target
-HOSTTOOLS_NONFATAL += "doxygen"
-- 
2.7.4


