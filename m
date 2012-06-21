Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12742E01426
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 16:13:11 -0700 (PDT)
Received: by weyr3 with SMTP id r3so986338wey.35
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 16:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=nKbASlHO+3SSqGXeWQpTcnzXW5mT7kEpeq4W8mEzYTY=;
	b=TdRS1r4O489mQZU/Kj6sb7MLVoVvOLvwue7/rH9p45cVFYZLbQSj9trBeDJ4UJvrlI
	xnNGilNCYcfoUTjAr+z1KZ/HH7EaQ5P1SS+2THY+ahPV29kYxCzL5y2OF1INIQyZE5ZH
	RFf5E8LWPUWWHWodzZ+N1iKNvCOINqZV0J630MAf7lwcDdZDc8RfH4th64Au6bVkYCmF
	VxYpHhI2mUsVQBKwJtJLuKMFSts4ywtnHPuIp0+DIUXDCloHmny4gi7QnPxcMnIPFGsZ
	kfU4+HciGesF3LxGbgrv6WmPu53bo0ezGlMVyP3b2ktSIuGe29WjnC8D1Q6Kk2iqllcp
	aqZg==
Received: by 10.216.197.4 with SMTP id s4mr15553054wen.181.1340320389951;
	Thu, 21 Jun 2012 16:13:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A25C2.dip.t-dialin.net.
	[91.10.37.194])
	by mx.google.com with ESMTPS id k8sm93735657wia.6.2012.06.21.16.13.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 16:13:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 22 Jun 2012 01:19:37 +0200
Message-Id: <1340320778-912-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH 1/2] linux.inc: remove require linux-tools.inc
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 23:13:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

linux-tools.inc was removed in oe-core (perf has own package) [1].

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=b485f3e0e55ad62079ed0913970ff0620f4808ea

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-kernel/linux/linux.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 6996283..02f7cef 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -6,9 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 inherit kernel siteinfo
 
-# Try to build & install perf
-require recipes-kernel/linux/linux-tools.inc
-
 RPSRC = "http://www.rpsys.net/openzaurus/patches/archive"
 
 # Enable OABI compat for people stuck with obsolete userspace
-- 
1.7.4.4


