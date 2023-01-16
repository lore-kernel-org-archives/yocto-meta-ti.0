Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94021C678D7
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:16:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.164986.1673871397563865668
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 04:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BISwtYrS;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id bk16so27265705wrb.11
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0tf2+ZVmM7vHsOj8AwIAaZ94x4GAMO0pjS3XhSfHsw=;
        b=BISwtYrSJIA042grQfLtYT7nidDkLg6IWYEw38U2VINx7AO5yfiTLT4HVR/QMg7jJv
         bwnlKFShmyLSeL4CwsIvdxO8FmK34J6+mSsj1rsWpNo4pPaGHOAem3+BFdTZb9aNuC8t
         8gYp9X3WFBlloFkjRM4YPyOJ8AONhX7uS6v/SnS5Ld453wwomfdgguKH3w0FVEpDFlg0
         Ybs53TyGJY0+KgSv3PG4WkVhLt0eLp/ovvHBII1JnQVFTYzbhPg5e6ps7HJV3+sXAiXK
         TJwd1zRhAauDFzWnPFH+5K4Zx9eBakj/fRyO+bFkgQgeYPMiDex5NuHh14zryuwfaEzf
         +pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0tf2+ZVmM7vHsOj8AwIAaZ94x4GAMO0pjS3XhSfHsw=;
        b=aCv6WUq5tn/Uc4Nkbqw64YWvZIHXnL0+eKWKfYmLBVEyA86rCUhkmsEO0dUlICBzgH
         v4K5B5PBD9zDul7bbnm8FPNnVQHV3YOXEMU1XUez8Jk1B/VwLRTo0n4sn+o0adZ/PgDe
         7UOKb+JYhG2gQ+SwR8othRIAWmonX9C4T/3RCsKg3yfd6fZiMt9AWputUHTEPxvmvsIB
         Q8fMa8nDqEw0bJP7sNHF8BD3FD4Pr1ExOk9R6GUleIU7ih5xGANW0E0RpRU4NF0zv83k
         h+nuYAuCfjH9JujsVagWHdcfdTgrXO8QKhxTnA1aJrbSRhNZYLijLKfBmWWAm+j8vc5U
         tOQQ==
X-Gm-Message-State: AFqh2kpG0v4J91nIG8bcNDoJzsUpNxT34M5mqIA2IZyj/U4fIdtKOq2G
	4SrLTZTYBziu/YcsxrqAmi7DDCvDivfnXw==
X-Google-Smtp-Source: AMrXdXshbVommzFRFR/4M/a/98o3Mal+2GLXtqkVPVuYhv+qpTUiaucg+uoCOBAsyzlIUwJSuOoHKw==
X-Received: by 2002:a5d:4e01:0:b0:2be:d04:3667 with SMTP id p1-20020a5d4e01000000b002be0d043667mr1762760wrt.26.1673871395855;
        Mon, 16 Jan 2023 04:16:35 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b002755e301eeasm8382966wrt.100.2023.01.16.04.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:16:35 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][PATCH 2/3] ti-k3-secdev: sets TI_K3_SECDEV_INSTALL_DIR_RECIPE default value
Date: Mon, 16 Jan 2023 12:16:25 +0000
Message-Id: <20230116121626.885219-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116121626.885219-1-jose.quaresma@foundries.io>
References: <20230116121626.885219-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 12:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15568

The TI_K3_SECDEV_INSTALL_DIR_RECIPE is defined on the meta-ti-extras layer
so when the layer is not used the variable is undefined.
For such cases we can use default value that is the same defined
on the recipes-ti/includes/ti-paths.inc

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index fd3bd120..6a28add7 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -4,6 +4,8 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
 
+# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE
+export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${datadir}/ti/ti-k3-secdev"
 include recipes-ti/includes/ti-paths.inc
 
 # Native host tool only
-- 
2.34.1


