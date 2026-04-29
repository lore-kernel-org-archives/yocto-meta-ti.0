Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD65ECCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:43 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14123.1777476214848625778
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=l0RZZ7fD;
 spf=pass (domain: ti.com, ip: 52.101.53.55, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiP0DE62SYvqLHjQdhlVfBW4hhUnh2NyIULprTR0fbb8bJ4c8o5fFpxROHsYDUuRnrG2n5Xnk/EuLhYGlXvaXWN+RZQn3vzEfSarTV0zV1ukKzZe5LHXy33JMelFbijPY4ORJ2Ar7g4qlJ5WsgLSwpkpGmUJs6FGy8FZdMsQUfHSVznRJwkU6qm4ivxuOyZEmhjeGQ4uaUsD95lq/CINZAiGWURde0540UxvaXjSSCvJ8rPgfD9sumy+LCI/B9Jnij3oHI14dNrcXjKJsIn83I8uN9UOT+B/PaxhFlAylKRZdoimakMwo/QJpfY24+EeIGjsN6n9pAN7zsiSKpXnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1Z7UZVTHu+UdMXUxbVE3GqWlES8lRmHTmWnXZCu+Ok=;
 b=INN46tuMXmOcpeAfS95jZLbOXv1U/gvMzzXhztqglY75r4idXvAZ6UoMA3o3OYd0fBzWX1/ioaYFu3A5Jgqg67Fse9AvI0g5czGiEUc2UEfchXWqoRFaVCfG3EJI0VOLqG6o9lSAMQK8tHfEK406hA4c8lggWxxdxnT7436Bvus0JiZfpkHUE2UH2gXkCnIvpXLrnlnxmPWSpvKZtyEshaAfpNJNNI0n4YnBe8X/H4E+IWi4Tec+Vfk7IcWaA5vIL0qkiU4mdUtZj449faCaSiDoFAY+qLiAK4ma3GES70euA4W/fDTUCUQWhH3AejjmJw/fwFowAKZw95vxLoQkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1Z7UZVTHu+UdMXUxbVE3GqWlES8lRmHTmWnXZCu+Ok=;
 b=l0RZZ7fD4ysOeER1/HqdyarelzLukCsiEf+cejr0eSwX/qp8Te64EpF0C5yOW16UssCZCN6Xy+6lj6Rx4YtkjhmISiQOtls8sV50T68gZf4klqjcPPl1BRB+zBVWj+THOnEHqemortk/N0cQrH04tOpymz2jvKjodJAlgxhi5dM=
Received: from BYAPR04CA0032.namprd04.prod.outlook.com (2603:10b6:a03:40::45)
 by DS0PR10MB997672.namprd10.prod.outlook.com (2603:10b6:8:311::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:23:31 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::6a) by BYAPR04CA0032.outlook.office365.com
 (2603:10b6:a03:40::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:30 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0LJ3353825;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sQ-2nqS;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 08/12] meta-ti-test: Import the recipes-kernel recipes
Date: Wed, 29 Apr 2026 10:22:56 -0500
Message-ID: <20260429152300.979685-8-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|DS0PR10MB997672:EE_
X-MS-Office365-Filtering-Correlation-Id: 462049e4-828d-4014-5539-08dea60344ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	qKBKmvH3UEV6ozNbaLSz605qtCIyMhXRz63syrv9zkcCYl0LEyVP1ccbhvX0470X6TDkQ3RnUn9xOd629L6WNvpwmJICGVh6mcEInseOC2poYk6HPe+2xODpYn3S6F3uNCXpya9wJDR6UpKcYkzhGDtMymOrXg7rd2F8mnyNhvec3QlBQoM1s3Rr/HNcG1o8sTq7dzrVFTPuWhHNyUuW9m8q424MdrkOhp6awoSFytuGTyOp685xC4gs/RT1y5COting/V79QWpZGUFc9TZKF+ncdmkCTEJf+gNfjx4mKiEnyswRE3FKQZTdLHVMiCTlraTJAZWLTOAhtV132wxlrvw7NBGkEat1qOnlBulPJuTm7SjtJRaUtY8YYz7A2OeZL53823gqDhXJ1MHue9ccYEY76LLY/Zd8wJ+r6CmGraZaukFpLNGJWkJbfOQ7jx3FHMI+8VhxABA0Efj2lN9OdY7clKLSaRiBKyHYEPqjnGa6iEytEhvCMJqJTVi06cLm8KGZIA53kLdcVSyu9RYWAdhEv0/qZEQD7o2OnXnNNhJL8ouPg2A4ntb459pCgXmsu3ro9AlpohD1RBgrWSMfKk3lSmFJz/ZlQ59m+vZ3oeSC5J5S1GqMglq6rsSfjqTuW3xxDFfgn7S9N/gkpaxSNU+nF3RD1jVvnePA1sAf3maibttgc9dr98A/iqvQpUO4NLf34P4jD3i9D7loZ2L795ABtl2oyNCU1VQhsMx7ujBTBWJiInRmYnxZTywfXB4886zL9MLzyYzbrj3IkajGpA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XhCBPExc4LCsyBqUrRIcUTpwvS9k+NVNhwIBq/bJBOzk1gGWIwAqWncR9oQL94CO4wd0i0nb8fyaMkuy52DtPFEzPCE/ohrwNbqQUDfTIaprDvM+Y2Gej9XbRQC78KHJZ5UFaqoFrEi7rvZ/LrASh169D3Ql/ifvfrSG1rph5hhZgB4ic4pX8EvCOoKnGfH8IfHNmIeXNZtMZD17LV0J1nttg6nYJTgSr6wWrHaBmFqvV3QKLbtkDWs/M+WrVLjpCeK5c+2IN11gthxESUuLcn2+uZHnaBEwk/iDsmd0Dhk0BK6ppPXEqYoikiOXg98DT/a17YAgdDLaVGqjpQq1enIGQBtcx86NWmgmtcj2EFlihF/pkdw+FtBqFnABVXa32WThDdU0fs2iJOG6dAdR1PSknEWceZL0XkY5oJv6wOF06KD4FO4WGwn+rBZUj+ap
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:30.1113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462049e4-828d-4014-5539-08dea60344ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997672
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19901

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


