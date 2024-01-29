Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B822C4828A
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 11:54:06 +0000 (UTC)
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
 by mx.groups.io with SMTP id smtpd.web11.12700.1706529244280924768
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 03:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=XCU9K94z;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.216, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound21-231.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Jan 2024 11:54:01 +0000
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d542680c9cso17927345ad.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1706529239; x=1707134039; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ximpxrW7+UIx7kWkq+PWWNGxGtPnBgmgEagwRQ7Kt0w=;
        b=XCU9K94zs8nCsZ/0OPJeU/7PWwGDuGC5Ob01LWyITg8Oi2GxCeqfTd5NaX36MDG/jo
         mYhn+jHRoO1p/YPXDxfzPZ5luPRLlnqRBc+mgxXajAi6e03zzHetfFnvYe7u3MciHhW2
         O28M802Cdybg+nU34Z95tP5YAItGcj8nJUqL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529239; x=1707134039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ximpxrW7+UIx7kWkq+PWWNGxGtPnBgmgEagwRQ7Kt0w=;
        b=RMKkmBzBgSOa0U7wPkjSsDgWh7Nv87u79tzQwl27QPnXhGmpWEzeks0vFD53IEGP//
         uZPg9XuEB2HN9cqe8nP4ULW7gKL318OiUgVtEN36a7wW/2emS4NlGyO7R2xlFQ1r3wg2
         Qmgo2APWBO/ymigU4T0CCzZBmgE6EMtE+VE75HaMM+2IrmwbOB8jNR1XMK4qxWwHZZ1c
         l6DcTUzoCdo3szu+esokibTwhZV3w+jzrE2/vjYe7oFD1QVPxnArIq0TFUfdwVHRd5NK
         M96GwAc9CVjGk9dH4jHQHB7GpJI/MjEK57MwpFQfADO3Lv/PNNmkbeesyhRtX5/y6ejq
         2o9w==
X-Gm-Message-State: AOJu0YycB+G1rcXznPbJGibcbda5D5NEb0JEvUiRe11+ygjePyrobL32
	gWUE+zUCQWvIwRhurK0fzqmtbK/xe0vcZYvb/rEM84zBhVDLq5Qi/W7xFOuXdepzK+pRV88k8+v
	zEUu6zTemBQHvHXHAewoR60PRrFIme/s6vjwusCQJwC6OrkoUMpt86vofvnD6JZeVM+ZBc0ZFHY
	iWGx8faekOuUHEQtF5ve28pnoiV5ejB5A=
X-Received: by 2002:a17:903:3281:b0:1d8:8d72:5e96 with SMTP id jh1-20020a170903328100b001d88d725e96mr1984192plb.42.1706529239182;
        Mon, 29 Jan 2024 03:53:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZachxaNelNbYKBd8yQ32EqI/2N1anBA5JDkbPqciRCfmJTw/lka39nJKAizx/EFMImXtAJA==
X-Received: by 2002:a17:903:3281:b0:1d8:8d72:5e96 with SMTP id jh1-20020a170903328100b001d88d725e96mr1984186plb.42.1706529238907;
        Mon, 29 Jan 2024 03:53:58 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001d7274cbd33sm5096391plb.121.2024.01.29.03.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:53:58 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][kirkstone][PATCH 4/4] branding-core: enable mmip for AM57x platform
Date: Mon, 29 Jan 2024 17:23:42 +0530
Message-Id: <20240129115342.9321-5-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240129115342.9321-1-sinthu.raja@ti.com>
References: <20240129115342.9321-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1706529241-305607-13554-3182-1
X-BESS-VER: 2019.1_20240125.1952
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNLe0ALIygIKJKQZJlkaGqR
	bJpsmGhmmJRiaJiUnmBoaGZhZpxslJqUq1sQB7GtYmQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253838 [from 
	cloudscan18-217.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 11:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17428

From: Sinthu Raja <sinthu.raja@ti.com>

Now that the gstreamer plugins are enabled and ported to 1.20 enable
the mmip for AM57x platform

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc    | 3 ---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 79dadc11..85aa09b6 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -12,9 +12,6 @@ ALTERNATIVE_PRIORITY:pn-opencl-monitor-ipu = "1"
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
 
-# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
-MACHINE_FEATURES:remove = "mmip"
-
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index fb831225..6136561e 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -4,9 +4,6 @@ PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
 PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
 PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
 
-# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
-MACHINE_FEATURES:remove = "mmip"
-
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
-- 
2.36.1


