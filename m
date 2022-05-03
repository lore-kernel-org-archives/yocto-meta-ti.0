Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D474C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:09:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.258.1651590573428321829
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xvk4lscM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so2113625pjb.0
        for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aU9/hSiVKXzY/pIK4QlYIqtZ1YIJaZCCMqcipQvj0mE=;
        b=Xvk4lscM2H+7T44z5u58PCoNAp/rFtMyKgnFExOMt+cML4CcUDcXamrO24/DFJvyZG
         +f4HEiy7gCHTWLl8mqC3zUM+sJ7DuIEsD7HG21z3CxevAMHiDOB3uHyNJ0ok6B9N9VxS
         Zw7HS98Xacfh3CxFV/rPjzvSy5EZ6PQgBDQ3w4Y/kdW/Iu7Dc+PRu5fCaQLXr7Jw7/kU
         K5CIDO0vEQEGOJ4M6+q6HbE06zL4jdejXqqdDx4IhJsmJc+bYLUWsrgX5cYTHMLN98/z
         IOlNXWBWkUSXusiOGbzy0UQ77OINWAYptkqFHl9Nd9r4Br5D9g0+x1rHzp1d+b0U8DIC
         VDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aU9/hSiVKXzY/pIK4QlYIqtZ1YIJaZCCMqcipQvj0mE=;
        b=PTfoi6xqUVKeoXhpC0XPmQ3IQXN9QrleISMPrxiKTtZ8HIxy3otGnln4HJ1kF1togN
         laHsXiRuwdY4xUUnGopfIGNQI30wUIBOa2whTli7qXgCLrfyxSEzeFS613RgIAJb6WrD
         ziY9pYiRNvO6jbP430fUof/Sl97KmgyodSfvqk/tXrG/b3Zsq5TlAHy4kUi9QcAEQI+0
         GzWwXUDxbF8tZiSqXFiEXya0vchYwuWi0spl2v1K7wSaJex+W/DmwgYXwPxv57NwmNd5
         L6CvHsB1VQ/B05t98ulEmhqGgjRiZlPhDPfeIn1AyHwb1i58eHBWi5QxBJi2vESqzdIX
         MxiA==
X-Gm-Message-State: AOAM530GDP6946/HpROSWKoBEEd1wTRDLU7Gy/UF6AMH6e5yOEoAS3lc
	lzV7edF/kvftyY19YZ404NQlPikBlVX8pQ==
X-Google-Smtp-Source: 
 ABdhPJwR9NIL6EOKL4E8WyCROuUFJ5gCrBeWQgkXIbFJuBE4/nJ3Gfl9N/cEaHGzWR9Wtj5VUmktmQ==
X-Received: by 2002:a17:902:d48d:b0:15e:a480:78b2 with SMTP id
 c13-20020a170902d48d00b0015ea48078b2mr10206084plg.19.1651590572474;
        Tue, 03 May 2022 08:09:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 s25-20020a62e719000000b0050dc76281cbsm6399085pfh.165.2022.05.03.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 08:09:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
Date: Tue,  3 May 2022 08:09:27 -0700
Message-Id: <20220503150927.262759-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 15:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14679

The module can not be compiled without patching kernel 5.10
This helps meta-ti to live in multi-BSP envs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend           | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend

diff --git a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
new file mode 100644
index 00000000..78b509c1
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+# Added my meta-arm, this needs ceetain backports in 5.10
+# Disable until kernel upgrades to newer than 5.10 where it
+# is already upstreamed
+# Revisit when kernel is upgraded to 5.15 or newer e.g.
+COMPATIBLE_HOST:ti-soc = "null"
-- 
2.36.0


