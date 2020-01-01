Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web09.14369.1577877709030603459
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jan 2020 03:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nTrhPxpW;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id 4so20701922pfz.9
        for <meta-ti@lists.yoctoproject.org>; Wed, 01 Jan 2020 03:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tzfe0lMErq0zalPytoB2o8ClXuyrxG3JXgKPXcnZuro=;
        b=nTrhPxpWortJDFEt0/UQodeIZHsEqLEFf18BYUx6ijDRnkBTL+laDFOh8cMZCQ6UXH
         12j2RYs+FGJgXpLuE5xe9jXF9j/R+6bsO+jb2/mrxgKDt8jMYb/nxc47aDO21WhXyT8p
         YXW3173XhnjwKcgxNgpQfVYb0fj+eBB9GzJ6RmzY6qWctiGZZGf13ZXvWKU2m9QPm29i
         9ZpExm6TwaVvxQ4hJxCWZBKzxiHyF4EtZ2x4v+ObpmvpxPC29fknJzDx5Dk/f0PSA8Wo
         jbhV5v5/fIXU520dU1Q6BfRigDDX5ZpC+eRT2Kxg+Zg9/fye+SfplOfWQzut2qIjdAGd
         eClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tzfe0lMErq0zalPytoB2o8ClXuyrxG3JXgKPXcnZuro=;
        b=FpcGpm9qnqyVfH4T82c3H1OXAP6XVifQ/NQ3EtKY0FobblfRmRCFU0YJ2zkGGHkdlu
         Az/2gWnoCbXYahQeIbhniZtQ+6vabxVlkhv00vAp+kgvm5SU6tek+TYmy+gSLG+qdhpo
         TMnx+nH3w+p/P7BOb9icDB5ychjrqIwn5c4cOWTqf31wawT5iGmeVLANJC4+BqCpcylX
         MKifvxleZX9KMm7bS5U0KUbHCQ7uAUq1mmPD6ZnaLONeo2eX81MMZoue/5NlBbAuRJ/S
         33T+ZycRrwck3NwaSbR66Op9wPyb0qsrTk0JtPY211Z6039oYJo2SdGNgnssMy7pNXS3
         mZJg==
X-Gm-Message-State: APjAAAWD5tv9J7E08/Bue5NGTquh83M43Y9WGeANmYTibPJy7s/I7F7u
	RwiZm0RKbFPNZh7Flzd0gDswCJ/TRgc=
X-Google-Smtp-Source: APXvYqwJYKdeMtj46vuuPwD8fHMMKq+qRkagMIgmaHtnDwKyy6cTVIWk/L9Rzi+SP8pgqD6DplNpaw==
X-Received: by 2002:a62:1c95:: with SMTP id c143mr80537426pfc.219.1577877707987;
        Wed, 01 Jan 2020 03:21:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
        by smtp.gmail.com with ESMTPSA id g24sm59349697pfk.92.2020.01.01.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 03:21:47 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] rwmem: Delete
Date: Wed,  1 Jan 2020 03:21:44 -0800
Message-Id: <20200101112144.3267596-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Already migrated to meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Delete recipe, its already in meta-oe now

 recipes-bsp/rwmem/rwmem_1.2.bb | 27 ---------------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb

diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
deleted file mode 100644
index 0545b0cc..00000000
--- a/recipes-bsp/rwmem/rwmem_1.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "A small tool to read/write memory"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS += "python3"
-
-PV .= "+git${SRCPV}"
-
-SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
-SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
-SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
-
-SRCREV_FORMAT = "rwmem_inih_pybind11"
-
-SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
-           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
-           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-
-do_install() {
-	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
-	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
-}
-- 
2.24.1

