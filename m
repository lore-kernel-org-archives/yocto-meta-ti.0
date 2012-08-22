Return-Path: <raj.khem@gmail.com>
Received: from mail-pz0-f48.google.com (mail-pz0-f48.google.com
	[209.85.210.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A9E6E01388
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 07:49:09 -0700 (PDT)
Received: by dadz8 with SMTP id z8so1005470dad.35
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7ssCVmibCKuGu3q1QlOV1ianMeBzsXmWVgl+YH011lk=;
	b=wBrl+THUKQeXsJh2ADGVzf+/NqShsmvTtyLUUTI/EF7q9w02cKwAcmXPbh5RCZxSCu
	YOg+n2wRHaS8ggz9+Ky2ttsU5h8R87Q9zsX0YgdM+X1Upici4BIrC/ZFvzXWnsCRYsw3
	5DAsV92F8fzOvwj3vmuimc5zAeF+u73EbrzqdaHaEKKtwYjRBUBaUO9KNicppOynwPZ4
	9HKd+PmYRq+2ZHiU8UvyzjaKAXlj1E6jgLwVTQcDizpFeQeEftY+OrW1f321/3FWq327
	wmhrE4BDo+MwsuLgsmOZsB4hL8n8GRKfhe9aE7a7g6ASoM3/rWf+SG2SlmopOj1W2ZIt
	nbOA==
Received: by 10.66.78.73 with SMTP id z9mr47110637paw.9.1345646949204;
	Wed, 22 Aug 2012 07:49:09 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hr9sm3851157pbc.36.2012.08.22.07.49.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 07:49:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 22 Aug 2012 07:48:31 -0700
Message-Id: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] recipes: Replace proto= with protocol= in SRC_URI
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
X-List-Received-Date: Wed, 22 Aug 2012 14:49:09 -0000

protocol is supported proto is not.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/ti/am-sysinfo_svn.bb            |    2 +-
 recipes-ti/dmai/ti-dmai.inc                 |    2 +-
 recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
index d4f8740..b73a884 100644
--- a/recipes-bsp/ti/am-sysinfo_svn.bb
+++ b/recipes-bsp/ti/am-sysinfo_svn.bb
@@ -9,7 +9,7 @@ SRCREV = "5"
 PV = "1.0"
 PR = "r1+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
+SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
 S = "${WORKDIR}/trunk"
 
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 23481b7..58955b5 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -17,7 +17,7 @@ DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
 
 S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
 
-SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
+SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
 		file://loadmodules-ti-dmai-dm6446_al.sh \
 		file://loadmodules-ti-dmai-dm6467_al.sh \
 		file://loadmodules-ti-dmai-o3530_al.sh \
diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
index 3d260ed..f314a35 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
@@ -11,7 +11,7 @@ SRCREV = "962"
 # apply patches from tracker 1208 to get zero copy support.
 # https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=TrackerItemEdit&tracker_item_id=1208&start=175
 
-SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=https;user=anonymous;pswd='' \
+SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;protocol=https;user=anonymous;pswd='' \
            file://gstreamer-ti-rc.sh \
            file://r962-remove-include-videodev.diff \
            file://gstti-init.service \
-- 
1.7.9.5


