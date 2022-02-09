Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.228.1644436587550519456
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 11:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=6d4DzZ1N;
 spf=pass (domain: baylibre.com, ip: 209.85.210.171, mailfrom: khilman@baylibre.com)
Received: by mail-pf1-f171.google.com with SMTP id u16so450028pfg.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 09 Feb 2022 11:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erGs0JgYGpE/QE1gkvE8oYR3vhvKwh7l+KTbUwK4ZaE=;
        b=6d4DzZ1Nu1QQU07uDKXczP54XO7qZfeuEU0WXWo88ZFxkM0Te3jlHGw+sRVjAhQfO+
         0pRBH560Nvn1c5p7pPUTdYQapuBQTWtlt3hYlQ2STuiStctH+40LsrLTAvskQKGtZ81S
         FHydKJc1vO7EX7+wc5EFBvkzSlPeb9VuxTFIzIToBgqahguO3Qmr+7VWx12GVoN2A6Je
         iommH3bI/RhFhlITsUm9mBbGNfy91SKhhUIekCrjFmUUIyPE4qJks3sKQ3p25qGbtfrm
         Tmb+jvxPXWK+melgfUhEpwTCXlIqwh30zeMfEL0y9MVVJ4341ERrecCQ4gEZZ2ipV5OQ
         LObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erGs0JgYGpE/QE1gkvE8oYR3vhvKwh7l+KTbUwK4ZaE=;
        b=dP6RTPmbjcntRctHwAE6WAw/9hxjixQ5mrdqnBAgU2dzD3yh58ALc8fNMa93tkD1AP
         kQqu/J3Yh4l1mTtS/Gg14hE23EkA18FSPD7LhOcBtUnerkOO4R5/VSA8KRIP15xlTmyv
         u9GvyHDDlC5Tnmn69cYXt5BlFZjX46W1E+2ZYSMIxYqQg1xGNlPFr+bQn4rL7TsukLsT
         DA7CjsI1YbXdD28Mq+S1U8ylE9yXxlXOwLCNj0QS9MfAo7uTUymaGT/JnbLtzbdE6GqT
         inQqtr6MXd2awSpSoL8l7iLnBbPUclWd0A637OW1KJHn0AeRZJ4lqpzRD2MT5IS0qfpw
         yzfQ==
X-Gm-Message-State: AOAM5309AwxgCTJ0iLb6ww5odRPZ9Bck1FfKjK5blx1fc2Bf9Cz1xrgu
	C+IEy54mvVrbYlU3BiUANnzupaNf3dFC/g==
X-Google-Smtp-Source: ABdhPJx9kH+/RTC6B2YQ3K23UCi89+34eHn9pSIE1bxYEZ1iC+OngYhoEw7TAah8VIuWunRT/P57ZQ==
X-Received: by 2002:a63:d853:: with SMTP id k19mr3196208pgj.39.1644436586405;
        Wed, 09 Feb 2022 11:56:26 -0800 (PST)
Return-Path: <khilman@baylibre.com>
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id k9sm21502240pfc.157.2022.02.09.11.56.25
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 11:56:25 -0800 (PST)
From: "Kevin Hilman" <khilman@baylibre.com>
To: meta-ti@lists.yoctoproject.org
Subject: [dunfell][PATCH] conf/machine/am57xx-evm: add overlay for OV10635 sensor
Date: Wed,  9 Feb 2022 11:56:25 -0800
Message-Id: <20220209195625.2203204-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VIP camera capture driver recently ported to ti-linux-5.10.y adds
a DT overlay for the OV10635 camera sensor.  Add this to
KERNEL_DEVICTREE so it's added to the artifacts.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Fixes: LCPD-24423

 conf/machine/am57xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index f977c5c62872..afcfbb4318ad 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -25,6 +25,7 @@ KERNEL_DEVICETREE = " \
     ti/am572x-idk-touchscreen.dtbo \
     ti/lcd-osd101t2587.dtbo \
     ti/lcd-osd101t2045.dtbo \
+    ti/ov10635.dtbo \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.34.0

