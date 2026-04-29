Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26618CD13D3
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:46 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13786.1777475378084843679
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c6rHnuS1;
 spf=pass (domain: ti.com, ip: 52.101.57.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDnAEG3evEfi0EAsOc8vHRxBqpZMOq7+85xpjF2uJ4cJ9jEYnkYwzHlAuuhHi0HDsjDCAxMMrvQ5haVdTBGUeFPiRjRvoup16aTZOWZYHbPu08g3hTwn1HY5jhg5zWoVS/AWKYCsIEgsTIwLSZSqrVFe1IQ67p8ackx3Ad6nVXgSqBj7DgM4cKyuPO3gtpE5U2SD8Ig97mKei3hXfiiddApLwiD1YAsUdWTOJPDmg8wIgqGrEmmpb+6JpozIDoOccW+ikS84zjSEvm+SLSSskfU530+yqlALbRS37NIJFEcvSh4j57/NwvQWJ5r6g9bj4evNDCmvmioxTk03WSvCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSLdYNs+6iJ4P2bPNqqO/sXeP7VrXvUC8Ahcy5jqUq0=;
 b=F4kOSiE2Rsl9JEtCIFEVdxDfuBiLTWARGCpKKuk48urIVNimE/Deu//uiOseMvqf91UyynE2eHzAm4IyRpjFVChOaxpxxzI+vg4B2OSgAD9pdpLA4iNM1Bb1c5VzCC6UatpBHzdXrX0mviyGH9VagnyJI0lFTZhFYfKvORBarrwMyaTxfm/5USG25xKVVdGs8UskWVzUWn/iuFdSU43vEM92uFwd4Vo830G8zC7grbPU/MikTdUlctp4UcVU3bpNhDxDQg8IwqouTOsBRqd0kBVGib7d8p3QAP2UA73g7zeORkBv+4Xk4Dhf/hspM8v/1X0oarSc48fAlpkeg3sPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSLdYNs+6iJ4P2bPNqqO/sXeP7VrXvUC8Ahcy5jqUq0=;
 b=c6rHnuS17hJjW9pyJPD5FueDIaRjQlec5kR4u8r75ZbXsgitUwiSdUJ3ck36lgE1852BXz/NFFSloVjeqB/Qxj6bej8d7+bBYvBM6mx97ocCoNp9g2H4cod2LSB3nmBwC3QwzC74WqyCJrVk0wz2rOwIpHnfYcdWtC8GBPTSDVU=
Received: from BLAPR03CA0042.namprd03.prod.outlook.com (2603:10b6:208:32d::17)
 by BN0PR10MB5079.namprd10.prod.outlook.com (2603:10b6:408:128::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:09:29 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::4c) by BLAPR03CA0042.outlook.office365.com
 (2603:10b6:208:32d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 15:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:09:28 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9KCE3333908;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046VU-1oSe;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 08/12] meta-ti-test: Import the recipes-kernel recipes
Date: Wed, 29 Apr 2026 10:09:16 -0500
Message-ID: <20260429150920.978263-8-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|BN0PR10MB5079:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4cd32f-2b5b-4743-b7e6-08dea6014f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xrkqlEy4h1B97J7EGwgZ4pAVdWtmbuQlAEwVCjKirpOaL1AdtFftMEX+8bdXpZm7jR3ie2mP3um2ZTjmOxJbOeznX7aGgXTZk2N1Q9tKIHIaemJrzpZbFlIY6LtkVJlssEMZrpjZHaPI9Mk1yqftpSZ9LvHiy/dmPZ6c0ojt61Gy+eKXPXiOAWsdi2FasXtLMvU32jwnGV7GZ1sXU5TiakcxuvHtJ6aeiMOFjPf+Lq3Pe0B7q52ix0QxbycvllI/o0NCDV+eJk9JhB4B229q1XpmwLUSgnOr3/Z0iNDvA6+9ar62pc7IHlmL7jfzGCo0nqk6KLlnsW5mDIYDi9jdE7u7u7UOHkSXY6CGn/mSa1QWZs+jL2ZaaDUxHPXDAt5q5l5J/8V4psguu7OJ6qFk8oBm96jePmH7jYLpnvBRtOM/3UCdNtV1yTAvTFDgxY5+weubnzfdpTc2RIX6Yo2x0fKhhEQ5ap1DnR+aaFHSX6sOG9jLmHvUFgcYaDTslsq86D5ALFNAqEQQaF/lIcbjXRXAzOuYKBUEnpDXTtMQIKZmgPVVj+7zKdbEw0TC+eW4uLhHAiAteMaJqAb3OWWqXQTw6RO4iEqKP/qcgHqqMJyZ3EzD27Tbz3lwx0dLx7R56GeqgwxW74Jjj+/oLAEfR11yEWUUC3EbhGMREUJXXNe117m1uvJimn1DzzH9Cj9JTZ2uevrDS9U2muak93vNUXz1PkZB/5XwziIpYjZbMWc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lp68x+sQFSdLMMSeqzUOMpnwIvEHOxGn3W4K0Bc6xwegO6mmp2dJ3RAzwAVYRre4mOguUxBV7xU9Cv/ysbzAN7L/XqJ94pPUhE4Sq3hBQBPTTnf1o7Dm6jwkqtaw8SYQKoVrSM24h5BXXkoJz6wySzHfJlB228RpTm8RtIkJTMMZYOnauQW/Gbas69tarWZv7EVxA77OQBMNLL5+zpQRJvYRkxC7s6OIQMan6Am7y8vU5i8Pfn01AG4JloSj0nGQWFrReuzSh4zlmIKRYJCE5esytst7YOY6QlZdYJJK9hO33I/pdK7RBf0F5rjyeARsm1XjXEtdbUH736bZjffW7mSeML/wce5hcmck8TYDoAfs3GJKrAE0bdbYzjbYo2ZiLo232yqpvLxGrPOhKoXmj/RjuZXi2KSl8f0sFyiGe1bEexIxXF2ELYFd3jS3j4Up
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:28.6821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4cd32f-2b5b-4743-b7e6-08dea6014f41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5079
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19887

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


