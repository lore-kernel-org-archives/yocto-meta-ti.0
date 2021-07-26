Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web08.30608.1627309767411822817
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 07:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=AxLAoeel;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.41, mailfrom: troth@openavr.org)
Received: by mail-io1-f41.google.com with SMTP id r18so12081361iot.4
        for <meta-ti@lists.yoctoproject.org>; Mon, 26 Jul 2021 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pbHsnYV24U1cs9WyztBZ+cH4uwknfCEDNCWrU9AIFrs=;
        b=AxLAoeelRNGEpIOkYSjteHKoTgp6JdxriduyzaS4RJve12MZLU7kK5IVi9Xo/njO+J
         jr1QjWDu41GB36taedQcW92VrWbpKPZYnRemIPbSlNRoyQmwmrJL8fOhgK5QVtMjeoVC
         imoqcghQ4HHlPuqbOriRuGWxkd12WzRk6lDdDJFJM3gfFBuw/Q4qqSGuUyE5TsrweYic
         KFlNHozG/QeJ5Ro7RhFEGLvMoAtbzNJ/O1RXQZG/b+m1jRhU6MstUq2eJdGt9fWti7h0
         wdCbbjgmdt+6UgU+UncHUdrREi4toJc6BtnfONRkRFjyqJ/+Om9Wak3Bgob2pXotzqSp
         5iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pbHsnYV24U1cs9WyztBZ+cH4uwknfCEDNCWrU9AIFrs=;
        b=hkBuYffTFlWyiIXx+rU9Q4RyiJzQ43W84KpNpaSlBQiUssMfdGbA7cvUCbWRtVExr1
         9Z6lyeQyh/AAV7nGrgAxTSgqGAIOMPqlA3HAov57PEKrPAvMGkYciqHGWckw7V1GTNtY
         aMMD7Ghnu688CM0cWLpH0lMqLJJ7OUk6BCkPl7RnMSEH/+MocLuQNjgcQMBdA7DL3w5a
         3XkQwySmp8P2FvFNsEuAuLnhJiumvxKuwK1w/UDplSdJKRdFTwyr+UN9np5YKTmbZ/sw
         NZSMKmzMSZtP/fWYkcBuMg5XA5/VhyXqiQvCdVuJOzc3MbomzZ7zjV8sBTGxY2SikqD3
         ENgQ==
X-Gm-Message-State: AOAM533A7eyk/Uqa/w7mzTmQakFhkJN9H99skk5Ujv3Cr+Cp/qbY0g3A
	P9E7f4KVH+Q1AdSsUAxs0Y2deZkLbU8X0uUzQEI=
X-Google-Smtp-Source: ABdhPJzTf+UgiK3l/rstyhE0ZvpEEz7UAFFK19qq+l/xwfRtQv4nZRlDaUIGyPlTCYoDexTP4OMw9Q==
X-Received: by 2002:a6b:6310:: with SMTP id p16mr14773283iog.148.1627309766561;
        Mon, 26 Jul 2021 07:29:26 -0700 (PDT)
Return-Path: <troth@openavr.org>
Received: from beast.bozoland.org (c-24-8-35-226.hsd1.co.comcast.net. [24.8.35.226])
        by smtp.gmail.com with ESMTPSA id n14sm20516861ili.22.2021.07.26.07.29.25
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:29:26 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
To: meta-ti@lists.yoctoproject.org
Subject: [meta-ti][hardknott/master][PATCH] wic: Set a fixed size for boot partition in wic image
Date: Mon, 26 Jul 2021 08:29:25 -0600
Message-Id: <20210726142925.2724723-1-troth@openavr.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The beagleboneai is not loading the MLO without this change.

A similar change was needed in meta-yocto-bsp for the beaglebone black
due to the updating of dosfstools to 4.2 in Hardknott.

[Yocto #14306]

(See also meta-yocto rev: 0c679ac53b52e631a7c961872ce58f5cf74b8629)

Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 wic/sdimage-2part.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wic/sdimage-2part.wks b/wic/sdimage-2part.wks
index 77d6f7b5..3eab9407 100644
--- a/wic/sdimage-2part.wks
+++ b/wic/sdimage-2part.wks
@@ -2,5 +2,5 @@
 # long-description: Creates a partitioned SD card image for TI platforms.
 # Boot files are located in the first vfat partition with extra reserved space.
 
-part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --fixed-size 128 --use-uuid
 part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.25.1

