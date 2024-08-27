Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02385C52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 06:58:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.72704.1724741922432478375
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 23:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jp3hxETV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42819654737so43608965e9.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 26 Aug 2024 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724741920; x=1725346720; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvlYk+s0EOeF0VhDr9os8QEaWDNsFRnPO7eZgOMdKx4=;
        b=jp3hxETVZPH6ETjE0S5U9Da6kFbzvrc2WiyKcjrLDU5W7v39zbxOm7swMijEca0o4u
         xX7GTEOBsouGAkQtu4xcMTMEq42RUs+YlqMc6b2IWifGllq6iYjnOiJoXRiMFcj4ewYz
         gFUM0sRzGcQyEXubT200fZsCKPz3PQ+5ypQaOo6IYYAFASM2xmCBEYMgC3IP/5KWlnKQ
         Rggioj/4YdmYkhO+RG5tYTvfhovDzQLQvftIphWUK0rWKAs0J6jIU8tYaJG7QCub2Hoy
         COkVZnoG4ly1wBHz712pJx9Pj4o+5DU6Cvo7IrUb0tDF7sgI+Jp0fAsXksbTgaVCsJfw
         Mp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724741920; x=1725346720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvlYk+s0EOeF0VhDr9os8QEaWDNsFRnPO7eZgOMdKx4=;
        b=wx0lyRPFSC5aEIlVGVprWjWklARtuUvDTabCI67EKi3GXHQLZVP4xra6OAlh55OKXu
         wKNBfQwX4Li9b5Nl8jLx8H51IVTkzKXqW6cTezSg2QbNe3MVT7nyhfsR1RWHuyeMn4wI
         hHRrFvca5IrKUe8lAVtogWWQyla/M9Dk5kRhTzE0i4CRdSt/Ylk6BZY93Go2Jm+GULoN
         AGd2PmL1wNgTaBkNKUBcSUJPYzoy9Yz+0ZSZ7clnqNEHhp4ejXRd+Pp9EquZlePHk0Id
         YguKCZanzV/8tmMihCQzAz4ANcKoBBA3EMwCKPA1EU/odKTtxS+DuQjUUATGcoVvb6Rp
         Wjyw==
X-Gm-Message-State: AOJu0YzjMJqnSOFzqsczkIswqA6CkviYt2v33l0ZWiJiYVSYo5Lx7TsP
	1t+8/38qczXdJ/jLaRJ3r79cgQ+gFnCbsJSqu1BLsyVLpOa+5IkG+pC8bg==
X-Google-Smtp-Source: AGHT+IHzk/0BuLJc5K1jMUWrXuwRn0CBeKjMTWc+3xWiwPWEF1kNq31zt+ANQpvcoNpyKyAILH8sLA==
X-Received: by 2002:a5d:47a7:0:b0:371:8cf9:27e6 with SMTP id ffacd0b85a97d-373118e404cmr10218927f8f.56.1724741919760;
        Mon, 26 Aug 2024 23:58:39 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff633sm12348601f8f.77.2024.08.26.23.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 23:58:39 -0700 (PDT)
From: max.oss.09@gmail.com
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Randolph Sapp <rs@ti.com>
Subject: [meta-ti][PATCH] mesa-pvr: set pv explicitely
Date: Tue, 27 Aug 2024 08:57:23 +0200
Message-ID: <20240827065723.1108167-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Aug 2024 06:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17951

From: Max Krummenacher <max.krummenacher@toradex.com>

openembedded-core commit f5cfb3e23603 ("mesa: set PV from the .inc
file and not via filenames") now sets PV in the mesa.inc file
explicitely to whatever version oe-core is using.
Override that setting to the actual version here to prevent the
following parse error and whatever else would go wrong afterwards.

| ERROR: .../mesa-pvr_23.2.1.bb: Unable to get checksum for mesa-pvr SRC_URI entry 0001-meson-Disable-cmake-dependency-detector-for-llvm.patch: file could not be found
| The following paths were searched:
| .../meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.7/bsp-ti-6_1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
| ...

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
CC: Randolph Sapp <rs@ti.com>
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 1 +
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 5abd07934d94..09ae0510ce53 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -29,6 +29,7 @@ PACKAGECONFIG:append = " \
 "
 
 SRCREV = "1be98ba80452ebe38546a7fca26b5a70f2629083"
+PV = "22.3.5"
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
index a137f4521e08..21134bc774cf 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -26,6 +26,7 @@ PACKAGECONFIG:append = " \
 "
 
 SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
+PV = "23.2.1"
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-- 
2.42.0


