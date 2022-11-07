Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171DCC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 20:18:38 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.166.1667852316911349698
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 12:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EyONH9Z/;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id q186so990022oia.9
        for <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 12:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YnvbDYEQFcDZni0I8KMJ5ISdYymnD00kL8lSZPGegY=;
        b=EyONH9Z/8SGt5CxY3lcJOA79qFmTBHQd4+73ixwvd1MVd2e2//2Z8iyeomvp2z/ava
         8iexDqwVd/PharCg7Wfo5yBCVu273nRnsJ1c0oPFrhHeTsiCXFuKU8h4DL26TDZvAndu
         KmyjDraZRqqE9626U0wdgk9c1VnGnlKbBtbEE1Fx5SWYtcnkkGVLWb/9VIqWpF2YWxFS
         3A7q+q8OPTxU0wF8Kx7gx+4GXsxyukNgsBFzGyhRULfwTOOfuGmBmXkAx6dt7798qrZS
         k9rsr8OIZXN8xb2CitekGaetFWI6wtVyis6NdMSpnkLBbQrW/INFetFaJZQQcFRQgL+p
         cG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YnvbDYEQFcDZni0I8KMJ5ISdYymnD00kL8lSZPGegY=;
        b=CE+L9a9UK5+wvWgnH+XyRvEgaKn2H2JbzOf5iXwMNRfAvuvpQKQD7v1SP2C0zgbtMM
         PcJVeM99GRojTg5ICb7phNHaNM1SJHzTpjMG7HAcyI38KoQbwf8ukQa1wyIz7iFyKHxM
         iAMZPNVenm1f8LDEcfSMChDlBtHq1hq+hIzo9Tei5N3/KPMMEb4LDgKC6IEo64o7tnDV
         mTxWLJRZoabGgNd1IncluXjK/AeEGXDK54df2sNwaeGCkAkas42TyeJgGpczUHjvN5fZ
         YMZqa2tBblypSP7tGYqZqLnfxTQdghj2a0SgHbCAVwn/mEEWVQ0q3aRwaQOHJhZuX/uk
         3Oig==
X-Gm-Message-State: ACrzQf3E2TiFckwVHhZTZZUMqTqFGc9nPvTNg9gLje4bI68jxipUSher
	IZqMjZFLZzXHApX3fFQ/VTXjwmSdgUo=
X-Google-Smtp-Source: AMsMyM6YxKoENmmLlyTQktGOUruGnvtZVuUvFy7F35oXD/4g9/t+iOQYHngxEo1UnU1F5eR9cjfmpw==
X-Received: by 2002:a05:6808:193:b0:35a:faa:f58e with SMTP id w19-20020a056808019300b0035a0faaf58emr23169219oic.106.1667852315816;
        Mon, 07 Nov 2022 12:18:35 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id l18-20020a056871069200b001226d2100f2sm3625244oao.33.2022.11.07.12.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:18:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Zachary Booth <zachary.booth@garmin.com>,
	Joshua Watt <Joshua.Watt@garmin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-ti][PATCH] conf: omap-a15: Fix parsing when KERNEL_DEVICETREE is not set
Date: Mon,  7 Nov 2022 14:18:30 -0600
Message-Id: <20221107201830.1203599-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 20:18:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15332

From: Zachary Booth <zachary.booth@garmin.com>

Correctly handle parsing when KERNEL_DEVICETREE is not set.

Signed-off-by: Zachary Booth <zachary.booth@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 conf/machine/include/omap-a15.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 02225a4e..4f57e6d1 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -19,7 +19,7 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
-DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
+DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/","")}"
 
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
-- 
2.33.0


