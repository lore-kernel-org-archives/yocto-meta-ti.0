Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.4688.1617866226528590601
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 00:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=kuO25kH6;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69]) by mx-outbound9-96.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 08 Apr 2021 07:17:04 +0000
Received: by mail-pj1-f69.google.com with SMTP id q41so869852pjq.5
        for <meta-ti@lists.yoctoproject.org>; Thu, 08 Apr 2021 00:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5GLr8IFJq3HWQYkXI07PDTZGYUTycTgs7pX4VJqN1o=;
        b=kuO25kH6C3VH4XL6S1e4SXvlzy9byL3VG63ZVk6BGN8mg3/PuPQKdWVyTkTfOzaNy1
         /f8Pwt5NgfnM1bQBE3CrbKO3FEr1l85jlkOqfjB//Cze5ljoX3y6p+fTJX/e8qZiGvmb
         6yKPdwk2oSUJ4b0SXVqtoAogmqkfL0j4nm2gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5GLr8IFJq3HWQYkXI07PDTZGYUTycTgs7pX4VJqN1o=;
        b=bufaS68fWt/CZxNOwW8eUCqh0489kOr+vrVvOkcPJocfqoE16lbxlpQ69EZBkJuSkT
         bScQB+qUGK1jG3PlFtycnWo5A8VCI0fxn01fUcB8YxcW1lENUwpufVhhsQedLKUbHxvs
         SAqUzgVZOh4xzpwCwguLM8gBo3blyx8Iy4LUxcuopnAumnzzH3pDmHAwGxLyVoe1hSHr
         CvyjE532gCT50vsUVfhsnjzei3tnz2XvoG8iZorYQM/ndEwCapk11E7zX1zRTKNCHUrh
         9DsLcVC9nXaQZwuELqKdCRq5vrxRqpi0o2gxoBfVzL/2CW7ZYHJa8jI31TCmg9xBXeII
         FcSw==
X-Gm-Message-State: AOAM532CeC3z20CGbo26Qjhtn5KPaSu2+t10eub2c7qtU4nlWjZl2ner
	jQ84Wd9ezLMCuxxtmR2Jwxt5Nh4omvP5Fnsz4CRt8xAPTe2BUgFvoQsfMBecB4qUs7iNQ2IKvuv
	HnjHHJ6pXGRqRKGxrubhwIgs4hjgIZwnbnokk5nOH2PX0H70BZYRoWIQ44QRJIOc=
X-Received: by 2002:a17:90b:310e:: with SMTP id gc14mr7198588pjb.198.1617866222840;
        Thu, 08 Apr 2021 00:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOxAgGymA/cQA5tFZpwWa9QpertgrSX8z5WCdBHZSD1mgriceDGUYfR27awfnxmeywkJqQ6w==
X-Received: by 2002:a17:90b:310e:: with SMTP id gc14mr7198560pjb.198.1617866222565;
        Thu, 08 Apr 2021 00:17:02 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id j1sm6795260pjn.26.2021.04.08.00.17.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 00:17:02 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja M <sinthu.raja@mistral.in>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH 3/3] AM64x Unification: Update ti-sci-fw recipe
Date: Thu,  8 Apr 2021 12:46:54 +0530
Message-Id: <20210408071654.63212-1-sinthu.raja@mistral.in>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1617866223-302400-5587-2757-1
X-BESS-VER: 2019.1_20210407.1623
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231405 [from 
	cloudscan20-28.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <x0257345@ti.com>

     Updtae ti-sci-fw recipe to build for both SK and EVM compilation and
     installation through one machine name

Signed-off-by: Sinthu Raja <x0257345@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 81 +++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 9 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index d1d10a608..616160bd9 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -11,6 +11,8 @@ PR = "r1"
 COMPATIBLE_MACHINE = "k3r5"
 COMPATIBLE_MACHINE_aarch64 = "null"
 
+inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 TI_SECURE_DEV_PKG ?= ""
@@ -85,6 +87,27 @@ do_deploy () {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_compile_am64xx-evm-k3r5 () {
+	cd ${WORKDIR}/imggen/
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					oe_runmake
+				fi
+			done
+			unset j
+		done
+		unset i
+	else
+		oe_runmake
+	fi
+}
+
 do_install_j7200-evm-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
@@ -99,18 +122,58 @@ do_deploy_j7200-evm-k3r5() {
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 }
 
-do_install_am64xx-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+do_install_am64xx-evm-k3r5 () {
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					install -d ${D}/boot/${type}
+					install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${type}/${UBOOT_IMAGE}-${type}
+					cd ${D}/boot/${type}
+					ln -sf ${UBOOT_IMAGE}-${type} ${UBOOT_SYMLINK}-${type}
+					ln -sf ${UBOOT_IMAGE}-${type} ${UBOOT_BINARY}
+				fi
+			done
+			unset j
+		done
+		unset i
+	else
+		install -d ${D}/boot
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+	fi
 }
 
 do_deploy_am64xx-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					install -d ${DEPLOYDIR}/${type}
+					install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${type}/${UBOOT_IMAGE}-${type}
+					cd ${DEPLOYDIR}/${type}
+					ln -sf ${UBOOT_IMAGE}-${type} ${UBOOT_SYMLINK}-${type}
+					ln -sf ${UBOOT_IMAGE}-${type} ${UBOOT_BINARY}
+				fi
+			done
+			unset j
+		done
+		unset i
+	else
+		install -d ${DEPLOYDIR}
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	fi
 }
 
 addtask deploy before do_build after do_compile
-- 
2.17.0

