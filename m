Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E3AC677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:16:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.164985.1673871397210468862
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 04:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PqSzKOSf;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id r30so2868871wrr.10
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngYzkeU9YWcd05PbonyHhsbVOe2MgwkEQvFViSauE4U=;
        b=PqSzKOSfJI0bbkoh1llTJhUejSNoWMUYYL2jS02ePjlfuP7ys8e+v8b+mFPGxmWEo3
         uIXQvWl1BsUWymgpkV+nvHYZWOzvrVnIUjKvko6cfY2kyc/8IP8m4PCpif+Mwt5ZF1FT
         NCdIypbEwN/Bx7CGt72o4+B/IGl6cmnd1Igpo5uKTWVB/5e2DlBLndkC1B43fi1R7Wi7
         6PaoTDyduQ7X2PuZltYSrhnwrIAAFcaN+aOJ4OR7ZswOGxqa18BaP+d53d3PrCxRD/cR
         k5nzzYsX1ygGWF/LdCAMnAsZW8mrFXcPBSsOidBHA3Lpk1y93c37KppfLQObDWv4BAhd
         fPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngYzkeU9YWcd05PbonyHhsbVOe2MgwkEQvFViSauE4U=;
        b=MB8NyR57Gd7M3FiNky7sPIf1bhYlFwL+xgT5swkRkmjX2B7seJOdA8jRZiefysPQ3s
         lkGemR0Pd2jCXH5iAy/HBbAnDnj8zELjAu1Po80BVOdIlesM3VzcutFKoZgFWV7EMi3A
         /phHOSK7zygBRQZC565rVJ1zRwxD0cq4Izy0AWO1sVEccR+bNC2PmUM7qu669at8S+ys
         9kHBZ34NwbysnFJUGQjAoRD+tqfVffrrhAr7TkgiWLw/h1QOACippkQjooNkVLhDKDs4
         VuMDPfrnS8GpAvw4q6Cb/5wRiMc9l7WCurwF1kwG6fc0gljQcRkRVt5XR6MbJl+cHZIc
         7Xuw==
X-Gm-Message-State: AFqh2kpiJiJQe2v6X4QEOU6le8363diEuJ9+2SrxG+uSZR+OU5QGSik9
	itffUHPraof0YGDMH9RH/VfEqGZfFe5qgw==
X-Google-Smtp-Source: AMrXdXtoDGwSqulHvRV2Bopr5djcukbZY0KvWa/Eg4k07fflPl7mkUEoenGE7Am9YD/Wl5PBgUeDhw==
X-Received: by 2002:a5d:5512:0:b0:2bd:bb55:e48d with SMTP id b18-20020a5d5512000000b002bdbb55e48dmr8084686wrv.66.1673871395330;
        Mon, 16 Jan 2023 04:16:35 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b002755e301eeasm8382966wrt.100.2023.01.16.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:16:34 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][PATCH 1/3] ti-k3-secdev: move from meta-ti-extras to meta-ti-bsp
Date: Mon, 16 Jan 2023 12:16:24 +0000
Message-Id: <20230116121626.885219-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 12:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15567

The meta-ti-bsp layer is still broken for K3 HS platforms.

The patch [1] makes the check-layer happy again as it does not
fail any more during bitbake parsing but it will be difficult
for the end user to discover this dependency on meta-ti-extras.
On the other side, meta-ti-extras depends on meta-ti-bsp so
this is a circular dependency.

Currently the layer is broken for am62xx-evm/am64xx-evm machines:

| ERROR: Nothing PROVIDES 'ti-k3-secdev-native' (but mc:k3r5:/srv/oe/build/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb DEPENDS on or otherwise requires it). Close matches:
|  libtspi-dev-native
|  makedevs-native

[1] - 8e43835c ti-sci-fw: make dependency on meta-ti-extras soft

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-ti/secdev/ti-k3-secdev_git.bb                       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename {meta-ti-extras => meta-ti-bsp}/recipes-ti/secdev/ti-k3-secdev_git.bb (96%)

diff --git a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
similarity index 96%
rename from meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
rename to meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index 3763c339..fd3bd120 100644
--- a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
 
-require recipes-ti/includes/ti-paths.inc
+include recipes-ti/includes/ti-paths.inc
 
 # Native host tool only
 COMPATIBLE_MACHINE = "null"
-- 
2.34.1


