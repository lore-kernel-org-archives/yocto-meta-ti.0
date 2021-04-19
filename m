Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web09.5972.1618820455115347626
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 01:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=f6cOhzrv;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197]) by mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Apr 2021 08:20:52 +0000
Received: by mail-pg1-f197.google.com with SMTP id i5-20020a6322050000b0290209113e506aso3024973pgi.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 19 Apr 2021 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Auq23ugrxmGweIUaoXTyqruDdOnwtDvKrilgux8Ch0I=;
        b=f6cOhzrvuiXet8YQmuxDyAQomLWVCY3kq5+5pNr+XuORF38u7H28SrYqPg05de3j4K
         SKlPjYU1k9lu+u93Z86oi7altU1jJFSYRRfTNCdMrnmVdfgYMqhQxVmyA5IzuWUN+qvj
         KfyBrm6r0IRmjM8+Tj5GU+yKtyb8FHwHo+/uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Auq23ugrxmGweIUaoXTyqruDdOnwtDvKrilgux8Ch0I=;
        b=ANeY5lZECpkGfl+oD5xfbd0Wz/W9IXLVqy66hoO3AGDP+n3I8Xi3TMoyudwC9KFtyI
         gQdlP2+K/85cLbj69iTCyljZLSJXZx74m9MFnMzEbJ/0Q55QY/GCPe6yhzBt0NRjPBMq
         LvkJIsiH+BbAa+sImP0aBx5rUKrwhqtIlbCG4FazYL7nO4HoKt5DSEmDHX+PXgzMf9k+
         1JmuiYSBc+nwwrzBS+LuQkYHraCtuMRIWU7EByD2OWmWK7WcRcZqK+cUcDWtH3yIsR8h
         QcNIOmsvnBsUnoW/rixNKWSk+yDyWvlDxj/qo+SC0b6OMZzD3Pe1swCb22w2VOdJbGdj
         3mdQ==
X-Gm-Message-State: AOAM5333ghAJCIQ+yH6+tEPry0HwOGQE01sgeKWH4uSbqfJaAxEn6LWe
	mRcMuy3bkayoTyhlSnnUP4oC9FD7aMZ/D6llO9ROBUn1bb3WF0mCikVOXNjQredxGQn2M32Y2nN
	XDG98j67W9l3gcAHlHvKxTG5BoXs0gipsvR5tyXkmh43Tyhet/4o/vt04f1PkY/k=
X-Received: by 2002:a17:90b:4c0a:: with SMTP id na10mr24483559pjb.227.1618820451281;
        Mon, 19 Apr 2021 01:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYIfa2I9231P//Foo7YOme9v8L9BGe4UDdipVhRfa4K38Pi6KU4264nVNlVs7l5fw9aXxLhQ==
X-Received: by 2002:a17:90b:4c0a:: with SMTP id na10mr24483534pjb.227.1618820451030;
        Mon, 19 Apr 2021 01:20:51 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([223.227.14.13])
        by smtp.gmail.com with ESMTPSA id k4sm12604922pgm.73.2021.04.19.01.20.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 01:20:50 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH-V2 3/3] AM64x Unification: Update ti-sci-fw recipe
Date: Mon, 19 Apr 2021 13:50:42 +0530
Message-Id: <20210419082042.133480-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618820452-302273-5589-118480-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.215.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231659 [from 
	cloudscan14-14.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

     Update ti-sci-fw recipe to build for both SK and EVM compilation and
     installation through one machine name

Signed-off-by: Sinthu Raja <x0257345@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 83 ++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 87fdec68d..de8be2070 100644
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
@@ -100,19 +123,59 @@ do_deploy_j7200-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
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
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
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
+		install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+	fi
 }
 
 addtask deploy before do_build after do_compile
-- 
2.17.0

