Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.14132.1619799643125831074
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 09:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hUj0q2oa;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id l1so12215396qtr.12
        for <meta-ti@lists.yoctoproject.org>; Fri, 30 Apr 2021 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIHG+AIyb+6z6QOabQBI6xxqIzjJoVIgVaNnA/SL1Ls=;
        b=hUj0q2oaFnPojNco2E7ndr9jqZFPElJgoNnYj0dX/GrbtQ0gFUlxST1+gU6/pRKmo0
         zypXeFm6XQ4hiqitonAwnL8k3RF8kX/hsYq+u3QpFoyQoqwDMouoHcbjpvwjOvOu7VQu
         uYBBTiLNW7iQH/rxyToNY7pQlNMdakz7OaACAqXwnjT67+T1GRuxxfA3MmEkn4q7dsFI
         4p7bgSSkkfMhS/mvkg5xCZcUQRKJauvQ+nLi0vImCYShMZOLPhXSZ/U9WjB6kbyZszTr
         vs8EhQ8LKhG26+nWhGs2AwPx7oWdEac2ne/Eect/db5KWxQwvH2Vxz4oijSj3/kRwcF1
         Pj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIHG+AIyb+6z6QOabQBI6xxqIzjJoVIgVaNnA/SL1Ls=;
        b=aoDkhgyYuln7JI78HVIZd6jk4wSZRkpvFjD6k4deYZjM1sZDCDLcB/RQOwxspXYlyb
         2O8frnXCt2leCvFeRhYICj/v2ITC4eZdDZfnFXufYqo7RcogRnfiAFM47CAaA8yM3AM7
         ejXlCNSBKDeTl3babG0AsRQlhTnUy570GDlXp1rinbDtoTiPJfwepCKD7lTT4X6GTQdM
         lSIJGIjx8LSDPPmRn58S1mLqOewFPmniOPHi97IGMAm6RFhxQxIPtiCvNG7P5NRuWy2q
         4yXcI9MOl5p1ajNJtgr+9GoCNW6SrA5RfK+xFrYtvXGldo2TPtJsrL3B0PZbvkf6oDqj
         VMjA==
X-Gm-Message-State: AOAM531Z0rytPn5lYMsCbYIc92BxJ/lHSL5+hm7wWDpM5nGzGb4dGyV1
	WTI+/JVoGEcHvNZPDl1c0YOrCmsXp2A=
X-Google-Smtp-Source: ABdhPJxPgaOCrPUsc8N6gXBDGrkXYdFdJ2Y1UgVH7L1TEKQm9haT+v2RfzezRHVUzPcLH6uGtiBTZg==
X-Received: by 2002:a05:622a:387:: with SMTP id j7mr5006859qtx.255.1619799641999;
        Fri, 30 Apr 2021 09:20:41 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id b15sm2874012qtg.82.2021.04.30.09.20.41
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 09:20:41 -0700 (PDT)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] beaglebone: make kernel machine-specific package
Date: Fri, 30 Apr 2021 12:20:38 -0400
Message-Id: <20210430162038.3877845-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require kernel image and device tree as machine-specific packages with
MACHINE_ESSENTIAL_EXTRA_RDEPENDS instead of appending IMAGE_INSTALL.

This binds the packages to the packagegroup-core-boot package group,
allowing one to skip their installation, e.g. for container trees.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 conf/machine/beaglebone.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 896a9d73..8d9af4ae 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,7 +13,10 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += " \
+	kernel-devicetree \
+	kernel-image-zimage \
+	"
 
 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "bbbAM335x"
-- 
2.31.1

