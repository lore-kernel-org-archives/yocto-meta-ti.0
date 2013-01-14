Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8874E011CC
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 11:41:24 -0800 (PST)
Received: by mail-ie0-f181.google.com with SMTP id 16so5621164iea.26
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 11:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=yhzDTAxfB5CBU9e5KdUu3qEkAlWEdiaSW17LdUq+Kk4=;
	b=Q7ryNyq58EM8dTC2CjRAnpMZZiCEBBDCAvd9w5LJ4YKnlrPFvYT2BXMZOF/PYaiQef
	ovkGCadWAL2H7zCA566tUlzeeVxysHf3eACdm2mtf3cqG2PprLBQM9FLnuME8TCI9A6p
	e0R4q7E5TNTxKMRaiiSlONEKTUDDACFnjKPxPCWZcZolzl9ayNAj/hZDTGfD/bl8ZV8x
	qU3Z7ZLWxfDqPqk9tZoiOQMx6oi/DENhmLmRedghhV2jJvSgySn0LMHVcJ5VTgJ5rEA4
	/M5mMmljBT2qN8iblP0mvujCnbHLBNIJaBn+5kLIkYJslrOIeLII91ZPXbmLTHu+5CUX
	VuLg==
X-Received: by 10.50.203.74 with SMTP id ko10mr7788776igc.26.1358192484342;
	Mon, 14 Jan 2013 11:41:24 -0800 (PST)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPS id rd10sm98877igb.1.2013.01.14.11.41.22
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 11:41:23 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Jan 2013 13:41:00 -0600
Message-Id: <1358192461-23771-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1358192461-23771-1-git-send-email-pab@pabigot.com>
References: <1358192461-23771-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 1/2] gstreamer-ti: fix package QA issue
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
X-List-Received-Date: Mon, 14 Jan 2013 19:41:24 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

ERROR: QA Issue: non -staticdev package contains static .a library: gstreamer-ti-dev path '/work/overo-poky-linux-gnueabi/gstreamer-ti-svnr962-r85+r122/packages-split/gstreamer-ti-dev/usr/lib/gstreamer-0.10/libgstticodecplugin.a'

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 recipes-ti/gstreamer-ti/gstreamer-ti.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index cb03266..1e616c6 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -143,6 +143,7 @@ RRECOMMENDS_${PN}_append_omapl138  += "ti-codecs-omapl138-server ti-cmem-module
 FILES_${PN}     += "${libdir}/gstreamer-0.10/*.so ${sysconfdir} ${installdir} ${base_libdir}/systemd"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
+INSANE_SKIP_${PN}-dev = "staticdev"
 
 pkg_postinst_${PN} () {
 if test "x$D" != "x"; then
-- 
1.7.7.6


