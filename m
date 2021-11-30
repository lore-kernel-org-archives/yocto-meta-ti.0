Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.80460.1638294245724732667
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=PrVebPb6;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.216.45, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pj1-f45.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso18893193pji.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 30 Nov 2021 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id;
        bh=KlqNvOPEO0frMKm+Of8JdWCJbqhT+MqkBeN0hzn8Cjs=;
        b=PrVebPb65ClCop/YX3+o1HhbxbrcK8qjylg7HbG4fa4JLFmwaDnJN5Wj8PEji2PF08
         dHrK3nfibiS9L0scPJ65ILqHQo8yZZHfrxDZGTDV9XRUELioQIB4PiOMG+dTsNMCh7wU
         B6Fq6l5FbPssIWS7nosRqkWlbmdUgd43s4JXhD7XEqt3AVOQS8I+Iv1ZpunV6Zi/2M8r
         KP5+OTFv7edt01qdTSghwlGej0lBuSnFqBAnVXlWBVVvmTAT+8/1lqGFS1Gxu4v5nTA6
         fQtjn5v5/wC1yYDP2Rn3LfDIz9aSguI1gBPlINY5lvHOaxjuAUYCFmthXmCeyg4a6gaI
         Gkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KlqNvOPEO0frMKm+Of8JdWCJbqhT+MqkBeN0hzn8Cjs=;
        b=tjNUULCCTIihSIIaXnmF9rVXDiOEzMma5vArcodDjYRi3hAbdF+DDKzSj73bRIS2Rg
         rX5INDe3INZlBCwYm3GsysnHzXsJx0qzi8CHKqqnawNOfrF8dJl8rQ2wp3+IgLNs71lK
         ANXwprlB3qjCjBKdZ+6037Q6DPveKNwLYT8sR78jvH/bcAWZg2hzos4Ydsicwudnin/I
         bGYZE7cq2vQTzMapK6HlnkG/B1l5rGJCuJEylyYu+nE2S5HqgjzP9mgkltcYiXbHEEhc
         BWX3cBuVD16RNUuVTyEKVd9TsvEH38e7tG4TkWq+buQ/t5ao+p41D1TstxIWxnm2wwEm
         oTMg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531y9+mia2iNkJAJizkG9gSkS0v7vAYVqd8QTH0cuXnEWKlUusu+
	GPDOOXCYTr40qn4xPVpUXuIjJd2QVq0mCnXg5x7f/q9dvz7n0z4G/PKqZEQy3PYHE/fJeyaJjtj
	qW825iHeBjXS7KRvKpoBLxAqMZZx4
X-Google-Smtp-Source: ABdhPJzOL5QeUezRM2kNFwcQ6sLcuJ4100t5DlLJ42vbm1BylkJ4EPEWHRJ6dCvGdNPoBu5I6TtbSA==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id b3-20020a170903228300b00141f858f9afmr831200plh.80.1638294245018;
        Tue, 30 Nov 2021 09:44:05 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([49.207.225.71])
        by smtp.gmail.com with ESMTPSA id j1sm21853985pfu.47.2021.11.30.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:44:04 -0800 (PST)
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-ti@lists.yoctoproject.org
Cc: yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	denys@ti.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [dunfell/master][PATCH] videnc-test-app: Add the videnc-test-app recipe
Date: Tue, 30 Nov 2021 23:13:40 +0530
Message-Id: <20211130174340.962-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

The videnc-test-app provides the video encoder test app
(tienc_encode) for j7-evm.

Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 .../videnc-test-app_1.0.0.bb                   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb

diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
new file mode 100644
index 00000000..3bb5d745
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test applications for TI ENC (v4l2 encoder for IMG VXE384)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=3545dd5bdf513840937d38c10b866605"
+
+DEPENDS = "libdrm"
+
+inherit autotools pkgconfig
+
+PR = "r0"
+SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
+
+EXTRA_OEMAKE = "CC="${CC}""
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
