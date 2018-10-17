Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0EBFE00ABE; Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A188E00A94
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
Received: by mail-pg1-f194.google.com with SMTP id g2-v6so12985692pgu.11
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BuxYLHrehmA5kIJ0wS42rZf8EWkk8xgmpEyvToqWYNc=;
	b=uA/fPmSZfBonBradBfI8oT9ePNnztKFlIBBl2FksTR15yqijHTxE4VXkYF+Fv0UYcN
	p126kSGNTvZkDoErR2FCT12ZgfHjutX+DtGSNVXEt7HR23UOyoCjXnuE4MUaaTFQfBWx
	loYvIOR3JsaGhD+YqZLZQrrTPWe13YmFzNng5CPih1JBDrK38KWRdd+qI761kCOMQOH5
	YdqI3EwJx89Og67p/lLnADtvsm4H+WwtPGFeTyZbZmc4KcXA0GmXv03CJ5zWuEdOaUSY
	QCByCR/RQb5+TleLV77Ir5TRIDhB2vQyuA+csH+jrqwREvmuLJXX7dSeKBfUmuAUBCqR
	9LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BuxYLHrehmA5kIJ0wS42rZf8EWkk8xgmpEyvToqWYNc=;
	b=V4lI7n/5j6pQ12hRi2t8CWIRONm0jFjQRFXmzO68dG59jV/Dnur23nrlRU1R5xh7aV
	MhAADEFvitU6Ek14hPX7fCJd+bKSe2VsmkURQiAuLCfZf9l1q8P33fo4FW4fdRnS+sL7
	40TGoMnXP3SR/D60VPQbMqmaxD/BDVfBKwsrvX6ytsh/O7Vkfru+2Mv59jHal7NsXsJz
	E6yhT8mKFjKd0roS6ACRioIvijnFYT5rMvSqBQWBXaf7ankx3wYxHftyGM0Bs7mP3x0i
	onU1j2/TfJfXfj5dZQym85dIWvxvfSCefxo+w39QLQhh/fSH34GDkhc9jDzEA+ISm2/6
	mNtw==
X-Gm-Message-State: ABuFfohv46r5LqVeoRvj4dj2KhzIm080EL3ct1F66nv4vaD7wudWnAtZ
	RiljQmRZ0TpFGaDbWyQg7ORq5F0TTzo=
X-Google-Smtp-Source: ACcGV6048EXgqcd0ckIsxo2YA2xkJZ0NJV+8Vakq0eEQ4p5O4JLJBqR80Djfe4XWGwk7kz4UH/jPPg==
X-Received: by 2002:a63:184a:: with SMTP id
	10-v6mr25239700pgy.81.1539804546194; 
	Wed, 17 Oct 2018 12:29:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	j3-v6sm18044151pfn.175.2018.10.17.12.29.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 12:29:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 12:28:50 -0700
Message-Id: <20181017192853.42942-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181017192853.42942-1-raj.khem@gmail.com>
References: <20181017192853.42942-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] recips: Mark more recipes to be ti-soc specific
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
X-List-Received-Date: Wed, 17 Oct 2018 19:29:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 3 +++
 recipes-bsp/cmem/cmem.inc                   | 2 ++
 recipes-ti/devtools/ti-xdctools-common.inc  | 5 +++++
 recipes-ti/osal/ti-osal.inc                 | 4 ++++
 4 files changed, 14 insertions(+)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 93cebd71..e1f21054 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -24,3 +24,6 @@ do_install() {
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


