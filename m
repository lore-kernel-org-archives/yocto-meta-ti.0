Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.3383.1581381809978796403
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 16:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xh372uyC;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id 12so484403pjb.5
        for <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2020 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCo/AahkpSUAxuDyyL2zu8oroqk6wkYK6G0RDjkdOJE=;
        b=Xh372uyCZzRUUn3ENWLJ+dikznUIlB4yKvEn+e3Ukuyku0lkNOrG/gd181mxoRcB1N
         H7mblzzZQaQAdd9OQaA99QaiC8XzNwsXA93qq0HZha4xZBgXEGYCligPNj40L+WKi505
         n5PHzFciVg01ZhBbf/nwX6cYy48EZw2KAY8HnNutz3F12BHVPlkfP9ETatvVynS6IsdT
         ThmdJcSGqvyQ6k8OVL7IKm1ymtSRIG0+Mgz/2Se8/hyJKPg5kDEKr8xsQpHXGi0GSGUv
         FuwdXU5d9PbHjbeTTS8GeX87ZjLIKNKpVtCGRlJ/dRy+O8uLWWUaBsBW5GSIbK8po5jr
         1UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCo/AahkpSUAxuDyyL2zu8oroqk6wkYK6G0RDjkdOJE=;
        b=hu0RAJwl0i8yhAsX7Lul7hVQqqn3G0R6XyQLZ+ZkfXUqFoqsnoBoegikvdcw0/T5xf
         8ScfxwkiilhcXc1ePZbwP1e+iLKVVuMx5eXKRR35WDhWlNZXw7J3CYBAfHD14IPNZnkj
         RFcUrP3jA0m+METGA9pn+FGWYMc1zkPfRbnCYuMHVsW+GnN/Jm6AGCSi63iAisR/f603
         oODqrxxKSRMjE0Fj7L1lyBoQtQes2ThBvs3WkFgSjRBYk3WSstgmn1YHN0b5ga97cPOK
         t3v3IUguNMfauC7hBtQO+WIoe4jomLbOptyDX4vmQg1ESCB0HYolGjVNZeo32uMWM18W
         UCgA==
X-Gm-Message-State: APjAAAUlEaAssgRCYQxz81hdoi5d7rlS2ooIaID1vLF9uma4p7WMBwHI
	xvvH1QPyTr3owv0tXjo3ZsHAMUVzT70=
X-Google-Smtp-Source: APXvYqwkVjR8eIdcbe5dl5epVIEeGJgzr9y68Jc1IjMeGKNqXc9r5vkp9pzfUrGL1A7yob9QZ2Y3QA==
X-Received: by 2002:a17:90a:cf11:: with SMTP id h17mr585109pju.103.1581381808946;
        Mon, 10 Feb 2020 16:43:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
        by smtp.gmail.com with ESMTPSA id g10sm1302118pgc.87.2020.02.10.16.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:43:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ti-cgt6x: Limit it to TI SOCs
Date: Mon, 10 Feb 2020 16:43:29 -0800
Message-Id: <20200211004329.3326947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helps meta-ti live in a multi-BSP distributions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index deee61c7..c63c3f6e 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -102,3 +102,5 @@ FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
 INSANE_SKIP_${PN} += "staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
+
+COMPATIBLE_MACHINE_class-target = "(ti-soc)"
-- 
2.25.0

