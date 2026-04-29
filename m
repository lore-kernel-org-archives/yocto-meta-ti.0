Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CF6CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:33 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14117.1777476206487816982
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uFh6xQgo;
 spf=pass (domain: ti.com, ip: 40.107.209.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jw1UrDLewp6xrCqjwh18JlfXYypa5zflcecWqkgp5wFTXa8Q0Csa3va1xHf7qeZtuE9OE8pvy8FZMgjXTxKXaBk+XIqWlYYnfBVKmZIj0skKmTcdiRmCAb2MNjOYKxIBr2vPSHSrDFgIfcLo8ajyLbmdXmw3A0ftDG1OYcP9duzCnrzBvRpYG7+VLJ4fzH0LKHk2WQ0ZBQ3yfah6Z8ww4uZ+oURhpAi5lBxYryE/6blQkhmy1zPDgagv8Mnc2YreK+GX/bFWxIPmjaExkU7f96utC6aBM1Wj7C9Hg3cNcYybjOeFD66gtzCLugsb1POKbAIdKAgSTjmXG7lYTGoXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CaJXZcNavqWMwUC7zK+59LjHgREsWUZz3v1F1O2Z1E=;
 b=NePbbgHInu0gxumafe4JqYBb8FRrAa9DnA6O2jl0X/fn8tg3bG/kqvg7JNesxSOM/JEEJ2hCzRxU/VaP3kH+xbou3BBH9OY5eZGgkTz6b/xxfJBDYSKJFF4yNt1KogpSjb0xIhl51kzpZH3JyURpEIFA3SARFNGMvCeBrNrbdN7blJhhpKk9VOxuIq+5Mc9u49EmdmRigtj1JWGOW7Syl972j6okYMNqKdBM8LiWo1DRTeGJjJrI4p+pmP8RCxZ8EvMro0s7yS6MmM2djBx737Gi5M4C+D65J8BjwZw3oq7TLxIhC4eY2dUftszbFRhcndpyqI7sHmUcdf5ZlJ+mOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CaJXZcNavqWMwUC7zK+59LjHgREsWUZz3v1F1O2Z1E=;
 b=uFh6xQgoBpn6YRXTQzqwuyeHhgESxUczN9bVf8s+jxqyNGaIsHhApy5JyzNBpmlA66G7vlngj7EaLebuQ8YW5MUZZiAJ/QKrJ/Wz95M8ua/PTIoZTplrqtw9aykDL+LvmFQOEZAw3fQ6pkVBkmCI4zIGgEdkbKmiKaO7bkDRiVs=
Received: from SJ0PR03CA0373.namprd03.prod.outlook.com (2603:10b6:a03:3a1::18)
 by LVWPR10MB997838.namprd10.prod.outlook.com (2603:10b6:408:3c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 15:23:24 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::88) by SJ0PR03CA0373.outlook.office365.com
 (2603:10b6:a03:3a1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:23:23 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0ci3585465;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sL-2hNu;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 07/12] meta-ti-test: Import the recipes-graphics recipes
Date: Wed, 29 Apr 2026 10:22:55 -0500
Message-ID: <20260429152300.979685-7-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|LVWPR10MB997838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a272efc-5f7c-4a00-27a3-08dea60340a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	q/W44jMbdMOu09j/yIA1+lA5T9sqlmyv36JjLhYdUPmk2D+xax00g2E7jka7WyI9RM3sbktgqulLKTlBVjyId1n70PU3grznLLTLvf9TGKasc4H6le9y+N1WG9BcXexOqo1pWPCLR7AV9RLz8xEmqCT8LrtV20iFuLJSc2R1WeWEk+PjZkKJETxjrzOb4oxrjDJkh/5cI++DPTJdhPBlDUzANhW+aTu73nduwtQ9CHq90lmjB8uAErNOC7z8AOPKsnmmxiKTsn9EAGc09OVXEmzjynHUypWbUAsIVyxob6f6G9cckpEZvytf6rVhDEi+IQdo1dOIdy/HcqTXcm/kLdH+EP5fQPylXJpvpHwBpmeFuIcvznwNowwB1igeVrgFoW4oxYFAilFcqdoED9VPQT5i8WYXSs+L5ua5cYz+4cSjMJiSrZ+gBb8LddJaSH+Jwop92VBn9jBSAiP+r09sTATjc6xSSb9AdM9u9uc3D1NTW/HofFhK6Zn/Tveo8xM7MthG7iaIACiW1jg19w+/7z2Hmg+7jys/h0hjCgvoHJ1ivVk1Psr6FxQ2G5GSC3h4gHnTA99CZfAXY6gsxDsljmYe/tX2KIaQYjeN10QVwnzTUhsccGwUkoecgsISDU+O+tr7FjPsBt4s1W/PLoB6qJYfWz0jqK3cDifS5mRSEemIIF4Bm+ZEPJbwIGBVTtCIEyicCSHSTTxVklV95bI7tXMal+Js0RFSidndJap1TwA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ojlmkaGDzIAzucypvUzI2JnHab0dSTwEEKf6T5cbLg2zHusTtWhZn4DancT7X4lX6G+vYfXLqRzL7EdvKhXOiGNIZp2VKSVDdyVIYFFrFVawgamtR9bvByle5dtH31G7y/WNgey1yhd7+UpEJeRqbwt4TuESbuQ4DXrwZ2kkclfmD3FNssfdAhz7fm7zgyxu/m+3JSL22g1XvWp4fvJa+yEkUo7iS2xpwxg++N4KofpPXZqWfEZCJ2H46v/x94aGA5EnD2WWOle0oIjcq7VRAVhwTM2GcpjOWnVKSHUgemCF26ja7pjncMpGUiy4aLphAl5+A5f5H4IedaKsWlSdh5vs5LybSAlqWgPsobRI2BeLh67qMm8wf7fqZ6yeGyHWOxww09k8Yp2556yHiokJui8ozR09J975IzpFYveDqZt6jTNUQfoASPsvXHrRylOF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:23.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a272efc-5f7c-4a00-27a3-08dea60340a6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997838
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19897

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-graphics.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

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


