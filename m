Return-Path: <pabigot@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0ADF0E012F1
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:17 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yw0-f48.google.com with SMTP id p56so8589750yhp.35
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=URkK3s0FSv8e2mPdnQnwaXkrnd6JbeDJNNbg9PismSI=;
	b=WhwXSEQnEmcKwbhuIU50BXOllOKDffJq2sg13b1jSJI8HtCoOHg4e00nCIercuIVrK
	H5ype4dektKLVAJdSFENI27GTmEErn4eu5d9Rio9W5WlXfKlv6SJt/8C1e7qfQNY96Iz
	9gmaWkYj0hgj/8I8gZSlFfAQUSY8V5qvuOkzw=
Received: by 10.236.153.42 with SMTP id e30mr41295506yhk.10.1325033537881;
	Tue, 27 Dec 2011 16:52:17 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id k10sm18006608anb.22.2011.12.27.16.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 16:52:17 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 27 Dec 2011 18:51:59 -0600
Message-Id: <1325033520-6907-5-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1325033520-6907-1-git-send-email-bigotp@acm.org>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 4/5] ti-dmai: fix patch striplevel
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
X-List-Received-Date: Wed, 28 Dec 2011 00:52:18 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 recipes-ti/dmai/ti-dmai_svn.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 43b2833..48930b2 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54
 
 # This package has high dependence on kernel, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "o"
+PR_append = "p"
 
 DMAIBRANCH_dm6446     = "trunk"
 DMAIBRANCH_dm6467     = "branches/GITPSP_INT_101009"
@@ -29,7 +29,7 @@ SRCREV_omapl137       = "482"
 SRCREV_omapl138       = "570"
 SRCREV               ?= "UNDEFINED_SRCREV"
 
-SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=2 \
-                   file://r642-fix-config-bld.diff;striplevel=2 \
+SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
+                   file://r642-fix-config-bld.diff;striplevel=3 \
                  "
 
-- 
1.7.6.4


