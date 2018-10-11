Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26379E00AB9; Wed, 10 Oct 2018 21:23:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.173 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBDB9E00718
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2018 21:23:36 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id i4-v6so3519617pgq.9
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2018 21:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vFKpmrF+iAsU5yDzfycUGBmKfP1gbsZw/9tu/7QJ14M=;
	b=OMYtgQogSzgRVUcBLIMeAPTTfn69QUAO4B20V3nXWTRRp3SsPTBz4IJMHwFO7I+jDY
	vZ+BJduF7sM4xJcJfegMJ5cn7ROLWh+MA+kXIucg3DavLtndA6UKlH/3LsaNqoxKBBek
	Vj4Q8qC8inazDAL4hdLNz1vU7zpyduE+SrWmZhPulfW1QsiZ7fB93aobzuAjRTTQYReC
	EIzbD4k0HLyHo/8QQIMszZBamH4dXImXi0ENk6URRFcejKDTKtCF8x3LNFCyH7Ppm5RB
	60RAWXkAZ7eJh99mI4oMRQXmyVipEqDb/9Pho0/m8xTxXdGii/KHp1uA/weWaUxyNprQ
	AjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vFKpmrF+iAsU5yDzfycUGBmKfP1gbsZw/9tu/7QJ14M=;
	b=f8aanj0h4o6aRfHd0t1646z9RE82FG3zhLizb2XsJbvZMOI6a17whDWHYuJJ1kKKeU
	JLUMhNGiTT7SWVUXdR8PoPs+gzMjYB5GtTcjRQihAqAU5t3ORdK1MBVIBAc8TuWzyPnk
	VL/G0omhv9dkzMgd1eIpPeIGW5gmpIqqgT6oPWtgcbBxxbUbi3a5KgPsnFcd0XffdCi4
	gc+J6FJrwxO+6n4jIt5rc+y5qwpvj9aZIYKWqg4N7tVznDVfUmT7Ch9Iv0fjPzuC1cnH
	dyxSYPwUwhSKLARP9fmaxRMm+1QbKjTRPk0+rN06kvCtXn9FtdyFXg73Z8EvCiMikTqI
	3jPg==
X-Gm-Message-State: ABuFfog7RlfkdoaemXbiz494EltD00G0hcqgbv119SCGozqLLNG56VYp
	Uqc8/MFuhFRuZx2nvJv0QJtsXJvT
X-Google-Smtp-Source: ACcGV60UZaTRWXT7L2I3sX3LrYzHryFVcA3S9N+wPdtd9mL+rr0XH+wq6d++JZ3/aNq+xivAzfo3sA==
X-Received: by 2002:a63:2d43:: with SMTP id
	t64-v6mr32675926pgt.128.1539231815568; 
	Wed, 10 Oct 2018 21:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	n7-v6sm13613984pgv.63.2018.10.10.21.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 21:23:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 10 Oct 2018 21:23:24 -0700
Message-Id: <20181011042324.31996-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] recips: Mark more recipes to be ti-soc specific
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 04:23:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 3 +++
 recipes-bsp/cmem/cmem.inc                   | 2 ++
 recipes-ti/devtools/ti-xdctools-common.inc  | 5 +++++
 recipes-ti/osal/ti-osal.inc                 | 4 ++++
 4 files changed, 14 insertions(+)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 3572638d..29fff504 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -26,3 +26,6 @@ do_install() {
 }
 
 FILES_${PN} += "${base_libdir}/firmware"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti33x = "(.*)"
+
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 11cebe8d..abbf2492 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -12,3 +12,5 @@ PV = "4.15.00.02+git${SRCPV}"
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
index a3949cad..0e86ef7a 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -61,3 +61,8 @@ libhpi.so \
 lib.so \
 libcairo.so.2 \
 "
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
+COMPATIBLE_HOST_class-native = "(.*)"
+COMPATIBLE_HOST_class-nativesdk = "(.*)"
+
diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
index cb8da354..bbbdf517 100644
--- a/recipes-ti/osal/ti-osal.inc
+++ b/recipes-ti/osal/ti-osal.inc
@@ -19,3 +19,7 @@ INSANE_SKIP_${PN}-dev = "staticdev"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
+
-- 
2.19.1


