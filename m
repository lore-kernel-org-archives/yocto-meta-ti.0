Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B7CCD13DE
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:47 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13791.1777475383164406435
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=n8JIP4OT;
 spf=pass (domain: ti.com, ip: 40.107.201.31, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkBUslJpxk3rKp16Riz0MngNv51sB4pEAShYL5QOUwSogGrfT7tMKtocasPKCSEELjTkJ/JViAgnWcZ74eUuxujhijmNLCfz3dUM+LgcnZzWBl9JU3s5jgbd0VYdSZgK3zjpY/yr/fk6dK3oDqDUti7WITsFsYuGNH7kvLPJotGmA+bMc8zEZO6rREW/FfEn0hKrA+Gt6YKYqlx3zc7jI/AKYGm340oe8y1LBWvGACm04cVo9LI7ySSZZcm0ZWCwAohXHeMEtJ69HdPJ0au4vSUipYxGhfeTdnhiNxJvwCL3vgeABu/8PZyahVIV1rRUtqTDlhrkpCxdUl9akG7E2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVKWKw4n4tXZjdzbygYLQUY70TcXwE02IRHPB2pV/FE=;
 b=Qwk1d7BJX45Xins0gKy/+JW8qiuXTgZvYj1uqF4XvKeXa6JX/3VvtpHIii85nhg+4wKN1kKIQsxJ7eWuBhn8xCD2eknkGDxvQIjrSDkY3M7ONiI9LYxGGHEOgx9VzWyMi2EuF695AL5TSUb+OvlJOB2Xzcb1rf4XwTj9l80FAPlxZQjIszh0IkPoSXdlGMRH0SCcHvM8HFni9O3d9fqnsROaa0WVfpzzdEjIT5W/ziwCS2jeTrgH/+m3pvNvw2sj4Cnp20qrupr0iTyRQiN3/fwdGuUhVputVh78ZzAxTg7NExTtK8ROzXnGhbnAD0F2KCISVuRtzvejCLUUWWgXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVKWKw4n4tXZjdzbygYLQUY70TcXwE02IRHPB2pV/FE=;
 b=n8JIP4OTDrrHMFAcw7uhbbkf6RRHWGE1qJLjmrZukskdI0CaQmlZ3aMBl9VQNwqLPR8U+au8WqaOnjHClQ355eHAIZvaHQWwSBW13v9Hc8NyGirCxXLjgm383BZnAHk6j+kluHBpBaAxk9cpgHAmsoNmLc0S334V37y7r4OICpw=
Received: from SJ0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:a03:333::26)
 by PH0PR10MB5796.namprd10.prod.outlook.com (2603:10b6:510:da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:09:39 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::40) by SJ0PR03CA0111.outlook.office365.com
 (2603:10b6:a03:333::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:37 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9Knm3565164;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046VP-1ils;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 07/12] meta-ti-test: Import the recipes-graphics recipes
Date: Wed, 29 Apr 2026 10:09:15 -0500
Message-ID: <20260429150920.978263-7-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|PH0PR10MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0d1151-7884-4f6e-c161-08dea6015493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	4VSPzIC0OjHQHuYSDwRDxL7n5E3cOhZU71jvD6HQrCyVjQ30236ljPlkkEudYi/2pS2Adgv3Mgl7Uoa1Y6Te3DabL1kSMbXPL8+qOSTpSKjvnKRIUJmfDekd1K27h9IsQMCN6p9lBIsg2o2nWF/TcxPCp1f+kyk8UA9C/aFDU+G/TZ8KOilR78bBmFPiIlBt9y55TMj0rbS9qKFj7MOyUlXNnMGupidK/Xq9nSmubnnmZCEIeHQyyxAVRy2W8bqntCEStJAtTcCawQR6nYwTMXHOTXLzWvWTAlUD5jP0ZYjY/ePh0ALFUOzINIfMaR1mreEJ1V7fHsXEVgICNOGuPdtAVn6f89iBQ6qdyVkiVtt/bHEpNBYdgvXQGmIhIR1UlYnbc4twmAMgdWyzlvMKrNy/ymJ01ehASZ8WuFfjjkS3O5O89i/pPjmoJ0svFQ3NCKLKCP6MsT5i5mmVuuG7ywxS9zFbR4gv1RZX4V9AMwI8JHI67r6NSZtZREyUQtOagxrIvq/N/C0pdCx5F+2qdRYPcsf96u7TbmwPL72d/UaVmyddgw4pm9KTTLSYnvrhH/n1TSFNJdoqNOl5dbG7aL1KMfZ8zeKCiKrpCbaHzPar5hz7pUxmqyNoZElE2ROYj60BS1v2nqAtRvUTmVRz7QbuLaGCVj6toyd/mF6qGWou2P3rxmAO2Gor7oXBMDqQafEdw/91pZwW2DnhRKzYrBxyJYb+EgDoWxBVYCM7+Pc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dv2Hd7NWVkByp4V/I5m5QUIieDayzXmKNlTcuxIf7yfvspP5V2ztpDhAm9AhAf1ik9zvWBSz6Jxu5pEX9RSI15e/HH+XbyT1lPXN4py2e6Xop+DSG4C2ayqY5dWMKL6O+OeMbFq5kGJet2qx2EmfqNYqIYj9a/pwWludqyfGqBLspT2j1AZ2GGhvgrKAjZWLPied0o+UtQJcoJ0UDyU+eA9Ir4xHsdfunTkob2O29dGTPe059VlGUpkTtqpKpXo+wopB4wijAdd8FL9S/30XUKUkZSKyQYUhq/ozPjTqNOtjDH74ENXum2YApF7kFOYEjtyIdmr3CqTbxThf0XOLh7J+emILQTMdT159llwJPZsoMfqyjI0HoTAmb93yhOxMlic/Wyh7Wzy4WrMG2YKzAO9EtR+/oyMQINtiDkf9JZ1LfNX4n0PHkBXMXY8RsQfd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:37.6045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0d1151-7884-4f6e-c161-08dea6015493
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5796
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19889

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-graphics.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/libsdl2/libsdl2-ti.inc   |   5 +
 .../libsdl2/libsdl2_%.bbappend                |   4 +
 .../offscreen-demo/offscreendemo_0.0.1.bb     |  16 +++
 .../recipes-graphics/piglit/piglit-ti.inc     |  32 +++++
 ...-add-and-use-TestPlaceholder-objects.patch | 128 ++++++++++++++++++
 .../recipes-graphics/piglit/piglit_%.bbappend |   4 +
 6 files changed, 189 insertions(+)
 create mode 100644 meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-ti-test/recipes-graphics/libsdl2/libsdl2_%.bbappen=
d
 create mode 100644 meta-ti-test/recipes-graphics/offscreen-demo/offscreend=
emo_0.0.1.bb
 create mode 100644 meta-ti-test/recipes-graphics/piglit/piglit-ti.inc
 create mode 100644 meta-ti-test/recipes-graphics/piglit/piglit/0001-framew=
ork-add-and-use-TestPlaceholder-objects.patch
 create mode 100644 meta-ti-test/recipes-graphics/piglit/piglit_%.bbappend

diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti=
-test/recipes-graphics/libsdl2/libsdl2-ti.inc
new file mode 100644
index 00000000..33ff0632
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -0,0 +1,5 @@
+EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
+                  -DSDL_INSTALL_TESTS=3DON \
+                 "
+PACKAGE_BEFORE_PN =3D "${PN}-tests"
+FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-tests/SDL2"
diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/met=
a-ti-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
new file mode 100644
index 00000000..385aa801
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
@@ -0,0 +1,4 @@
+LIBSDL2_TI =3D ""
+LIBSDL2_TI:ti-soc =3D "libsdl2-ti.inc"
+
+require ${LIBSDL2_TI}
diff --git a/meta-ti-test/recipes-graphics/offscreen-demo/offscreendemo_0.0=
.1.bb b/meta-ti-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
new file mode 100644
index 00000000..6dc0e526
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Lightweight Render Example"
+DESCRIPTION =3D "Lightweight Render Example. Heavily inspired by Eduardo L=
ima's gpu-playground, this attempts to act as the smallest demo of offscree=
n rendering."
+
+HOMEPAGE =3D "https://github.com/TexasInstruments/graphics-tests.git"
+
+SRC_URI =3D "git://github.com/TexasInstruments/graphics-tests.git;protocol=
=3Dhttps;branch=3Dmaster"
+SRCREV =3D "eac40e0073cb5f81688aee890e0a67f99678a290"
+
+LICENSE =3D "CC0-1.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65d3616852dbf7b1a6d4b53b0062603=
2"
+
+DEPENDS +=3D "virtual/egl virtual/libgles2"
+
+inherit pkgconfig meson features_check
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
diff --git a/meta-ti-test/recipes-graphics/piglit/piglit-ti.inc b/meta-ti-t=
est/recipes-graphics/piglit/piglit-ti.inc
new file mode 100644
index 00000000..707ef6a4
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/piglit/piglit-ti.inc
@@ -0,0 +1,32 @@
+# add a config to point piglit at the default install location for deqp te=
sts
+# if they are selected
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/piglit:"
+
+SRC_URI +=3D "file://0001-framework-add-and-use-TestPlaceholder-objects.pa=
tch"
+
+PACKAGECONFIG[deqp-gles] =3D ",,,opengl-es-cts"
+PACKAGECONFIG[deqp-vk] =3D ",,,vulkan-cts"
+
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-gles', 'true', 'false',=
 d)}; then
+        printf "%s\n" \
+            "[deqp-egl]" \
+            "bin=3D/usr/lib/opengl-es-cts/deqp-egl" \
+            "[deqp-gles2]" \
+            "bin=3D/usr/lib/opengl-es-cts/deqp-gles2" \
+            "[deqp-gles3]" \
+            "bin=3D/usr/lib/opengl-es-cts/deqp-gles3" \
+            "[deqp-gles31]" \
+            "bin=3D/usr/lib/opengl-es-cts/deqp-gles31" \
+            >> ${D}/${libdir}/piglit/piglit.conf
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-vk', 'true', 'false', d=
)}; then
+        printf "%s\n" \
+            "[deqp-vk]" \
+            "bin=3D/usr/lib/vulkan-cts/deqp-vk" \
+            "[deqp-vksc]" \
+            "bin=3D/usr/lib/vulkan-cts/deqp-vksc" \
+            >> ${D}/${libdir}/piglit/piglit.conf
+    fi
+}
diff --git a/meta-ti-test/recipes-graphics/piglit/piglit/0001-framework-add=
-and-use-TestPlaceholder-objects.patch b/meta-ti-test/recipes-graphics/pigl=
it/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch
new file mode 100644
index 00000000..26e0b21e
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/piglit/piglit/0001-framework-add-and-us=
e-TestPlaceholder-objects.patch
@@ -0,0 +1,128 @@
+From 2803263ccf460ced705fd4da589e2f09e3ec89d7 Mon Sep 17 00:00:00 2001
+From: Randolph Sapp <rs@ti.com>
+Date: Wed, 13 Aug 2025 17:52:42 -0500
+Subject: [PATCH] framework: add and use TestPlaceholder objects
+
+The actual Test classes are not that big, but with deqp-vk creating
+around 2800 instances currently, we quickly consume around 3GB of ram
+before beginning any tests. Given that a lot of these objects may not
+even be used, we can reduce memory overhead by using a placeholder
+namedtuple that is expanded to a full Test instance when requested from
+the TestDict class. This cuts the initial memory usage back to 1.6 GB.
+
+This does add a small lookup penalty, but given the lookup penalty is
+still smaller that the time it takes to create an instance of a Test, it
+results in a net improvement for most subsets of deqp tests. Not to
+mention this penalty can be split between threads, unlike previously
+when it was occurring in the single-threadded profile creation step.
+
+The following data was collected using a subset of 3151 deqp-vk tests:
+
+Threads   Test Execution Time (s)   TestPlaceholder Execution Time (s)
+-------   -----------------------   ----------------------------------
+1         2613.93                   2599.95
+8          413.31                    400.01
+32         299.75                    286.73
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/m=
erge_requests/1032]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ framework/profile.py   | 23 ++++++++++++++++++-----
+ framework/test/base.py |  3 +++
+ framework/test/deqp.py |  4 ++--
+ 3 files changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/framework/profile.py b/framework/profile.py
+index 678e9d87c..969e0032e 100644
+--- a/framework/profile.py
++++ b/framework/profile.py
+@@ -45,7 +45,7 @@ from framework import grouptools, exceptions, status
+ from framework.dmesg import get_dmesg
+ from framework.log import LogManager
+ from framework.monitoring import Monitoring
+-from framework.test.base import Test, DummyTest
++from framework.test.base import Test, DummyTest, TestPlaceholder
+ from framework.test.piglit_test import (
+     PiglitCLTest, PiglitGLTest, ASMParserTest, BuiltInConstantsTest,
+     CLProgramTester, VkRunnerTest, ROOT_DIR,
+@@ -135,9 +135,9 @@ class TestDict(collections.abc.MutableMapping):
+                 "TestDict keys must be strings, but was {}".format(type(k=
ey)))
+
+         # Values should either be more Tests
+-        if not isinstance(value, Test):
++        if not (isinstance(value, Test) or isinstance(value, TestPlacehol=
der)):
+             raise exceptions.PiglitFatalError(
+-                "TestDict values must be a Test, but was a {}".format(
++                "TestDict values must be a Test or TestPlaceholder, but w=
as a {}".format(
+                     type(value)))
+
+         # This must be lowered before the following test, or the test can=
 pass
+@@ -164,8 +164,21 @@ class TestDict(collections.abc.MutableMapping):
+         self.__container[key] =3D value
+
+     def __getitem__(self, key):
+-        """Lower the value before returning."""
+-        return self.__container[key.lower()]
++        """Lower the value before returning. Remove placeholders as neede=
d."""
++        item =3D self.__container[key.lower()]
++        if isinstance(item, TestPlaceholder):
++            try:
++                real_item =3D item.test_class(item.test_name)
++            except TypeError:
++                raise exceptions.PiglitFatalError(
++                    "Unable to expand the TestPlaceholder for the class: =
{}\n"
++                    "This was associated with the following key: {}".form=
at(
++                        type(item), key
++                    )
++                )
++            self.__container[key.lower()] =3D real_item
++            return real_item
++        return item
+
+     def __delitem__(self, key):
+         """Lower the value before returning."""
+diff --git a/framework/test/base.py b/framework/test/base.py
+index 430064b9b..0efa38336 100644
+--- a/framework/test/base.py
++++ b/framework/test/base.py
+@@ -24,6 +24,7 @@
+ """ Module provides a base class for Tests """
+
+ import abc
++import collections
+ import copy
+ import errno
+ import itertools
+@@ -97,6 +98,8 @@ def is_crash_returncode(returncode):
+         return returncode < 0
+
+
++TestPlaceholder =3D collections.namedtuple('TestPlaceholder', ['test_clas=
s', 'test_name'])
++
+ class Test(metaclass=3Dabc.ABCMeta):
+     """ Abstract base class for Test classes
+
+diff --git a/framework/test/deqp.py b/framework/test/deqp.py
+index 849ffbd96..ccfeaeff2 100644
+--- a/framework/test/deqp.py
++++ b/framework/test/deqp.py
+@@ -26,7 +26,7 @@ import subprocess
+ from framework import core, grouptools, exceptions
+ from framework import options
+ from framework.profile import TestProfile
+-from framework.test.base import Test, is_crash_returncode, TestRunError
++from framework.test.base import Test, is_crash_returncode, TestRunError, =
TestPlaceholder
+
+ __all__ =3D [
+     'DEQPBaseTest',
+@@ -56,7 +56,7 @@ def make_profile(test_list, test_class):
+     for testname in test_list:
+         # deqp uses '.' as the testgroup separator.
+         piglit_name =3D testname.replace('.', grouptools.SEPARATOR)
+-        profile.test_list[piglit_name] =3D test_class(testname)
++        profile.test_list[piglit_name] =3D TestPlaceholder(test_class, te=
stname)
+
+     return profile
+
+--
+2.50.1
diff --git a/meta-ti-test/recipes-graphics/piglit/piglit_%.bbappend b/meta-=
ti-test/recipes-graphics/piglit/piglit_%.bbappend
new file mode 100644
index 00000000..d93e5d48
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/piglit/piglit_%.bbappend
@@ -0,0 +1,4 @@
+PIGLIT_TI =3D ""
+PIGLIT_TI:ti-soc =3D "piglit-ti.inc"
+
+require ${PIGLIT_TI}
--=20
2.43.0


