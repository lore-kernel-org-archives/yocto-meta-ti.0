Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C9FCD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:33 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14120.1777476209842293868
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uJWZ51aF;
 spf=pass (domain: ti.com, ip: 52.101.48.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+vPDfsJK79Uom32EwJhOcASWMCxlkv/F+3QMMzZq0pByQOICJgnoZaSfpNGMuZ6usVhlpJ09P6nZ6c+wfMvlWD7mHZQBhOpsh/azlp/mP2XCIMNheO6uUh1gqH9UFj7CEr6Tmj44NngbvzzfFb2jT6GoYrKouAC0riYnbXhMS9bfgBKYh2Irzmg8oo2ngVO+4Xkaiw7MC3SQ1ZCWZ/+WWEZESWQ4QMrmjl6vrVyrkt862MVeGEnZ18GE+vZVII++PYBiGSw7rk7wDcv2zALcKRt9+YhwgwhQSfT924sZsJ/m+k+Qlh2ccZrwpAyzgZliP7N33hBKN9r5TlnnxOkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rqlcp7f4lvwrU0ytwae+6ITkuh55/zy8YtOqQaYTj6M=;
 b=Q+czSwGckr8IRS+HidVyHypt6aCYs1p0KHJ0OixIlOcHYTObK3tzaHK5zkKxE8Ib4SAjYrXLv1528wGlJZwh+h8Me65PdsrZrY1bhrYxb/zyAFCT9SzrkRA4TKiUammxwKwTCSr0IXf89ykYnJ2ZdKCr+M1g/VKC4Fc5BU8qUH1wjoEE/ZNLC9JIm5lsHk/uemVtyM+57JNPtLhEuwwYRCFVdnNAS2oMb5NpkkthVqRCT4SyHMLYBkFBXGr/2S3Umdg6CptDuWhyXGsevGMJxd9xzZtCKIPE93IE+ARTKYSEEOUi8D9ZqDLRzMWTmFjB9drQ3XFpaIg8Ka+HV3zvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rqlcp7f4lvwrU0ytwae+6ITkuh55/zy8YtOqQaYTj6M=;
 b=uJWZ51aFQ+eN4s4LxxPyosIOros3x6PSt7YZIvm10n1tJlgSB6Sq3OzdxQHTEaxM+FcqL9f+HSb+hvApnZXH9UvV6UaLFPy88nPCks+bzFcvy/Djq5MaY/KgagdPn0RGialNNivi1345NSOHDm6lIJ1Gk/97dKlKVPBAfCgNb/A=
Received: from PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::17)
 by CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:23:25 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::5d) by PH8P221CA0061.outlook.office365.com
 (2603:10b6:510:349::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:23:24 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0aZ3353820;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sB-2VoZ;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 05/12] meta-ti-test: Import the recipes-devtools recipes
Date: Wed, 29 Apr 2026 10:22:53 -0500
Message-ID: <20260429152300.979685-5-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|CH3PR10MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf4bf9f-9320-4452-1b8f-08dea603416a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	MnabuC2/3vN4hQ+CSZYsc7s3zhhePlckBLQFJ+pGaDJAAe017HLLEjkYe1ORAQUxIbNc2E3cvlgvDKH8iGCUz3S3W64dK+G5vBD7SEMCRm1JPzAX519MsiB/5XDfwYYX8TmeKMeXMzy6DawM+JvJkNGemtrMeuaCdygXNJU/qLUq0suiFFvYefzNCSwWd3C8TLmcP7wbcmqXczNDiG/NnfMbn51gWIyRsP/U/9rbz03BVo90acPQT1v59S1IoV/qrKsGmZD+Q6mu+8Cr26rgD2rFjiEqekzGrIDx/mOghxWtqKqGj0k1kqQnCle6sKkL0Lql4Bjta5VItgeOxKRyQQzjDtnJCW6T2asuoaMX3dF3+LsS6P4MVrLemDjfwfXxGtlDddnjxb79yJ+ZeOhq3gIdtEZbxIfbdu8+N+CqUt/PtJqnKL2LJK7ni3KvMPgS8MME3Q6NclRpEaV49y8rljZKK8iSxDJUeavUlxMZ2FkSP9ZqRD8b8aO6oTkMSGhtet5xKr6joWh1plIy/ANNk4RLFAwiLttA7j92ZtxpLqLayyG9sBp9+yCrBgrOkqWuBBXKX+YmwV3LD+05YBMaZf1aca299GTwKEEBIDrMoSzbfMHOUBdPg7F8vrdDYTMxO7F0ZgtGsKewud1/3yv/d82FJNQmqw7VgSTkJhIsdc9GiBRm9i226/epnoKcvXhp
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lA0XaDVU0BMKkwQPMv+AT5ku58MoDYqMyUYQWY61BFkFfZsf/JCkDgUAbObZSUXv7R4E0kVAA7VYRu4AivRblyMwxhTlp3erarVpc53tsjdPx1BR1fVMDJLUyNuo7U1pDwdQ7ijZUpTHGKifx4XNM5O1u5OMNvA3Jh3F+b1m3t+iT3idD0ANzfsFN0G7kEJ9fFs26RQ+ES8VMXHXm7UmCt/ejQpeCnvE3Okg0+cHUHR9y7woI8Oqa6YXshGBlSo4KS05X02kSJzKOLtjxANsZ9HnupWuoqtq0VxSnlhdZRkJF0GLiYjYp/CvhgVzxHUHdomv/HQksyeLxupupYZ/pWCXi6rJusY39DMW7TgqBkFBZ299vbhBJfOTTs30VISsPGnyFRqEgjJBOu1LCAjnK0XJ6hNaxSdXJv0KLGdUkwSmSOd7CDaHcc3jw/80yWTl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:24.4409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf4bf9f-9320-4452-1b8f-08dea603416a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8215
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19900

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-devtools.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: We promoted ltp-ddt last night and my staged commits still had the
fix for install and the previous SRCREV.  Update to the lastest version
of ltp-ddt from meta-arago before import.

 .../bpftool/bpftool-native-ti.inc             |   1 +
 .../bpftool/bpftool-native_%.bbappend         |   4 +
 .../dma-heap/dma-heap-tests.bb                |  14 ++
 ...nf-fix-for-cross-compilation-for-ARM.patch |  69 ++++++++
 .../input-utils/fix-ftbfs-echo.patch          |  21 +++
 .../input-utils/input-utils_1.0.bb            |  31 ++++
 ...-__clear_cache-declaration-for-clang.patch |  32 ++++
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  32 ++++
 ...01-include-mk-Fix-installing-subdirs.patch |  49 ++++++
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch |  45 +++++
 .../ltp-ddt/ltp-ddt_20260130.bb               |  43 +++++
 .../recipes-devtools/ltp-ddt/ltp_20260130.inc | 157 ++++++++++++++++++
 .../recipes-devtools/mtd/mtd-utils-ti.inc     |  45 +++++
 .../recipes-devtools/mtd/mtd-utils_%.bbappend |   4 +
 ...se-proper-definition-of-boolean-type.patch |  40 +++++
 .../recipes-devtools/omapconf/omapconf_git.bb |  24 +++
 .../recipes-devtools/pm-qa/pm-qa-ti.inc       |  13 ++
 ...eturn-non-zero-value-on-test-failure.patch |  28 ++++
 .../0002-cpuidle-Avoid-relative-paths.patch   |  58 +++++++
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend   |   6 +
 .../uvc-gadget/uvc-gadget_git.bb              |  19 +++
 21 files changed, 735 insertions(+)
 create mode 100644 meta-ti-test/recipes-devtools/bpftool/bpftool-native-ti=
.inc
 create mode 100644 meta-ti-test/recipes-devtools/bpftool/bpftool-native_%.=
bbappend
 create mode 100644 meta-ti-test/recipes-devtools/dma-heap/dma-heap-tests.b=
b
 create mode 100644 meta-ti-test/recipes-devtools/input-utils/input-utils/0=
001-autoconf-fix-for-cross-compilation-for-ARM.patch
 create mode 100644 meta-ti-test/recipes-devtools/input-utils/input-utils/f=
ix-ftbfs-echo.patch
 create mode 100644 meta-ti-test/recipes-devtools/input-utils/input-utils_1=
.0.bb
 create mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-=
__clear_cache-declaration-for-clang.patch
 create mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remo=
ve-OOM-tests-from-runtest-mm.patch
 create mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-incl=
ude-mk-Fix-installing-subdirs.patch
 create mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-sysc=
alls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
 create mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.=
bb
 create mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
 create mode 100644 meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc
 create mode 100644 meta-ti-test/recipes-devtools/mtd/mtd-utils_%.bbappend
 create mode 100644 meta-ti-test/recipes-devtools/omapconf/files/0001-Use-p=
roper-definition-of-boolean-type.patch
 create mode 100644 meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
 create mode 100644 meta-ti-test/recipes-devtools/pm-qa/pm-qa-ti.inc
 create mode 100644 meta-ti-test/recipes-devtools/pm-qa/pm-qa/0001-Return-n=
on-zero-value-on-test-failure.patch
 create mode 100644 meta-ti-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-=
Avoid-relative-paths.patch
 create mode 100644 meta-ti-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
 create mode 100644 meta-ti-test/recipes-devtools/uvc-gadget/uvc-gadget_git=
.bb

diff --git a/meta-ti-test/recipes-devtools/bpftool/bpftool-native-ti.inc b/=
meta-ti-test/recipes-devtools/bpftool/bpftool-native-ti.inc
new file mode 100644
index 00000000..213a0f4e
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/bpftool/bpftool-native-ti.inc
@@ -0,0 +1 @@
+DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
diff --git a/meta-ti-test/recipes-devtools/bpftool/bpftool-native_%.bbappen=
d b/meta-ti-test/recipes-devtools/bpftool/bpftool-native_%.bbappend
new file mode 100644
index 00000000..3d084dcc
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/bpftool/bpftool-native_%.bbappend
@@ -0,0 +1,4 @@
+BPFTOOL_NATIVE_TI =3D ""
+BPFTOOL_NATIVE_TI:ti-soc =3D "bpftool-native-ti.inc"
+
+require ${BPFTOOL_NATIVE_TI}
diff --git a/meta-ti-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/met=
a-ti-test/recipes-devtools/dma-heap/dma-heap-tests.bb
new file mode 100644
index 00000000..3c0eaa5a
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Test cases for DMA-Heap framework"
+HOMEPAGE =3D "https://github.com/glneo/dma-heap-tests"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4c3b4cb87cfc8ccba69d579fbd7b0fb=
3"
+
+PV =3D "1.0"
+
+BRANCH =3D "master"
+SRC_URI =3D "git://github.com/glneo/dma-heap-tests.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
+SRCREV =3D "230b406e97c12be5f930125a432d0dfa0316aa39"
+
+DEPENDS =3D "googletest"
+
+inherit cmake pkgconfig
diff --git a/meta-ti-test/recipes-devtools/input-utils/input-utils/0001-aut=
oconf-fix-for-cross-compilation-for-ARM.patch b/meta-ti-test/recipes-devtoo=
ls/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.=
patch
new file mode 100644
index 00000000..075920b4
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/input-utils/input-utils/0001-autoconf-f=
ix-for-cross-compilation-for-ARM.patch
@@ -0,0 +1,69 @@
+From fb1bbf8342c4a87380964465443bbb4b61dc0259 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Tue, 5 Nov 2013 05:22:10 -0600
+Subject: [PATCH] autoconf: fix for cross compilation for ARM
+
+* Based on changes from Yebio Mesfin fixup the input-utils to
+  cross compile for ARM.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ mk/Autoconf.mk  |    8 ++++++--
+ mk/Variables.mk |    4 ++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/mk/Autoconf.mk b/mk/Autoconf.mk
+index 7608ea5..95999cc 100644
+--- a/mk/Autoconf.mk
++++ b/mk/Autoconf.mk
+@@ -47,11 +47,13 @@ ac_uname =3D $(shell \
+ 	$(call ac_s_cmd,uname -s | tr 'A-Z' 'a-z');\
+ 	$(call ac_fini))
+=20
+-ac_uname_arch =3D $(shell \
++#ac_uname_arch =3D $(shell \
+ 	$(call ac_init,for arch);\
+ 	$(call ac_s_cmd,uname -m | tr 'A-Z' 'a-z');\
+ 	$(call ac_fini))
+=20
++ac_uname_arch =3D arm
++
+ # check for some header file
+ # args: header file
+ ac_header =3D $(shell \
+@@ -108,12 +110,14 @@ ac_binary =3D $(shell \
+ #	$(call ac_s_cmd,$(CC) -print-search-dirs | grep -q lib64 &&\
+ #		echo "lib64" || echo "lib");\
+ #	$(call ac_fini))
+-ac_lib64 =3D $(shell \
++#ac_lib64 =3D $(shell \
+ 	$(call ac_init,for libdir name);\
+ 	$(call ac_s_cmd,/sbin/ldconfig -p | grep -q lib64 &&\
+ 		echo "lib64" || echo "lib");\
+ 	$(call ac_fini))
+=20
++ac_lib64 =3D gcc
++
+ # check for x11 ressource dir prefix
+ ac_resdir =3D $(shell \
+ 	$(call ac_init,for X11 app-defaults prefix);\
+diff --git a/mk/Variables.mk b/mk/Variables.mk
+index 99f787c..fd47f73 100644
+--- a/mk/Variables.mk
++++ b/mk/Variables.mk
+@@ -24,8 +24,8 @@ endif
+ RELTAG	:=3D v$(subst .,_,$(VERSION))
+=20
+ # programs
+-CC		?=3D gcc
+-CXX		?=3D g++
++CC		?=3D $(CROSS_COMPILE)gcc
++CXX		?=3D $(CROSS_COMPILE)g++
+ MOC             ?=3D $(if $(QTDIR),$(QTDIR)/bin/moc,moc)
+=20
+ STRIP		?=3D -s
+--=20
+1.7.0.4
+
diff --git a/meta-ti-test/recipes-devtools/input-utils/input-utils/fix-ftbf=
s-echo.patch b/meta-ti-test/recipes-devtools/input-utils/input-utils/fix-ft=
bfs-echo.patch
new file mode 100644
index 00000000..e6631003
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/input-utils/input-utils/fix-ftbfs-echo.=
patch
@@ -0,0 +1,21 @@
+Description: Fix FTBFS due to -e leaking into Make.config
+ If /bin/sh is configured to point to dash, echo does not support -e switc=
h
+ which is used by mk/Autoconf.mk file to generate Make.config. Use 'env ec=
ho'
+ instead.
+Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Bug-Debian: http://bugs.debian.org/750265
+Forwarded: no
+Last-Update: 2014-07-09
+Upstream-Status: Inactive-Upstream [lastrelease: 2008-2012]
+
+--- input-utils-1.0.orig/mk/Autoconf.mk
++++ input-utils-1.0/mk/Autoconf.mk
+@@ -162,7 +162,7 @@ config: Make.config
+	@true
+
+ Make.config: $(srcdir)/GNUmakefile
+-	@echo -e "$(make-config-q)" > $@
++	@env echo -e "$(make-config-q)" > $@
+	@echo
+	@echo "Make.config written, edit if needed"
+	@echo
diff --git a/meta-ti-test/recipes-devtools/input-utils/input-utils_1.0.bb b=
/meta-ti-test/recipes-devtools/input-utils/input-utils_1.0.bb
new file mode 100644
index 00000000..11062713
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/input-utils/input-utils_1.0.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "Utilities for the Linux input drivers"
+HOMEPAGE =3D "http://packages.tanglu.org/source/aequorea/input-utils"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28=
b"
+
+PV =3D "1.0"
+PR =3D "r0"
+
+SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/i/input-utils/input=
-utils_1.0.orig.tar.gz \
+	file://fix-ftbfs-echo.patch"
+SRC_URI:append:arm =3D " file://0001-autoconf-fix-for-cross-compilation-fo=
r-ARM.patch"
+
+SRC_URI[md5sum] =3D "3e58772e8647093b1de2f2c90bfb9ee8"
+SRC_URI[sha256sum] =3D "ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc55a=
349b3bff4e3b13"
+
+S =3D "${UNPACKDIR}/input-1.0"
+
+do_compile () {
+    oe_runmake
+}
+
+# set the DESTDIR and the STRIP variables used by the GNUmakefile.
+# The STRIP variable is set to blank or else the variable setting from OE
+# is picked up as <TC>-strip and the install step sees that as another
+# file to install.
+EXTRA_OEMAKE =3D "DESTDIR=3D${D} STRIP=3D''"
+
+do_install () {
+    oe_runmake install
+}
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-__clear=
_cache-declaration-for-clang.patch b/meta-ti-test/recipes-devtools/ltp-ddt/=
ltp-ddt/0001-Add-__clear_cache-declaration-for-clang.patch
new file mode 100644
index 00000000..24e8762f
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-__clear_cache-=
declaration-for-clang.patch
@@ -0,0 +1,32 @@
+From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 22:52:56 -0700
+Subject: [PATCH] Add __clear_cache declaration for clang
+
+__clear_cache was enabled on RISCV recently with 7352ba02390116f1cd6a9b583=
860ba28aa0a1b7a
+however it fails to compile with clang19 on RISCV
+With this error
+
+  hugemmap15.c:51:2: error: call to undeclared function '__clear_cache'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
+      51 |         __clear_cache(p, p + COPY_SIZE);
+         |         ^
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-June=
/038762.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Hui Min Mina Chou <minachou@andestech.com>
+---
+ testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcase=
s/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+index 1dde9e87b..6a6f5fe5e 100644
+--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
++++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+@@ -19,6 +19,7 @@
+=20
+ #if defined(__clang__)
+ 	#pragma clang optimize off
++	void __clear_cache(void *start, void *end);
+ #endif
+=20
+ #define _GNU_SOURCE
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-=
tests-from-runtest-mm.patch b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt=
/0001-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 00000000..860b2f12
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-tests-f=
rom-runtest-mm.patch
@@ -0,0 +1,32 @@
+From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+[ pvorel: rebased for 20210927 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index 41d624ad8..1e8c22638 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -69,12 +69,6 @@ ksm07 ksm07
+ cpuset01 cpuset01
+ cpuset02 cpuset02
+=20
+-oom01 oom01
+-oom02 oom02
+-oom03 oom03
+-oom04 oom04
+-oom05 oom05
+-
+ swapping01 swapping01 -i 5
+=20
+ thp01 thp01 -I 120
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-=
Fix-installing-subdirs.patch b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-dd=
t/0001-include-mk-Fix-installing-subdirs.patch
new file mode 100644
index 00000000..5f970a12
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-ins=
talling-subdirs.patch
@@ -0,0 +1,49 @@
+From 5907227ad86a93b084a52a7ff8dd8cb791c228a5 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 27 Apr 2026 11:02:32 -0500
+Subject: [PATCH] include/mk: Fix installing subdirs
+
+When installing sub directories, the INSTALL_MODE was being used for the
+dirs as well.  But in runtest/Makefile the INSTALL_MODE is being set to
+00644.  This causes the ddt dir to lose the execute bits and stop acting
+like a directory.
+
+Simple fix is create INSTALL_MODE_DIR and use it when installing
+directories.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ include/mk/env_post.mk  | 1 +
+ include/mk/functions.mk | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
+index ab31da73a..c2e85439a 100644
+--- a/include/mk/env_post.mk
++++ b/include/mk/env_post.mk
+@@ -58,6 +58,7 @@ INSTALL_TARGETS			:=3D $(patsubst $(abs_srcdir)/%,%,$(IN=
STALL_TARGETS))
+ # The large majority of the files that we install are going to be apps an=
d
+ # scripts, so let's chmod them like that.
+ INSTALL_MODE			?=3D 00775
++INSTALL_MODE_DIR		?=3D 00775
+=20
+ $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_T=
ARGETS) $(MAKE_TARGETS))))):
+ 	mkdir -p "$@"
+diff --git a/include/mk/functions.mk b/include/mk/functions.mk
+index 60dbed395..8e4bc973c 100644
+--- a/include/mk/functions.mk
++++ b/include/mk/functions.mk
+@@ -18,7 +18,7 @@ INSTALL_FILES		+=3D $$(abspath $$(DESTDIR)/$(3)/$(1))
+=20
+ $$(abspath $$(DESTDIR)/$(3)/$(1)): \
+     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
+-	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(=
PARAM) "$(2)/$(1)" $$@
++	install $(shell test -d "$(2)/$(1)" || echo "-m $(INSTALL_MODE)") $(shel=
l test -d "$(2)/$(1)" && echo "-m $(INSTALL_MODE_DIR) -d") $(PARAM) "$(2)/$=
(1)" $$@
+ 	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PAR=
AM)' "$(2)/$(1)/*" -t '$$@')
+ endef
+=20
+--=20
+2.43.0
+
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-syscalls-se=
mctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta-ti-test/recipes-devt=
ools/ltp-ddt/ltp-ddt/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64=
_RE.patch
new file mode 100644
index 00000000..364e203e
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-syscalls-semctl08-=
Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -0,0 +1,45 @@
+From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Fri, 23 May 2025 15:17:49 +0800
+Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRE=
CTS
+ is defined
+
+When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds to=
 a
+64-bit time-safe version that omits the sem_otime_high and sem_ctime_high
+fields. As a result, the case becomes invalid and leads to incorrect behav=
ior.
+
+This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
+defined, ensuring the test only runs when semid_ds structurally matches
+semid64_ds and the *_high fields are accessible.
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2025-May/=
043647.html]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ testcases/kernel/syscalls/ipc/semctl/semctl08.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/k=
ernel/syscalls/ipc/semctl/semctl08.c
+index f4549adf4..28776f266 100644
+--- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
++++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+@@ -12,7 +12,11 @@
+ #include "tst_test.h"
+ #include "libnewipc.h"
+=20
+-#ifdef HAVE_SEMID64_DS_TIME_HIGH
++#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
++TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fie=
lds");
++#elif defined(__USE_TIME64_REDIRECTS)
++TST_TEST_TCONF("test requires __USE_TIME64_REDIRECTS to be undefined");
++#else
+=20
+ static void run(void)
+ {
+@@ -49,6 +53,4 @@ static struct tst_test test =3D {
+ 	.test_all =3D run,
+ 	.needs_tmpdir =3D 1,
+ };
+-#else
+-TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fie=
lds");
+ #endif
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/me=
ta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
new file mode 100644
index 00000000..840e8e2d
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -0,0 +1,43 @@
+FILESEXTRAPATHS:prepend :=3D "${TITESTBASE}/recipes-devtools/ltp-ddt/ltp-d=
dt:"
+
+require ltp_${PV}.inc
+
+SUMMARY =3D "Embedded Linux Device Driver Tests based on Linux Test Projec=
t"
+HOMEPAGE =3D "https://git.ti.com/cgit/test-automation/ltp-ddt/"
+
+DEPENDS +=3D "alsa-lib"
+
+PE =3D "1"
+PR =3D "r1"
+PV:append =3D "+git"
+
+SRCREV =3D "6a1c144a4bde8cd26c6cb4ce76e12ac1ca1ce079"
+BRANCH ?=3D "master"
+
+SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
+SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
+
+export prefix =3D "/opt/ltp"
+export exec_prefix =3D "/opt/ltp"
+
+EXTRA_OEMAKE:append =3D " \
+    KERNEL_USR_INC=3D${WORKDIR} \
+    ALSA_INCPATH=3D${STAGING_INCDIR} \
+    ALSA_LIBPATH=3D${STAGING_LIBDIR} \
+"
+
+RDEPENDS:${PN} +=3D "\
+    acl \
+    at \
+    pm-qa \
+    serialcheck \
+    memtester \
+    libgpiod-tools \
+    iproute2-bridge \
+"
+
+do_install:append() {
+	# Upstream ltp recipe wants to remove this test case in do_install
+	install -d ${D}${prefix}/runtest/
+	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
+}
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/meta-=
ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
new file mode 100644
index 00000000..4183b5d4
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -0,0 +1,157 @@
+SUMMARY =3D "Linux Test Project"
+DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM, =
OSDL, and Bull with a goal to deliver test suites to the open source commun=
ity that validate the reliability, robustness, and stability of Linux. The =
Linux Test Project is a collection of tools for testing the Linux kernel an=
d related features."
+HOMEPAGE =3D "https://linux-test-project.github.io/"
+SECTION =3D "console/utils"
+LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.=
1-or-later & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "\
+    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
+    file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30ec=
2cf884ae699947 \
+    file://testcases/network/can/filter-tests/COPYING;md5=3D5b155ea7d7f86e=
ae8e8832955d8b70bc \
+"
+
+DEPENDS =3D "attr libaio libcap acl openssl zip-native"
+DEPENDS:append:libc-musl =3D " fts "
+EXTRA_OEMAKE:append:libc-musl =3D " LIBC=3Dmusl "
+EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
+
+# since ltp contains x86-64 assembler which uses the frame-pointer registe=
r,
+# set -fomit-frame-pointer x86-64 to handle cases where optimisation
+# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-poi=
nter
+# earlier in CFLAGS, etc.
+CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
+TUNE_CCARGS:remove:x86 =3D "-mfpmath=3Dsse"
+TUNE_CCARGS:remove:x86-64 =3D "-mfpmath=3Dsse"
+
+CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
+CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
+SRCREV =3D "6a60ae592cd375f004df0694efc7d50ddae9aa5e"
+
+SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster;p=
rotocol=3Dhttps \
+           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://0001-Add-__clear_cache-declaration-for-clang.patch \
+           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
+           file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
+          "
+
+inherit autotools-brokensep pkgconfig
+
+# Version 20220527 added KVM test infrastructure which currently fails to =
build with lld due to
+# SORT_NONE in linker script which isn't supported by gold:
+# https://sourceware.org/bugzilla/show_bug.cgi?id=3D18097
+# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aa=
e326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0=
f5a8785c0dd6R36
+LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-=
ld=3Dbfd', '', d)}"
+
+# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
+# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703=
ef9019aaf2f2dfebb
+# it fails with lld also a bit later when trying to use *-payload.bin
+# http://errors.yoctoproject.org/Errors/Details/663094/
+# work around this by forcing .bfd linked in LD when ld-is-lld is in DISTR=
O_FEATURES
+KVM_LD =3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${HO=
ST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+
+export prefix =3D "/opt/${PN}"
+export exec_prefix =3D "/opt/${PN}"
+
+PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl,"
+EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
+EXTRA_OECONF =3D " --with-realtime-testsuite --with-open-posix-testsuite "
+# ltp network/rpc test cases ftbfs when libtirpc is found
+EXTRA_OECONF +=3D " --without-tirpc "
+
+do_compile() {
+    oe_runmake HOSTCC=3D"${CC_FOR_BUILD}" HOST_CFLAGS=3D"${CFLAGS_FOR_BUIL=
D}" HOST_LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" KVM_LD=3D"${KVM_LD}"
+}
+
+do_install(){
+    install -d ${D}${prefix}/
+    oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install include-install
+
+    # fixup not deploy STPfailure_report.pl to avoid confusing about it fa=
ils to run
+    # as it lacks dependency on some perl moudle such as LWP::Simple
+    # And this script previously works as a tool for analyzing failures fr=
om LTP
+    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly acces=
ses
+    # http://khack.osdl.org to retrieve ltp test results run on
+    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unacce=
ssible
+    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
+
+    # The controllers memcg_stree test seems to cause us hangs and takes 9=
00s
+    # (maybe we expect more regular output?), anyhow, skip it
+    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
+
+    # min_free_kbytes can be disruptive on constrained targets
+    sed -e '/^min_free_kbytes/d' -i ${D}${prefix}/runtest/mm
+
+    # cve-2018-13405 triggers memory deadlock kernel panic on constrained =
targets
+    sed -e '/^cve-2018-13405/d' -i ${D}${prefix}/runtest/cve
+
+    # cve-2020-36557 triggers memory deadlock kernel panic on constrained =
targets
+    sed -e '/^cve-2020-36557/d' -i ${D}${prefix}/runtest/cve
+}
+
+RDEPENDS:${PN} =3D "\
+    attr \
+    bash \
+    bc \
+    coreutils \
+    cpio \
+    cronie \
+    curl \
+    e2fsprogs \
+    e2fsprogs-mke2fs \
+    expect \
+    file \
+    findutils \
+    gawk \
+    gdb \
+    gzip \
+    iproute2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d=
)} \
+    ldd \
+    libaio \
+    logrotate \
+    net-tools \
+    perl \
+    python3-core \
+    python3-kirk \
+    procps \
+    quota \
+    unzip \
+    util-linux \
+    which \
+    tar \
+"
+
+RRECOMMENDS:${PN} +=3D "kernel-module-loop"
+
+FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_group=
s/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/tes=
tscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/o=
pen_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/=
Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${pre=
fix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posi=
x_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${p=
refix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01=
/lib.a ${prefix}/lib/libmem.a"
+
+# Avoid stripping some generated binaries otherwise some of the ltp tests =
such as ldd01 & nm01 fail
+INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/te=
stcases/bin/ldd01"
+INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
+
+CACHED_CONFIGUREVARS:libc-musl =3D "ac_cv_type_struct_mnt_id_req=3Dno ac_c=
v_type_struct_statmount=3Dno"
+
+remove_broken_musl_sources() {
+	[ "${TCLIBC}" =3D "musl" ] || return 0
+
+	cd ${S}
+	bbverbnote "remove unsupported tests (until they're fixed)"
+
+	# sync with upstream
+	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
+	rm -rfv \
+		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
+		testcases/kernel/syscalls/getcontext/getcontext01.c \
+		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
+		testcases/kernel/syscalls/timer_create/timer_create01.c \
+		testcases/kernel/syscalls/timer_create/timer_create03.c \
+		testcases/kernel/syscalls/statmount/statmount02.c
+}
+do_patch[postfuncs] +=3D "remove_broken_musl_sources"
+
+# Avoid file dependency scans, as LTP checks for things that may or may no=
t
+# exist on the running system.  For instance it has specific checks for
+# csh and ksh which are not typically part of OpenEmbedded systems (but
+# can be added via additional layers.)
+SKIP_FILEDEPS:${PN} =3D '1'
diff --git a/meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc b/meta-ti-t=
est/recipes-devtools/mtd/mtd-utils-ti.inc
new file mode 100644
index 00000000..4c4f8028
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc
@@ -0,0 +1,45 @@
+PR:append =3D ".ti2"
+
+SRC_URI:remove =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster =
\
+"
+
+SRC_URI:prepend =3D "git://git.infraroot.at/mtd-utils.git;branch=3Dmaster;=
protocol=3Dhttps \
+"
+
+EXTRA_OEMAKE =3D "'CC=3D${CC} ${CFLAGS} ${@bb.utils.contains('PACKAGECONFI=
G', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'RANLIB=3D${RANLIB}=
' 'AR=3D${AR}' 'BUILDDIR=3D${S}'"
+
+do_compile:append() {
+	oe_runmake tests
+}
+
+do_install:append() {
+	install -m 0755 io_update ${D}${sbindir}/
+	install -m 0755 volrefcnt ${D}${sbindir}/
+	install -m 0755 integ ${D}${sbindir}/
+	install -m 0755 io_paral ${D}${sbindir}/
+	install -m 0755 io_read ${D}${sbindir}/
+	install -m 0755 io_basic ${D}${sbindir}/
+	install -m 0755 mkvol_basic ${D}${sbindir}/
+	install -m 0755 mkvol_bad ${D}${sbindir}/
+	install -m 0755 mkvol_paral ${D}${sbindir}/
+	install -m 0755 rsvol ${D}${sbindir}/
+	install -m 0755 tests/ubi-tests/runubitests.sh ${D}${sbindir}/
+	install -m 0755 tests/ubi-tests/ubi-stress-test.sh ${D}${sbindir}/
+}
+
+PACKAGES =3D+ "mtd-utils-ubifs-tests"
+
+FILES:mtd-utils-ubifs-tests =3D " \
+${sbindir}/io_update \
+${sbindir}/volrefcnt \
+${sbindir}/integ \
+${sbindir}/io_paral \
+${sbindir}/io_read \
+${sbindir}/io_basic \
+${sbindir}/mkvol_basic \
+${sbindir}/mkvol_bad \
+${sbindir}/mkvol_paral \
+${sbindir}/rsvol \
+${sbindir}/runubitests.sh \
+${sbindir}/ubi-stress-test.sh \
+"
diff --git a/meta-ti-test/recipes-devtools/mtd/mtd-utils_%.bbappend b/meta-=
ti-test/recipes-devtools/mtd/mtd-utils_%.bbappend
new file mode 100644
index 00000000..bdf28247
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/mtd/mtd-utils_%.bbappend
@@ -0,0 +1,4 @@
+MTD_UTILS_TI =3D ""
+MTD_UTILS_TI:ti-soc =3D "mtd-utils-ti.inc"
+
+require ${MTD_UTILS_TI}
diff --git a/meta-ti-test/recipes-devtools/omapconf/files/0001-Use-proper-d=
efinition-of-boolean-type.patch b/meta-ti-test/recipes-devtools/omapconf/fi=
les/0001-Use-proper-definition-of-boolean-type.patch
new file mode 100644
index 00000000..782f10ed
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/omapconf/files/0001-Use-proper-definiti=
on-of-boolean-type.patch
@@ -0,0 +1,40 @@
+From c52280d923c167032a84f1c67574eb340e38572c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Wed, 7 May 2025 17:03:20 -0400
+Subject: [PATCH] Use proper definition of boolean type
+
+Newer versions of GCC and C standard have bool as a built-in
+keyword - use a standard stdbool.h header to properly handle it.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ arch/arm/mach-omap/common/statcoll/sci.h | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/arch/arm/mach-omap/common/statcoll/sci.h b/arch/arm/mach-omap=
/common/statcoll/sci.h
+index 4134c00..1a393b4 100644
+--- a/arch/arm/mach-omap/common/statcoll/sci.h
++++ b/arch/arm/mach-omap/common/statcoll/sci.h
+@@ -48,17 +48,11 @@
+ #ifndef SCI_H
+ #define SCI_H
+
++#include <stdbool.h>
+ #include <stdlib.h>
+ #include <stdint.h>		// The library uses C99 exact-width integer types
+ #include "sci_dev.h"
+
+-#if !defined(__bool_true_false_are_defined) && !defined(_STM_Logging)
+-typedef enum {
+-	false =3D 0,
+-	true =3D 1
+-} bool;
+-#endif
+-
+ #ifdef _STM_Logging
+ #include "StmLibrary.h"
+ #endif
+--
+2.25.1
diff --git a/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb b/meta-=
ti-test/recipes-devtools/omapconf/omapconf_git.bb
new file mode 100644
index 00000000..84226dd8
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Diagnostic tool for TI OMAP processors"
+HOMEPAGE =3D "https://github.com/omapconf/omapconf"
+
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e91=
4"
+
+PV =3D "1.75+git"
+
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx"
+
+BRANCH ?=3D "master"
+SRCREV =3D "ff07b6992bacb1e1586c72b7d2be469caee4a347"
+
+SRC_URI =3D "git://github.com/omapconf/omapconf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
+
+SRC_URI +=3D "file://0001-Use-proper-definition-of-boolean-type.patch"
+
+do_compile () {
+    oe_runmake CC=3D"${CC}" all
+}
+
+do_install () {
+    oe_runmake DESTDIR=3D${D}${bindir} install
+}
diff --git a/meta-ti-test/recipes-devtools/pm-qa/pm-qa-ti.inc b/meta-ti-tes=
t/recipes-devtools/pm-qa/pm-qa-ti.inc
new file mode 100644
index 00000000..454794f2
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/pm-qa/pm-qa-ti.inc
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/pm-qa:"
+
+# Bump to 0.5.0+
+SRCREV =3D "e66966ef6a08cd3b491ee1df5c6c5d33baaf1f1c"
+
+SRC_URI +=3D " \
+	file://0001-Return-non-zero-value-on-test-failure.patch \
+	file://0002-cpuidle-Avoid-relative-paths.patch \
+"
+
+PATCHTOOL =3D "git"
+
+PR:append =3D ".ti0"
diff --git a/meta-ti-test/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero=
-value-on-test-failure.patch b/meta-ti-test/recipes-devtools/pm-qa/pm-qa/00=
01-Return-non-zero-value-on-test-failure.patch
new file mode 100644
index 00000000..35dbe7f5
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-=
on-test-failure.patch
@@ -0,0 +1,28 @@
+From: Carlos Hernandez <ceh@ti.com>
+Subject: [meta-arago][linaro pm-qa PATCH 1/2] Return non-zero value on tes=
t failure
+Date: Thu, 13 Aug 2015 15:03:00 -0400
+
+By convention Linux tools return non-zero value on error/failure.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ include/functions.sh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/functions.sh b/include/functions.sh
+index 518f555bbe3d..0b054776b763 100644
+--- a/include/functions.sh
++++ b/include/functions.sh
+@@ -54,6 +54,7 @@ test_status_show() {
+     echo " "
+     if [ "$test_script_status" =3D "fail" ]; then
+         echo "$TEST_NAME: fail"
++        exit 1
+     elif [ "$test_script_status" =3D "skip" ]; then
+         echo "$TEST_NAME: skip"
+     else
+--=20
+2.4.4
+
diff --git a/meta-ti-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-r=
elative-paths.patch b/meta-ti-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidl=
e-Avoid-relative-paths.patch
new file mode 100644
index 00000000..0c39d6f4
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative=
-paths.patch
@@ -0,0 +1,58 @@
+From: Carlos Hernandez <ceh@ti.com>
+Subject: [meta-arago][linaro pm-qa PATCH 2/2] cpuidle: Avoid relative path=
s
+Date: Thu, 13 Aug 2015 15:03:01 -0400
+
+Instead of assuming location of files in the filesystem by using
+relative paths, call binary and let $PATH find binary location.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ cpuidle/cpuidle_02.sh | 2 +-
+ cpuidle/cpuidle_03.sh | 2 +-
+ include/functions.sh  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cpuidle/cpuidle_02.sh b/cpuidle/cpuidle_02.sh
+index 4242e241926e..111fa67ff110 100755
+--- a/cpuidle/cpuidle_02.sh
++++ b/cpuidle/cpuidle_02.sh
+@@ -27,7 +27,7 @@
+=20
+ . ../include/functions.sh
+=20
+-CPUIDLE_KILLER=3D./cpuidle_killer
++CPUIDLE_KILLER=3Dcpuidle_killer
+=20
+ check "cpuidle program runs successfully (120 secs)" "$CPUIDLE_KILLER"
+ test_status_show
+diff --git a/cpuidle/cpuidle_03.sh b/cpuidle/cpuidle_03.sh
+index d82e5e348c90..f79cf894eade 100755
+--- a/cpuidle/cpuidle_03.sh
++++ b/cpuidle/cpuidle_03.sh
+@@ -27,7 +27,7 @@
+=20
+ . ../include/functions.sh
+=20
+-CPUIDLE_KILLER=3D./cpuidle_killer
++CPUIDLE_KILLER=3Dcpuidle_killer
+=20
+ is_root
+ if [ $? -ne 0 ]; then
+diff --git a/include/functions.sh b/include/functions.sh
+index 0b054776b763..62747481fe5c 100644
+--- a/include/functions.sh
++++ b/include/functions.sh
+@@ -23,7 +23,7 @@
+ #       - initial API and implementation
+ #
+=20
+-. ../Switches/Switches.sh
++#. ../Switches/Switches.sh
+=20
+ CPU_PATH=3D"/sys/devices/system/cpu"
+ TEST_NAME=3D$(basename ${0%.sh})
+--=20
+2.4.4
+
diff --git a/meta-ti-test/recipes-devtools/pm-qa/pm-qa_%.bbappend b/meta-ti=
-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
new file mode 100644
index 00000000..e7b8f7e2
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
@@ -0,0 +1,6 @@
+
+PM_QA_TI =3D ""
+PM_QA_TI:ti-soc =3D "pm-qa-ti.inc"
+
+require ${PM_QA_TI}
+
diff --git a/meta-ti-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/m=
eta-ti-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
new file mode 100644
index 00000000..572576a7
--- /dev/null
+++ b/meta-ti-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "UVC gadget userspace sample application"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://uvc-gadget.c;beginline=3D1;endline=3D18;md5=
=3D414860c3c534dc95d81da9564cfb8d2a"
+
+SRC_URI =3D "git://git.ideasonboard.org/uvc-gadget.git;branch=3Dmaster"
+
+PV =3D "1.1+git"
+SRCREV =3D "aa82df887ab995473cd83c89777cdf4bc4685dd0"
+
+EXTRA_OEMAKE =3D 'CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" LDFLAGS=3D"${LDFLAGS}"=
 KERNEL_INCLUDE=3D""'
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m755 uvc-gadget ${D}${bindir}
+}
--=20
2.43.0


