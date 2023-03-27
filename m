Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCE1C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 17:08:50 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.41715.1679936927098613890
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 10:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112 header.b=lwYtbPAh;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.180, mailfrom: troth@openavr.org)
Received: by mail-il1-f180.google.com with SMTP id l9so4963294iln.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 27 Mar 2023 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112; t=1679936925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+kr205SD86f0+QhNY7kh3E/TJECOEfjmG6owKskbo8=;
        b=lwYtbPAhnVMxHjtJ93VrhyKtLDbZlwkuWMlz0cblwN3tetDp/2IcSVEVE9voP6jb2A
         fmKZPXkbWlYYlG1mf7tsrqR+L3LAyef2GqRSvE0RZk8+LwoGhCh3H9QDSIxh6XfHRu4G
         +vpPF37EkiU3ILORDLEBy30FVwkc0Fdp0sJe2ObMlh0ZTngk6PHAHAvpzroRPPmN+las
         iYZs5ElXumssuffSDPiNLZumsQ2N904kbRaZHNgn6k9/7sKslTgCoc5cdSNNoj/G1cWE
         vvR06m8nTi0pef/TodzfycFID2QxTWVcOvingOwLm3nhU4RjS3+Km1Qmtq42eN3m9jlw
         +PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+kr205SD86f0+QhNY7kh3E/TJECOEfjmG6owKskbo8=;
        b=elCcAj1n4kToheQDKJcBwe1b43AdQCwhP4+JxMBwhm/Onb8LRPeF792v0j/hBvzH35
         w+8qxlcrkKZRjicCMlnEYbp00aASlPPd1GzYZ023ejt+chjGDnqCdthm1l49mc6/268o
         kP9rq8tVz5Fra3kiyIOBoCRHnOpTOem2QhP4igVlZRzZON0Sy/PmbXlpoW9YdB4DQHRH
         Ll9/qHDP1DUhfg1CPMlWpeBuL0ElaMpdht+XMjxG/yLDvvAYETBACerFUWHgQXDieQWa
         XK0J3xAA0KL7ENRVNngJmI9YGZRWwk+Q87i3QJO6vvlYkq2vB7hErJt0+iyNKiLPJwYA
         /OhQ==
X-Gm-Message-State: AAQBX9fdS7Wd+jvAsG3/ec8VX0RtxMZVwd7yTh7TvzrjTd9VDOM4Ia1V
	9WMYIqqZYYxmUHQjfhLOa3j0xXQeTMxUJ8mqMkZJ0w==
X-Google-Smtp-Source: AKy350brSAeNh86WsLxw2M5M8cRegSHz2Uh0rHHWUUzg2yZT4Ef22lfKCld5+S/W2vqD6zOpZ6Sa+Q==
X-Received: by 2002:a05:6e02:541:b0:315:2eec:4054 with SMTP id i1-20020a056e02054100b003152eec4054mr9863387ils.13.1679936925154;
        Mon, 27 Mar 2023 10:08:45 -0700 (PDT)
Received: from localhost (c-24-8-144-174.hsd1.co.comcast.net. [24.8.144.174])
        by smtp.gmail.com with ESMTPSA id a25-20020a027359000000b0039c492ae300sm8961103jae.114.2023.03.27.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:08:44 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
X-Google-Original-From: "Theodore A. Roth" <theodore_roth@trimble.com>
To: meta-ti@lists.yoctoproject.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [RFC][meta-ti][master][PATCH] meta-ti-bsp: Update mesa bbappend files for mesa-23
Date: Mon, 27 Mar 2023 11:08:09 -0600
Message-Id: <20230327170809.2115712-1-theodore_roth@trimble.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Mar 2023 17:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16245

From: "Theodore A. Roth" <troth@openavr.org>

The mesa recipes in oe-core have been updated to mesa-23 causing the
following build error:

    $ bitbake core-image-minimal
    Loading cache: 100% |                                               | ETA:  --:--:--
    Loaded 0 entries from dependency cache.
    Parsing recipes: 100% |#############################################| Time: 0:00:20
    Parsing of 2816 .bb files complete (0 cached, 2816 parsed). 4472 targets, 484 skipped, 0 masked, 0 errors.
    ERROR: No recipes in default available for:
      /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
      /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend

    Summary: There was 1 ERROR message, returning a non-zero exit code.

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---
 .../mesa/{mesa-gl_22.%.bbappend => mesa-gl_23.%.bbappend}         | 0
 .../mesa/{mesa_22.%.bbappend => mesa_23.%.bbappend}               | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend => mesa-gl_23.%.bbappend} (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_23.%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
rename to meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
-- 
2.34.1


