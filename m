Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFBEFE00ACF; Tue, 13 Jun 2017 11:47:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 584D9E00888
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 11:47:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C251A20B7D;
	Tue, 13 Jun 2017 18:47:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AA3rnONLnLzH; Tue, 13 Jun 2017 18:47:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0C73207AF;
	Tue, 13 Jun 2017 18:47:45 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4A1E41624F5;
	Tue, 13 Jun 2017 14:47:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 13 Jun 2017 14:47:44 -0400
Message-Id: <1497379664-2671-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] omapl138, omapl1: add "omapl1" SOC family as superset of omapl138
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
X-List-Received-Date: Tue, 13 Jun 2017 18:47:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/{omapl138.inc => omapl1.inc} | 2 +-
 conf/machine/include/omapl138.inc                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 copy conf/machine/include/{omapl138.inc => omapl1.inc} (64%)

diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl1.inc
similarity index 64%
copy from conf/machine/include/omapl138.inc
copy to conf/machine/include/omapl1.inc
index 1949642..fb10af0 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl1.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY = "omapl138"
+SOC_FAMILY = "omapl1"
 require conf/machine/include/soc-family.inc
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl138.inc
index 1949642..931995f 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY = "omapl138"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/omapl1.inc
+SOC_FAMILY_append = ":omapl138"
-- 
2.7.4


