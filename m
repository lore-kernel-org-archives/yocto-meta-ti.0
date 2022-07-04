Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B566C3F2D4
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 03:09:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.68037.1656904162184299941
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=Wsmry9Xu;
 spf=pass (domain: baylibre.com, ip: 209.85.214.172,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pl1-f172.google.com with SMTP id r1so7408798plo.10
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cEXBbKL7fpCajeQ5NcGJ4u2VhORxSvEzbAzlhUvHes=;
        b=Wsmry9Xuvisov5vpPEe4cpNOJCpslpBgT/qdLUf5xev+mQ3KkXYzFfJU/+RbaaWjAT
         ZOsuZjzYc5fr315FT8OPnsgoP2pLI8JapZ3PCupS+NpSQ/ps2zsGNZ6UNAmblYbmqEhB
         qjJejpphMvgTeCbLlNOcnU3Kf7jn2x+ewmfcN8QTDZOusD0bijP7KwoxO5sNVJ8ZVutG
         7wPisKHbLFrHD7byZ+513bbs9hSamQRKtcDZrIOZxv+Ynqiqm08Kv+qp07hWIgq6+Pp9
         afZ83SQYB4yd66xE2X8gzpbJrHqbD/xGmAgZ8DhxnAEv3QAoVIWkxqXWOuVnlunFgoX/
         ZZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cEXBbKL7fpCajeQ5NcGJ4u2VhORxSvEzbAzlhUvHes=;
        b=xRB6h48JIIf5ExvyuXEDmQiIaegVLZSuN4I6eSx4cQay6bJr0Mc+TNIkIKUK7sTUK/
         MXYHn1XhMGPTaY89sMjxuBrUoWNwJnW+1+PFR6z6X0Iz5csRuIVNmzKaeQfBV/DpFora
         wDArsvxYwpOMTyXTvt7imXouyTZBqo6xcY10Jf9l6mOGw9yn7Nljz+lRObYVcaHdY9y/
         fshT9J5tySR4BIYUgntoA+esriPXH1rsVK9rTOkQ0NfN/SK4HI3Yxrn37y+57O7LjUwl
         cCqgce2USl1aurY9rlRk0CGl6f/DbuLnKEAfAW2/GB2FYXSYcet944SexriTlPI+mabu
         x3rg==
X-Gm-Message-State: AJIora/XfPG3dtzEyRHtZdz77vSABzihpId+WsSedGdrNDqAG6kZNWtq
	ivCMyOP5RJmnCKrh7lq/C6UBqBtDl4yK4g==
X-Google-Smtp-Source: 
 AGRyM1tdzjV9cROIX3elZwXmHNh/TxqLORfonc3pweIB+VHy5c8lxG1YplZnJVWH/DlOPif4OZFmsg==
X-Received: by 2002:a17:903:22c9:b0:16a:749b:16d6 with SMTP id
 y9-20020a17090322c900b0016a749b16d6mr32760479plg.32.1656904161474;
        Sun, 03 Jul 2022 20:09:21 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1001:7090:139e:6a0c:c997:d6a3])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a158900b001ef3daa0f21sm8203692pja.16.2022.07.03.20.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 20:09:21 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH dunfell 3/3] conf: am43: avoid missing dtb files when
 ARAGO_BRAND=mainline
Date: Sun,  3 Jul 2022 20:06:09 -0700
Message-Id: <20220704030607.2292135-4-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220704030607.2292135-1-dfustini@baylibre.com>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Jul 2022 03:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14871

For ARAGO_BRAND=mainline with the am43xx machines, avoid the inclusion
of device tree files that do not exist upstream.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 conf/machine/include/ti43x.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index fc9af94921c4..729b42742303 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -27,9 +27,11 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
+    am437x-gp-evm.dtb \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'am437x-gp-evm-hdmi.dtb', d)} \
     am437x-sk-evm.dtb am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb \
+    am43x-epos-evm.dtb \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'am43x-epos-evm-hdmi.dtb', d)} \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.32.0


