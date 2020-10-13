Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.6920.1602625756264854088
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 14:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQlDLOXn;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id h4so240453pjk.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hO+OddTqz6khxBsgZWVbC/Zd5RGDyKRGGnniugKl5c=;
        b=kQlDLOXnq50GZvUXoYSoUyoVSbRysim7zLEBnfxerNY/zjYp/JhiqKIiys4oYd9+kf
         X8Z243HkJtq4H/A3trgAg6nURRclb1ZJFLz4uGWedr7cDBRvb4xiOCEe7vIbI1YXvPrq
         pNZ41slMnuV0sSxb7rgepZkMmQILuekYMRyMH0k+KSDcjF/TRCnNrJdQ7KK//v6HAkP7
         e8WLBaZsgnLlwZK9nTezCouVyNRd2cTMkMBvcdMDmbOusAR1CjnbKo6zhktorF887h7r
         AokqLUqfVwyfK5oPIF0MBQ7p0r+TTgk5z2uQvpkKKJpHyXwurbyfluQGC/bFPIS06Wpb
         gs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hO+OddTqz6khxBsgZWVbC/Zd5RGDyKRGGnniugKl5c=;
        b=K8MH3guPgbvDSCo+Q/LhKpAf8mIgJPKp55lpvP86S001OWJC/BnMLwUM9R34jMM1Y9
         PMBm+4cQPiLxcT8Px7wvR1lHqe2a5SJxZsZDkEMli0d8jiNu2WIKqY4lk7uwNewIbYPX
         TuptWoZmM3mXXxt5PfPTQCJ0F/e72UiM1x19DYBPJcAp3qrPHiIgrcettEKWO6gEqtp7
         D0Xvvc6cmtVjDOG4w35hlmeRAF/KI+tjcLD6J+vZc2po4YJpbf2VgTgwXrbb9RbJR/qY
         /j7XbVpiqhoTm/vj4GesRArEnTz9ggG9crVMcF6Ps/VOoYOeQYWpKoxhdVFv1lBWp3g9
         ePug==
X-Gm-Message-State: AOAM531fBAucvxYYt+3ErcFLfsPrJsvEgZuqJqYv0ZcpOEv4dAiFUBxu
	gRZgy4OsGUJfvchyk8y4JSRGFmVLZC4Nag==
X-Google-Smtp-Source: ABdhPJxRa6lTeIMjPSZRrxf0K7OdG855FhpyimCBfPo4g4bwBJKwAAdh5rY3ZKE53Fsu4LKETY5XbQ==
X-Received: by 2002:a17:902:8f88:b029:d4:cb17:e160 with SMTP id z8-20020a1709028f88b02900d4cb17e160mr1506035plo.78.1602625755433;
        Tue, 13 Oct 2020 14:49:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3926])
        by smtp.gmail.com with ESMTPSA id g17sm633189pfu.130.2020.10.13.14.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 14:49:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
Date: Tue, 13 Oct 2020 14:49:11 -0700
Message-Id: <20201013214911.339265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

latest OE-core does not promote using trailing slash to make pseudo's
life easier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Strip slash from S if it exists

 classes/ti-pdk-fetch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 0c9879be..cacd71a4 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -15,7 +15,7 @@ TI_PDK_SOURCE_PN = "ti-pdk-source"
 TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
 TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
 
-S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+S = "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
 
 # Hard-link only required sources from PDK
 python do_unpack_append() {
-- 
2.28.0

