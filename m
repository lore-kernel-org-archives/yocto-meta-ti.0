Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326EFCD13DD
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.796.1777481080363381090
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QsROpTxG;
 spf=pass (domain: ti.com, ip: 40.107.200.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEw3xvk1XMkStNF08Ybf+VFYwIRiz4/aGgL7slIghHP8n1RZCp9PueFCderWU6DHmubpwNynuYrsptdK1P5bJx9ftV/lrTq6KOsnqa7CTeWLA+vxYbxCYL4+hB6QmIz6eDGfL2TrKKO+TfYiKZCCTK2yXp056aaaxN4jwJbPApgvHtX0LoApUWJL0l8ciZVHN5LIXIovvdk4H1uDXHJ619Q8D8Zv1q2T2bcm6xys4s6w1sP0OPvGFKrpBcBr8f1WC0Rjhb+avaAt0RT92a3+UCjNbVe89ndlcd/Rk4ZZYlL+vUp1LgvKvt1kOO6SL12xWzC1XlHiKT3w86i5MTWQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlXdrr89wDpoh2OWKsU4Cx2WWcS0daNsGLJ73lo6qk4=;
 b=Z7yKl7INQxzkEQ6q2R1lIS5xEF74SnG8AKSAqFPuw+T9ozl9YMUGv53+MOvkprCL8RG1QMJ8S320CJVzWw+EIkjRvnaBlENcs9QmxSw6octhX9wP1NmMzP5TA6LHFXLFgP8RdnKv6q1rqZMFoiHNP/XrUXQsUtyZu8qFwh9QBhj59+inE3JaNTSTifsu5q5vDPMiy12/aBa57efaQyvnYn498ltGaPjgobqd1T5cQQ7x9oEgfTzXLMNqm+qeTlSbY0VQooPCtAN4umxpBAqK9NS6WFCv2OT14hV8XFhvIsANmPNvfwKZhMbrbXtpjTFsEwaX2DzmPVafPjLaqjYWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlXdrr89wDpoh2OWKsU4Cx2WWcS0daNsGLJ73lo6qk4=;
 b=QsROpTxGhYhiAhGrcm5xvsSh371K53fhR/r84UDgMpstowyh/00IAK3KKX2K0EGGiVgXYgzAE2Vq5DAd0whubzbQ9ZvtN8eVteqWI4c8BknrJh41oKTXmlr1kuxGbv47o8/GI+4eCxzsF6Gsy9qmUJ5gowb44p/1jCB74itTBQI=
Received: from BY5PR17CA0039.namprd17.prod.outlook.com (2603:10b6:a03:167::16)
 by IA3PR10MB8736.namprd10.prod.outlook.com (2603:10b6:208:57f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 16:44:36 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::69) by BY5PR17CA0039.outlook.office365.com
 (2603:10b6:a03:167::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:34 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:33 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWED3487246;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oO3-3BLx;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 08/12] meta-ti-test: Import the recipes-kernel recipes
Date: Wed, 29 Apr 2026 11:44:28 -0500
Message-ID: <20260429164432.1623594-8-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|IA3PR10MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 159e0292-3c89-4478-cdbb-08dea60e9845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	nrmxKP7fGjXcGvwEEa+2juxYsGCKPUKKJmc03MC4k81Y1zjWlOOX6rV7sxb6/0rknjm/Qz9iYaiUUcxdH7HyxUlKWD5D560LksB3gqkbmmV1yUcBXUnsM/8O3dtm9opyttySzOnbtqf9oPvj1+jkvhHfcAIaMNsULkD9mYhIgY8w5mJuOO+zF5Aok4fy8NuBI7IWrdqd6cy8oXiBWq/CqEiMmeKyPyqAdC8i+nf89RiDBUvcpqfCw2SVzz9LcTWQTmVEex0OKXHeq0IYhspfzpMYqta2Xzm1DFfpDAaWnTxxENFLfurf6qpIQfFS8mIvfhUqndaNZstY4DYEz/OpCBoMLYcGz0zNJBO2bA4zqVMttJ0ciZKTdAHExLKTs739B7Hri8/Y1a9cwZhB4+Wig4/r9phTNDOFPImlAH+rvDtqWxnzgVtR5Syrk9hW6otqVOi6NStpLuMjTPxD2bGnjWRFp3ZX/fZsGrw8kT/j3UX3yfX9OBo6gALza6DfOmwcYiG3hUdRfCED8Fm9RQJkVnC5/8Y6nzCjAmpazZzWCxd4ddHtbOJvglx7g2LMFWUM5VoA9TaW5U+sdrK1H7sryX6+5sZvr3SWYdL+47Y9hTvVhGF5PcsDCiAEpTX6u5asjYyqmBZ9zmoeSgXXjhRqNL1acWHMqlgCRYrRrAU1SmIcLGx3BzkPblt2dSjHL8/gaKDA35kx8MPZHw34PMcdA3AEXqolvwcanQw/KTiS4642DZy69Do6qHd/e4xiGDRH0PGqdMDMoaLKvF7mREw9+Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	di24MabSEVzMsQteiZ0CtwHnUvKZUI+NSjhIgRYOkpTOiL00943u+DkwAWF4aU/5WnZI4Vix1NVSbsp72nDmk4fRm6CIq9SQ0b5Et0AumYP0wfyIBP5/WI3zaTMlWeKfNAq8G9fznFPPWG2qopmovFpjQMfp6USF79kpnAFHJUE1A0041fj6oYyzumt/oVB/Yel3hXXXA7kQiW47jJJ/tF24U1sFThv8R/0TeHoBVJiudR+xxwi58ygnOxesqlBuaVCINZqHqSBhAIfhqHUFjQltJWItn9fhKDaPPo1NDEwIda+CdgV7Ql7q//wG+uRbNgOTLeE5rzzsaXt/GLAXsqjZ2+QkwVRW2klHA04U4lYhG+pVkJghXGW1q5NQqpQ9kXFZzSnwOuH/WxIQWAE4GnA8QsSz08hhtqxZmoTzkz57L89x7frLQlgOAx4pcJrk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:34.6378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159e0292-3c89-4478-cdbb-08dea60e9845
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8736
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19907

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
v2: No changes.

 ...Fix-Makefile-for-to-build-with-yocto.patch | 46 ++++++++++++++++
 .../hwspinlocktest/hwspinlocktest_0.1.bb      | 18 +++++++
 .../kernel-selftest/kernel-selftest-ti.inc    | 53 +++++++++++++++++++
 .../kernel-selftest/kernel-selftest.bbappend  |  4 ++
 .../recipes-kernel/pcitest/pcitest_5.10.bb    | 18 +++++++
 5 files changed, 139 insertions(+)
 create mode 100644 meta-ti-test/recipes-kernel/hwspinlocktest/files/0001-F=
ix-Makefile-for-to-build-with-yocto.patch
 create mode 100644 meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlockte=
st_0.1.bb
 create mode 100644 meta-ti-test/recipes-kernel/kernel-selftest/kernel-self=
test-ti.inc
 create mode 100644 meta-ti-test/recipes-kernel/kernel-selftest/kernel-self=
test.bbappend
 create mode 100644 meta-ti-test/recipes-kernel/pcitest/pcitest_5.10.bb

diff --git a/meta-ti-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Make=
file-for-to-build-with-yocto.patch b/meta-ti-test/recipes-kernel/hwspinlock=
test/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
new file mode 100644
index 00000000..3386337f
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-fo=
r-to-build-with-yocto.patch
@@ -0,0 +1,46 @@
+From 0a085bff54c3f02c20412c5f5a4060c2acb20d4c Mon Sep 17 00:00:00 2001
+From: Judith Mendez <jm@ti.com>
+Date: Mon, 18 Nov 2024 10:26:55 -0600
+Subject: [PATCH 1/2] Fix Makefile for to build with yocto
+
+Fix Makefile that builds hwspinlocktest out-of-tree-module
+for yocto recipie to be able to build the module.
+
+Upstream-Status: Inactive-Upstream [private repo]
+Signed-off-by: Judith Mendez <jm@ti.com>
+---
+ Makefile | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 23ee629..d8fe76d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,15 +3,17 @@
+ # TI OMAP HwSpinlock Unit Test
+ #
+
+-obj-m =3D omap_hwspinlock_test.o
++obj-m :=3D omap_hwspinlock_test.o
++
++SRC :=3D $(shell pwd)
+
+ all:
+-ifeq ($(KERNELDIR),)
+-	@echo "Error: KERNELDIR not set, exiting..."
+-	@echo "Eg: make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- KERNELDI=
R=3D<linux-kernel rootdir>"
+-	@exit 1
+-endif
+-	make ${MAKE_OPTS} -C $(KERNELDIR) M=3D$(PWD) modules
++	$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)
++
++modules_install:
++	$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_install
+
+ clean:
+-	$(RM) -r *.o *.ko *.mod* *.dwo .*.dwo .*.cmd *.symvers modules.order
++	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
++	rm -f Module.markers Module.symvers modules.order
++	rm -rf .tmp_versions Modules.symvers
+--
+2.47.0
diff --git a/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.=
bb b/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
new file mode 100644
index 00000000..cc566b37
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Build hwspinlock test as an external Linux kernel module"
+DESCRIPTION =3D "${SUMMARY}"
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbfa02c83df161e37647ee23a2c7eacd=
4"
+
+inherit module
+
+SRC_URI =3D "\
+    git://github.com/TexasInstruments/omap-hwspinlock-test;protocol=3Dhttp=
s;branch=3Dmaster \
+    file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
+"
+
+SRCREV =3D "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
+
+# The inherit of module.bbclass will automatically name module packages wi=
th
+# "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES:${PN} +=3D "kernel-module-hwspinlocktest"
diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti=
.inc b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
new file mode 100644
index 00000000..bae5b7ab
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -0,0 +1,53 @@
+# Tests not enabled:
+#   openat2 has buildpath errors
+
+TEST_LIST +=3D "\
+    arm64 \
+    breakpoints \
+    capabilities \
+    cgroup \
+    clone3 \
+    core \
+    cpu-hotplug \
+    cpufreq \
+    efivarfs \
+    exec \
+    filesystems \
+    filesystems/binderfs \
+    filesystems/epoll \
+    firmware \
+    fpu \
+    ftrace \
+    futex \
+    gpio \
+    intel_pstate \
+    ipc \
+    kcmp \
+    kvm \
+    livepatch \
+    membarrier \
+    memfd \
+    mqueue \
+    mincore \
+    net \
+    net/mptcp \
+    ptrace \
+    resq \
+    rtc \
+    seccomp \
+    sigaltstack \
+    size \
+    tc-testing \
+    timers \
+    tmpfs \
+    tpm2 \
+    user_events \
+    vDSO \
+    watchdog \
+"
+
+TEST_LIST:append:bsp-ti-6_18 =3D " \
+    pci_endpoint \
+"
+
+INSANE_SKIP:${PN} +=3D "staticdev textrel"
diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest.bb=
append b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappe=
nd
new file mode 100644
index 00000000..163a074d
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
@@ -0,0 +1,4 @@
+KERNEL_SELFTEST_TI =3D ""
+KERNEL_SELFTEST_TI:ti-soc =3D "kernel-selftest-ti.inc"
+
+require ${KERNEL_SELFTEST_TI}
diff --git a/meta-ti-test/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-ti-=
test/recipes-kernel/pcitest/pcitest_5.10.bb
new file mode 100644
index 00000000..9ab0dbed
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/pcitest/pcitest_5.10.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Linux Kernel PCI test"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
+
+BRANCH =3D "ti-linux-5.10.y"
+SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
+SRC_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;prot=
ocol=3Dhttps;branch=3D${BRANCH}"
+
+do_compile () {
+	cd ${S}/tools/pci
+	${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/tools/pci/pcitest ${D}${bindir}
+	install -m 0755 ${S}/tools/pci/pcitest.sh ${D}${bindir}
+}
--=20
2.43.0


