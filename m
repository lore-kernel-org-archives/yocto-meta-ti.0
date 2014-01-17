Return-Path: <Samuli.Piippo@digia.com>
Received: from smtp1.digia.com (smtp1.digia.com [82.118.214.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E4B4E0086D
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 06:03:06 -0800 (PST)
Received: from smtp1.digia.com (unknown [127.0.0.1])
	by IMSVA80 (Postfix) with ESMTP id 92DAF37005B
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 16:03:04 +0200 (EET)
Received: from IT-EXCAS01-HKI.it.local (unknown [10.9.52.70])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp1.digia.com (Postfix) with ESMTP id 854AE370050
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 16:03:04 +0200 (EET)
Received: from piippo.it.local (10.9.5.71) by IT-EXCAS01-HKI.it.local
	(10.9.52.75) with Microsoft SMTP Server (TLS) id 14.2.283.3;
	Fri, 17 Jan 2014 16:03:03 +0200
From: Samuli Piippo <samuli.piippo@digia.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 Jan 2014 16:02:58 +0200
Message-ID: <1389967378-12001-1-git-send-email-samuli.piippo@digia.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [10.9.5.71]
Subject: [PATCH] libgles-omap3: add missing INSANE_SKIP for es9
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
X-List-Received-Date: Fri, 17 Jan 2014 14:03:07 -0000
Content-Type: text/plain

es9 package was missing INSANE_SKIP used for other esX packages.

Signed-off-by: Samuli Piippo <samuli.piippo@digia.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 3df0fdc..60bcad5 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -283,6 +283,7 @@ INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
 INSANE_SKIP_${PN}-blitwsegl = "ldflags"
 INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
-- 
1.8.3.2


