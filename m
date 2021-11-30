Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.80254.1638294204862282805
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=Tcz9Efdr;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.210.182, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pf1-f182.google.com with SMTP id x5so21410702pfr.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 30 Nov 2021 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id;
        bh=cnj9KjDNM/lsT5vywTjj2JCL1G19ZnzKkGsdD26aIf8=;
        b=Tcz9EfdrHH40q4jwdIWCYxw1UaVnqLjiHqz5VSkAPsLjaqquimq9Jq4nfMj9CBShPJ
         IaWi9oBi2IqphYufYrR1izfDrA5tCo9y8ywA1FiWNW5+Pxk+62Q63sibUjwXfk1rI4oS
         k1LJ6KMesHwBLtibGUuYNhTBYSLuthCLEGOxpAqrVDZ1rOBeQVQeBbJMOkrZOCPYj1TG
         78dHMSb12OoHz51q2gmfyI2rdN4N2NaxDkxAGrKaNK+e7FATBedcD2Di85ZB8go5/X6g
         KmQHBgyWGJzc+34FZYvSJjxw/ySDtd7QWm4xKU/cGO1CCGUYEaxoJjstkCqIXJ4+GZUd
         PkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cnj9KjDNM/lsT5vywTjj2JCL1G19ZnzKkGsdD26aIf8=;
        b=FTtmzWyqxjRVcxjwWLFckVyDY3tQIuP+nK/nBoN0utCnStbWGCv/drE3dSSiVdG4gc
         IAA4fpUO6Hah5n4uI8UC+nFs3buVgL6m9wO+TAsgmSJRRml1lje8tf0h/yu18bFFDbmu
         1upn3rlrE+C7Bj+X5xOAqlx7x8uFZ2mLoRCBumyWlkEHHdj5cbGXsG9XelJ3TC5v5vot
         h9mD3jDY/6oi/8MfPnvhnbEXAicH11k5FdEH73o3B8PYlrE+3oGUWxkv4SPhf1iH6FWL
         /3eu+QMmJjNQONCcf5YGwjNLRDs7DxZ2e8kQXJoG9ku4JOqiJGQpJjw6u9sUuPo5W5AQ
         7Dew==
MIME-Version: 1.0
X-Gm-Message-State: AOAM530xCz96Z8zQ5h4R61DL6u735SE48QPX3Paati5bZM33W7C5QIbP
	sWLCAMHc3KjcQz+Up0/Rlh7RnDnYyoZwESA/JdB1KQ/zwrjdjfpnFL8pfb+9d1a4AIVyv+/5JNP
	JsnK0etkO6cns3TKghxhnYmxVYZOX
X-Google-Smtp-Source: ABdhPJz7AttHbqAx9Y30gwP4UsfzwLQZB5xg6lMtQOKQ/zJuzMhsb26wmUbDIePB42f8tuQXvbY46Q==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr497103pge.514.1638294203879;
        Tue, 30 Nov 2021 09:43:23 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([49.207.225.71])
        by smtp.gmail.com with ESMTPSA id mq14sm3756406pjb.54.2021.11.30.09.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:43:23 -0800 (PST)
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-ti@lists.yoctoproject.org
Cc: yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	denys@ti.com,
	Sidraya <sidraya.bj@pathpartnertech.com>,
	Angela Stegmaier <angelabaker@ti.com>
Subject: [dunfell/master][PATCH] viddec-test-app: Add the viddec-test-app recipe
Date: Tue, 30 Nov 2021 23:13:01 +0530
Message-Id: <20211130174301.906-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

The viddec-test-app provides the video decoder test app
(tidec_decode) for j7-evm.

Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 .../viddec-test-app_1.0.0.bb                   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb

diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
new file mode 100644
index 00000000..48a17537
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=f17e17d664f72942124e4fcf06c178ee"
+
+DEPENDS = "libdrm ffmpeg"
+
+inherit autotools pkgconfig
+
+PR = "r1"
+SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
+
+EXTRA_OEMAKE = "CC="${CC}""
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
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
