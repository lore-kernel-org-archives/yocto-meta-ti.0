Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.14473.1637352951770185891
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 12:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ar6nKNQ4;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id n15so10670614qta.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NcAkA0WdquNyYPjOkw/8Gvz/OTXyLgSc5EaX4AWIlww=;
        b=Ar6nKNQ4QY0mJq6TlvzuMf1Mck4OXEQBblihMZYeQgVCSszaMqfITjyXPT3O1EHMQ7
         8OVe5aHYiwffFtZ/5M4Uc0nxg5/4TtOTrwtHmbeWpsZ/UTJpbrjtVhesIYcfEU9mTq54
         3nYDNc4Zj7sBbzpe8xfRT7EMIenafOQuqbmuIa5tiWue+ctz/j2F18uyPPdnRnDGw7pm
         HvaLltY2TXxhQrEMrw913nLePeDqbubQYaO1EC8R5D3v4BpE045lUPB2uRetnNY2J6r2
         iodpvLX4OBmlZbIjcU85bQtU5Zs2IvesLIrjWmN2j8wq+lPv0F9ILm+WRSHSs4wkVoHk
         +s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NcAkA0WdquNyYPjOkw/8Gvz/OTXyLgSc5EaX4AWIlww=;
        b=3xt8Vyn865fa673LX3x7rv8nbDGlrc6EKbCNDtA79kk5kvvdoMRpO1nw/DjIOnmb4l
         fyPmkKQNgTiyMrtigNG3W1eHgInP8vcCuz5YzSVDP9kWKagxgLQR51b2GoHI9L4jti67
         Di9gFgR4VTkEhaFTbehX8W4P+koBBlT6nbRMRiKJ6GFwDfHMNyggjzFSFaUQAuKvwr3p
         F4rnTvbuRl8beaRPllDFbxQUBFKHn8ZKxBrYz1WB3t7oJAFQ0MGpn1MHDC8O9sRmsIE8
         BHT5XfdjiCf8qLA8Lp69VGg+lIRDcn60TamAhZLjfykYbnDMlwyEYJ+ECqzlyjrjReAX
         VZIQ==
X-Gm-Message-State: AOAM531D1Vxa/IuUdLNQWP5rrkzQj3Ojco+DxXB1DnalR4VqlwVi3BWr
	JM1PmZ8oRbkVG964i/HQiKxTGy2wuc8=
X-Google-Smtp-Source: ABdhPJzyQuX5jhauDRXYoyORR2sZsJZTsZqPmKyB1m+UvMsEB7iDzJWRp+uguN7LAkNwR4wY5z6l7A==
X-Received: by 2002:a05:622a:20d:: with SMTP id b13mr9297724qtx.368.1637352950719;
        Fri, 19 Nov 2021 12:15:50 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id v5sm394537qtc.60.2021.11.19.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:15:50 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: [PATCH] ti33x: remove the screen machine feature
Date: Fri, 19 Nov 2021 15:15:33 -0500
Message-Id: <20211119201533.2540388-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some distros or image recipes may rely on the presence of the "screen"
machine feature to install graphical front-end applications.

The ti33x SoC has an integrated GPU but does not have a screen per-se,
thus having this feature in the SoC configuration may lead to unwanted
packages being built.

Comment the 'screen' feature and remove it from MACHINE_FEATURES.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 conf/machine/include/ti33x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 197cac19..c499928c 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -61,8 +61,8 @@ UBI_VOLNAME = "rootfs"
 
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
-# List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
+# List common SoC features, may need to add "screen touchscreen" for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
 
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "am335x"
-- 
2.33.1

