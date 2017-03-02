Return-Path: <gthomas@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F8D9E008D0; Thu,  2 Mar 2017 00:33:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD831E00826
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 00:33:39 -0800 (PST)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 2F8DE68A019; Thu,  2 Mar 2017 08:33:38 +0000 (GMT)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id AE2B668A019;
	Thu,  2 Mar 2017 08:33:37 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 4C84467402F9; Thu,  2 Mar 2017 09:33:37 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: meta-ti@yoctoproject.org
Date: Thu,  2 Mar 2017 09:33:35 +0100
Message-Id: <1488443615-2456-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.7.4
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] beaglebone.inc: Update use of obsolete bitbake API
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
X-List-Received-Date: Thu, 02 Mar 2017 08:33:44 -0000

The bb.data.getVar() API has been deprecated & removed.  This change
follows that change and allows MACHINE=beaglebone to work again.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 conf/machine/include/beaglebone.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
index f76ad3d..b10146d 100644
--- a/conf/machine/include/beaglebone.inc
+++ b/conf/machine/include/beaglebone.inc
@@ -1,5 +1,5 @@
 python () {
-    layers = bb.data.getVar("BBFILE_COLLECTIONS", d, 1)
+    layers = d.getVar("BBFILE_COLLECTIONS", True)
     if not layers:
         return
     if "yoctobsp" in layers:
-- 
2.7.4


