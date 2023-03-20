Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F6CC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 14:26:15 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.15426.1679322370992493909
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 07:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=LAl0GgXc;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679322371; x=1710858371;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t/gKtlV1q1uZ+8cNv7UpFg/khxx49MsNL0HH7A+RI8Y=;
  b=LAl0GgXcQmQE7daH7P4YEvNwJnnjFL5Xc/1DFgUac7miQCkLMelFwpI+
   ANJLVAGlujRFD5RHA9mHqu0nKhJj7nw/iFb5S/wRCAbrn9p3V7D21DYX/
   G0lYHVvCwgytLfQTxXcKAbjWwzdv84Eg8KB6JIadZ5app1fT5pbS5+BSm
   ZHqdmM1udm0VRUmvLXZ6i30HcfyjigiOMoURN1cPpY8Ayxo6Fr+SQN7NF
   qaGCST0gunnuG3OOhWd94gaZBHep2Ncivkby3dEqc+CngcuEPvWdd1/60
   EHry0lvfTgoeLt5DwGppCk1xU152De/CG8ax1O28vKQH8SVRrDOkEp8Dq
   A==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673910000"; 
   d="scan'208";a="29804666"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Mar 2023 15:26:07 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 20 Mar 2023 15:26:07 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 20 Mar 2023 15:26:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679322367; x=1710858367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t/gKtlV1q1uZ+8cNv7UpFg/khxx49MsNL0HH7A+RI8Y=;
  b=iL9z24OoX00+boISSeUlHoIRLQZ9O1PX51twA8EZiJVBVx2Y50kF9Qdq
   zojoBZYbk+qpxCAX2ncy2yWVxR9CkMWgSj2d+Pahhj0chtWRzN2TNza5o
   H3SUs8Gl8N6Ni9GIaeSM/zQ2WCO946T3O4hhEWD14Dksa6Ou0+Pm/xlBy
   NOnxnNpB4VDBAmmKRDWoLlUPN25jpmhdB0Iw1yt99/gOHwf06N/QbtQl9
   LX974EJdSwxAjeCG+ZJY4KboU+SBRlCB9zCvKzkZgvZl9+v3opRdpFo6G
   EPE4VYifvxRD0jF3Rnv1l67W+W2gTw1uZjjQmsnnXZz8tBTe5hhV3jxoh
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673910000"; 
   d="scan'208";a="29804665"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Mar 2023 15:26:07 +0100
Received: from localhost.localdomain (unknown [192.168.66.2])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 81981280056;
	Mon, 20 Mar 2023 15:26:07 +0100 (CET)
X-CheckPoint: {64186CF0-30-665580FB-E93DE98C}
X-MAIL-CPID: 048C2C51A2257DFDD0371E3CF24B4BA8_3
X-Control-Analysis: str=0001.0A782F24.64186CFF.0048,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Denys Dmytriyenko <denis@denix.org>
Subject: [master/kirkstone][PATCH] ti-sgx-ddk-um: fix error in postinst with sysvinit+udev
Date: Mon, 20 Mar 2023 15:25:34 +0100
Message-Id: <20230320142534.2542288-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 14:26:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16216

When sysvinit is in DISTRO_FEATURES, the update-rc.d class must only be
inherited when the script referenced by INITSCRIPT_NAME actually exists,
or the update-rc.d command in the generated postinst script will fail.

Reported-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

I have omitted a Fixes tag, as this applies to both master and kirkstone.
The tags would be:

# kirkstone
Fixes: f50f55102f92 ("ti-sgx-ddk-um: use udev for userspace initialization")

# master
Fixes: 0b3fa09a5f0b ("ti-sgx-ddk-um: use udev for userspace initialization")

Let me know if I should send separate patches with the tags included.


 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb             | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index f1fbed15..73d7acb9 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -24,11 +24,16 @@ TARGET_PRODUCT:am65xx = "ti654x"
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
 
-inherit update-rc.d
-
 PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = ",,,udev"
 
+def use_initscript(d):
+    sysvinit = bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d)
+    udev = bb.utils.contains('PACKAGECONFIG', 'udev', True, False, d)
+    return sysvinit and not udev
+
+inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
+
 RDEPENDS:${PN} += "libdrm libdrm-omap"
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
@@ -42,7 +47,7 @@ do_install () {
     with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
 
     # Delete initscript if it is not needed or would conflict with the udev rules
-    if $without_sysvinit || $with_udev; then
+    if ${@oe.utils.ifelse(use_initscript(d), 'false', 'true')}; then
         rm -rf ${D}${sysconfdir}/init.d
         rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
     fi
-- 
2.34.1


