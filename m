Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2808FE00348
	for <meta-ti@yoctoproject.org>; Thu,  6 Dec 2012 10:04:22 -0800 (PST)
Received: by mail-ie0-f179.google.com with SMTP id k14so10736209iea.24
	for <meta-ti@yoctoproject.org>; Thu, 06 Dec 2012 10:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=hBvpt7s1/xyXRiuGjAdDi5mPexW+l8aaAuXzb2BSyE0=;
	b=Bd5/76jOeD1+30pkSJ2Pujt2DAAEhb4TsJCwtp4TldOmXxTX8jb+pSaruQ1Gyz0tgA
	Qd6IrrXBM/nQko4qe2DBoRBWdSmrN1VFDa6nNtxZ5JqhnryxkSOfhQwNrelWlPlU06vK
	6No/aUScSODUqrscRLa6LkYvwU8XsfLddL9x2d7wObNwcj81rDisSMRnGWqkkVso9cQM
	ODSokLRccs/TV7gVk4FGsNJBQs70LtqndWXyUenRglP7v9t7QGa1MAGvUPsPle+GQMFQ
	ci7esz9f+cyZEqvGp2DhG27wLDX6ajy8RdaV2vpWD2fFplFry5JyBS9oqNrdysH+QBlq
	+crw==
Received: by 10.50.182.166 with SMTP id ef6mr2365251igc.65.1354817061733;
	Thu, 06 Dec 2012 10:04:21 -0800 (PST)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPS id i10sm16026353igb.12.2012.12.06.10.04.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 10:04:20 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Thu,  6 Dec 2012 12:04:15 -0600
Message-Id: <1354817055-5387-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH][danny] linux-mainline 3.2: update beagleboard defconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 18:04:22 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Link the TLC59108 driver statically so ULCD7 initialization occurs
automatically as it did before f0e2305c7e1 which removed the initialization
from u-boot.  (Angstrom-v2012.12 does not include this module by default.)

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../linux/linux-mainline-3.2/beagleboard/defconfig |    2 +-
 recipes-kernel/linux/linux-mainline_3.2.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig b/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
index eaf9548..28f096c 100644
--- a/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
@@ -2907,7 +2907,7 @@ CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_GENERIC=y
 # CONFIG_BACKLIGHT_ADP8860 is not set
 # CONFIG_BACKLIGHT_ADP8870 is not set
-CONFIG_BACKLIGHT_TLC59108=m
+CONFIG_BACKLIGHT_TLC59108=y
 
 #
 # Display device support
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index bc0a145..7eafdfa 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -10,7 +10,7 @@ PV = "3.2.28"
 SRCREV_pn-${PN} = "1f873aca1c7aa7a574b276c040d304d16f1dbfa4"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
-- 
1.7.7.6


