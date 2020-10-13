Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.2394.1602614205757228470
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 11:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=la3/ydaN;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id g16so413024pjv.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dVWmvO/y71c0IzbyV3yvEY1teIKJcZ905baV7J+oHxM=;
        b=la3/ydaNylmti5jhs/5wFPH4Co0gmpHoM9EXuUUZdzTsJSHYHqHU7H+KEH7P/pPrli
         aSbFUI3GhVdiFNNnKdi2snwFMwjeUk1JcJbesiJZo8JtvTr1HjrC+yjTxcoZ3b9wPIYm
         eTGDrGsx7LoqsDdqql/jQMoz6fLy/C09oTWI4CRXeBuLNVmRBErmQ5e+lGWDVDkdjmwf
         XV1IsxY+SWM6ATojMnvFP40nOpE0dh91RiawAzu18MhcMIvCagyvpQBLCZ0uXCGcNdBn
         juczI8axydTTOZj/4FPtsFzUikSs8H0ASITu+76Yx7G9+zrAtL22esU079m+wLSE4TOx
         sodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dVWmvO/y71c0IzbyV3yvEY1teIKJcZ905baV7J+oHxM=;
        b=fm0rfob57sm5k519G6SBG9ZOyQ1LGbWqOS29nqKtqESEF40qCV2qbo3kPiPw/BTxXF
         s1sTngcUWO5KwB4/oB0Xs4rV+XSY6zsdmZvCyrgfllogEWs9qsyxj1H+Qtqub1sphhBj
         Yed0kdmpYuOjXr2vTVA8cZOOxh7KiCUfRA2FG/7Ujn9J42b0gMeKAwp6cywWgCLH1FJp
         xiOr8GQrsGyr8IzRM+oqTBIo1thK1S8Iu8wu9H02ZxQo9ACmsNvuxnUX2UkuIeLpjTDh
         FhG1iiGM1hIZaG07iaEA3hXEpLwyKIc9gjk4Dot3YUANmbSbuhfPJF04RMlafZq7A5fg
         rKCQ==
X-Gm-Message-State: AOAM531N1cqU5BzTGeyWvAMeDbqs8tdkXha9y4MW8LNXRcR31UtM2XEH
	Ot8qa4smE+x3Vvbt/q9toE3zSjPcZ09j4g==
X-Google-Smtp-Source: ABdhPJzFrgpyGxmT/y5ID6a2l/wks/BK8Hou2nOQQ62ub17Q8PSUgotJ1icyXG7NFBgBqAr7YWJINA==
X-Received: by 2002:a17:902:fe95:b029:d4:c98c:55b6 with SMTP id x21-20020a170902fe95b02900d4c98c55b6mr760359plm.85.1602614204802;
        Tue, 13 Oct 2020 11:36:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3926])
        by smtp.gmail.com with ESMTPSA id u69sm385374pfc.27.2020.10.13.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 11:36:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
Date: Tue, 13 Oct 2020 11:36:41 -0700
Message-Id: <20201013183642.267548-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

latest OE-core does not promote using trailing slash to make pseudo's
life easier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 0c9879be..4261e86d 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -9,13 +9,13 @@ PV = "${TI_PDK_VERSION}"
 PE = "2"
 
 TI_PDK_COMP ?= ""
-TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
+TI_PDK_COMP_PATH = "/${@'${TI_PDK_COMP}'.replace('.','/')}"
 
 TI_PDK_SOURCE_PN = "ti-pdk-source"
 TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
 TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
 
-S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+S = "${WORKDIR}/git${TI_PDK_COMP_PATH}"
 
 # Hard-link only required sources from PDK
 python do_unpack_append() {
-- 
2.28.0

