Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15267CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 16:20:03 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.16394.1697127594459120998
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 09:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-79faba5fe12so42138739f.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 09:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127593; x=1697732393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj3E9xf+x/Ti9MaWcCLRwR9gMLZK0x1RFACISslwnsw=;
        b=UClDujYNaSQhHsyayEA0w7XTV49cnU68Vlk/l/9nFO8Qhx8rVaSQID+I8BFF3/7xim
         huq/+UcotEdW6OiMkuAjjuaCxrZW2IDwYpPhrjtsPJDJpDMT3ZmqiCTdX90pwNTowIXv
         w5OZRgXXpbzaiNf0GcziWrbmcoVwh6MlhxVuPwF8ElnycZlYWM6QP19udT7FI9lO9INW
         NRIcaNulcu3q5fpZkzUYcWEaeqjyKEjM8M/XV/cSOwbNpy1wfGKMr0Kuavoce0q5BZeJ
         UOh1gbI8fvwLN+JUoDTr08blNGqyYQF0h6hcGaROws/ov0DOevLpgn9lw5wMN+6TGYnX
         W6Tg==
X-Gm-Message-State: AOJu0Yxpg8RblTna+CYT7MbIlTDNs/IzZA8/aEuNi+T0VNpo+DSscl1I
	q+N54PXz84Jwv1/+T+zBIt4REF1PMTcx1A==
X-Google-Smtp-Source: AGHT+IG1eLd5POBIfTAUPyydpZDQucIqD3LkGsPMMe3Yotew6/im/5GzFu/j6jItSGPFkAfH2of6lg==
X-Received: by 2002:a05:6602:22d8:b0:794:c9a2:5fe3 with SMTP id e24-20020a05660222d800b00794c9a25fe3mr27542872ioe.4.1697127593592;
        Thu, 12 Oct 2023 09:19:53 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id u6-20020a05660229a600b0079f9f7a2565sm4288946ios.38.2023.10.12.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:19:53 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: meta-ti@lists.yoctoproject.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-ti][PATCH] amx3-cm3: use debug-prefix-map
Date: Thu, 12 Oct 2023 10:19:50 -0600
Message-ID: <20231012161950.2566182-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 16:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17095

Fixes the QA warnings about package contains reference to TMPDIR.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 691ff156073..ecdae1231be 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git;p
 S = "${WORKDIR}/git"
 
 do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS}"
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS} ${DEBUG_PREFIX_MAP}"
 }
 
 do_install() {
-- 
2.41.0


