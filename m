Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FB0C25B0F
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 19:35:46 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.8041.1660419335192067122
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=p39DwLmj;
 spf=pass (domain: baylibre.com, ip: 209.85.215.170,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pg1-f170.google.com with SMTP id 73so3431602pgb.9
        for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Aug 2022 12:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lIyyPE0KMGBcAlxuV1Qk0lHbSdoGVErKDTIjGP5cm2Y=;
        b=p39DwLmjM1RzcB40aJ9icFuodT2oZErMFNh5Lnw7OZQD/56XSSFbN11h7TVJcDfRg7
         KjLMVO08gCu5lDDdw8/aU2Wt6DiveJTigBbIzEpNiskBTra5bbA4uUV2pcUPdgjED6Eh
         x33b2aynuzoskUgZ/KaDIrqGCN0WhGGMUMyDW6vY51bIkFRpjoLETUXxFQ0kQUQk5OKz
         Ure4AmJ8VkA5zzR1sh2cJ//67dqakTxq1w9f7xuBnmm1qgssbku8xRvIQW85uV8iQ+KT
         4bt0snBTEi1EZkftLxAa/1wvP4F3JOs3nmRAXmHI9sbZ69JMlosVWqBe7Bw1jIgrI4B3
         R3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lIyyPE0KMGBcAlxuV1Qk0lHbSdoGVErKDTIjGP5cm2Y=;
        b=q23W83Ljc65tok6ejY2oezIhyK0ysN3aukCp/gvAibWiczwM8wafiGCWprwNW6240E
         dCEnWYv1jQY4ICuY+sgx8cnXBN4aTiTUTcsty4TM5DX3bj9bvkXYCoSpEupzxlpEwNB2
         hQmkrJJg9ppIIqThywvmbTOYZPLPac1jspvakvLKxWtWb4o/kuVERdP7oROBs83oFYEP
         gMnWw+2lnJQOOp0RLPj6FQgLcLU09WWv7rMtSqZYYCzjaQkl3NJoV0GVGfmm9GW7z8Ml
         IMjyBQg1EhtkOm9WI+2JAcuUcKfEMVmz8CO2fUuuj65+X2ks6VwF0rEwlHlPI47oJJ/Y
         DJXw==
X-Gm-Message-State: ACgBeo1PhXn24VbZtyvS80qWAdfNiFQWtBcMQEmr6hqk3RJSNilZV2G8
	sCLbp3rd8NN3STof6cRWUNG26UPZf+eZWQ==
X-Google-Smtp-Source: 
 AA6agR4yLz49warJXfjFSR5OMeEVYnPNAIChXkMluqLiZt0Gevu+bhsQ9ftM05L8fk8GRhOOKMpSFg==
X-Received: by 2002:aa7:8241:0:b0:52e:9544:199 with SMTP id
 e1-20020aa78241000000b0052e95440199mr9369455pfn.55.1660419333938;
        Sat, 13 Aug 2022 12:35:33 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1002:ab0:d51c:b519:7caf:31b8])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001f30f823145sm1930768pjb.55.2022.08.13.12.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 12:35:33 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 0/3] fix ARAGO_BRAND=mainline builds
Date: Sat, 13 Aug 2022 12:36:51 -0700
Message-Id: <20220813193654.2908698-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 13 Aug 2022 19:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14958

Builds for ARAGO_BRAND=mainline are failing for the following machines:

  - dra7xx-evm
  - am57xx-evm
  - am437x-evm

This is beause the above machine configurations include files in their 
KERNEL_DEVICETREE variable that do not exist upstream. Therefore the
image creation task fails when it tries to copy device tree files that
do not exist.

This series of patches use '@oe.utils.conditional' to avoid adding those
device tree files to KERNEL_DEVICETREE when virtual/kernel is
linux-ti-mainline.  The image create task is then able to complete
successfully regardless of which kernel recipe is being used.

v2 changes:
- Denys suggested switching the conditional test from ARAGO_BRAND to
virtual/kernel

Drew Fustini (3):
  conf: dra7xx-evm: avoid missing dtb files for linux-ti-mainline
  conf: am57xx-evm: avoid missing dtb files for linux-ti-mainline
  conf: am43: avoid missing dtb files for linux-ti-mainline

 conf/machine/am57xx-evm.conf   | 6 +++---
 conf/machine/dra7xx-evm.conf   | 2 +-
 conf/machine/include/ti43x.inc | 6 ++++--
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.32.0


