Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B711FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:46 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.833.1777481084377334266
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Bv9cal8q;
 spf=pass (domain: ti.com, ip: 52.101.85.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRPFONJNvu0q7JSkPYA4SSmRyxGHEV0jAOMnu0xQtK0QLidB9gBOd8v/TouX2Amtuzt2bG/l8yX5MsbxR9lhtri5kjy20xY7QVdyGvTBe6PyEFJoanz0+/a0J/MYU04AXADFoxUum8mnD0y525h7rwrJ9s0PBjWDb81ZJRuVPx6YfuhtuNyUdN64qJUSi2rtrkqmXMMmZQlJaXbDAjPCPsVQFlDy68eGIAnmKInDBj1E4gVX3+33lkQHlKynAFCA1dkuZNKk6n+RZH8B2x1iE73O8UFRWZdEwZ0LRnOxRZWsUhkibbFsnkgZnCMA0NjjC9m6w+VLZ+an4WkfyjtlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32wXR2TLwLSHhm430+6Pzz8hanC5z1GUlqlNFSN6k60=;
 b=IdcHtyDzUQMf8aj6LUPYgIibBbAIs4fvVKSS9nfUp2hNGsRe+qDC0EgULjt8zI0nNHuXWCoT6TZMlxJsH1ibgazcXqE18KFXsuEOrjOx7KHsHf7W7LU9Vt/pF/NSolJDweHYia4Io/oT0My4vIa/Ud/c3Amt2L8NEI+U6NvKu4i5yz+qjLABjSLT2YpZPNzRrkOhL+rRT9SeIujzk4jtIe8ejyGmDQJ/U2V6nh4RySnVz7hXHpFsBqEBA7j9UbVWkT6By3XO40Ut3YlRVqUNb5LvKwLV9ByQP0oHCvvQFFx958Xl4woVxjiHFFUahBIUxAWrCaY0AxtNivcK+enupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32wXR2TLwLSHhm430+6Pzz8hanC5z1GUlqlNFSN6k60=;
 b=Bv9cal8qLlUL2NOSaSIvs/qSjLoWHeSV0uARe323pe+RpxNrB405YNvo5GgjJagNERhKHDmeWLdEpK2Ljw3/lFUFGnYdc75m7QRTfSxsORlg6cI9Q2Crhnxzsa331Ifu2O8C05pDsWxCqRFkMd01/rWrxRhsPedhkISeXFyizM0=
Received: from SJ0PR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:334::17)
 by SA1PR10MB997605.namprd10.prod.outlook.com (2603:10b6:806:4b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:44:41 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::bc) by SJ0PR05CA0102.outlook.office365.com
 (2603:10b6:a03:334::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Wed,
 29 Apr 2026 16:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:39 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:33 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWHd3719625;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oOD-3LGk;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 10/12] meta-ti-test: Import the dynamic-layers recipes
Date: Wed, 29 Apr 2026 11:44:30 -0500
Message-ID: <20260429164432.1623594-10-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA1PR10MB997605:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a383a0-86b9-4367-4b5f-08dea60e9b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|20052099010|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	4wf9brGoFLfbmLNCqLqBFrB2HRncfc80MCQLloHAm/54TdBuOMmcDMcdPaZ+O3oNl5RHkSfklzlB3p8oHLnrfjuv+50y4VRnzfvGOmh/QGn08B947TSjl1kC8QHlY5tWeKRcm/I/VhtDpeS0ajMEVq/O6I81cpRNLEtZQsKcOyKPpV11lvvEOAgxpg0A4YsXcZsE9Ko2BXhS6ycMQGUt3yYkCHsCMiHYBCQwTvDIDGcM83AFikfdZEs7kWeI0lrrBVls+oDE5x15MydO048yXrPPevyLhFHnyaG4wmt5qrkmh9QOc9AcADV9pfev2yrNWb01GcOk2SJ6bYM9suJpA25aUHRnaSjFJhGrBEI+dAXTgSXFXSSvZUwsOBVVW/DKqobEwuEeY67efjpBk5j+g1ZSAIctVEPeWfbvBlLNtHqus0lT8QuOjzsg0ylEpPxwLoJ4cvOIs3E6SI65DX82WJM84sTDWeMdXmQTeOMuaOF4drRFEk9RGCRWfgdRGmLaz3ac/Ie+IvJ1GoJyzksDxJ7gP1TEOhyA9lYENRSSf+9AM7UDr5vSWZLjUfN2rKXQ/kcaopn8mxBdYRIQSwfZAX3o5QdHVYuNd23MLN6SuOnU58J0L7Yxd4NDULt67q9c1W5kGvqGhj8JRyg1Gi40deefrUifo5ioXovp9IBcyOa5ihXbP8KLNq4Dwwuay1/YmzLtjg+n9S19gQJW1ONFjF4nEzLs8jv/UfKAUe/uWQzzRw6lzL2vqy9zUOARtS2sSXARHLve3SUkDiHHo19l3A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(20052099010)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0ygPPVrVUqGC6DAX1D7Xizx513VHRwCRKvUGwuJzFuuyZXLEO1R/k0BRdRhvdr+sinYRNy57TtxenwYf3ywBRJ9VUqrHivTWAtZPzl88gSOboJN7XFoW/yraqn+kjM2I8JnIXlHNy+XP4GZo1ppPdIAf9BwA0UIVc98VWhgMo+yeE9NKB6TGL79cn17eUF7TRvhrv4wk+sab5yueVJjpIeC8cirCS2nIks1KsLS2Vo/nFNVa69KlMFYgF4vgfPX0iRG/LvUhWlS0X3x9mo/IaLL0emmB5ItqtZiTeIhTYHRsqiayH61DTM7sUMxmAopOUJs/ipXe5YKSo8PYEaz2YZ0qaAEoWre5bbR+Njdd98dSAOxQbxPZr531iarelvRF0M7e4gWkRvVrftFo5WHApE5SmEOobt4JaE5yeCXYImboqBorcMlU4CzTR7UjKKWq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:39.7975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a383a0-86b9-4367-4b5f-08dea60e9b5a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997605
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19912

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under dynamic-layers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
v2: No changes.

 meta-ti-test/conf/layer.conf                  |  2 +
 .../flutter-samples-material-3-demo-ti.inc    |  1 +
 ...flutter-samples-material-3-demo_%.bbappend |  4 +
 .../flutter/flutter-wayland-client-ti.inc     |  3 +
 .../flutter/flutter-wayland-client_%.bbappend |  4 +
 ...-message_codec.h-Include-cstdint-lib.patch | 93 +++++++++++++++++++
 .../packagegroups/ti-test.bbappend            |  7 ++
 7 files changed, 114 insertions(+)
 create mode 100644 meta-ti-test/dynamic-layers/flutter-layer/recipes-graph=
ics/flutter/flutter-samples-material-3-demo-ti.inc
 create mode 100644 meta-ti-test/dynamic-layers/flutter-layer/recipes-graph=
ics/flutter/flutter-samples-material-3-demo_%.bbappend
 create mode 100644 meta-ti-test/dynamic-layers/flutter-layer/recipes-graph=
ics/flutter/flutter-wayland-client-ti.inc
 create mode 100644 meta-ti-test/dynamic-layers/flutter-layer/recipes-graph=
ics/flutter/flutter-wayland-client_%.bbappend
 create mode 100644 meta-ti-test/dynamic-layers/flutter-layer/recipes-graph=
ics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
 create mode 100644 meta-ti-test/dynamic-layers/qt6-layer/recipes-core/pack=
agegroups/ti-test.bbappend

diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
index 1997f0b4..216ab344 100644
--- a/meta-ti-test/conf/layer.conf
+++ b/meta-ti-test/conf/layer.conf
@@ -24,6 +24,8 @@ LAYERDEPENDS_meta-ti-test =3D " \
 "
=20
 BBFILES_DYNAMIC +=3D " \
+    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
+    flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.bb=
append \
 "
=20
 # Codecs in ffmpeg with questionable patent status are not included by
diff --git a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flu=
tter/flutter-samples-material-3-demo-ti.inc b/meta-ti-test/dynamic-layers/f=
lutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-ti.in=
c
new file mode 100644
index 00000000..b2c9e13d
--- /dev/null
+++ b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/fl=
utter-samples-material-3-demo-ti.inc
@@ -0,0 +1 @@
+FLUTTER_BUILD_ARGS:append =3D " --no-pub"
diff --git a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flu=
tter/flutter-samples-material-3-demo_%.bbappend b/meta-ti-test/dynamic-laye=
rs/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%=
.bbappend
new file mode 100644
index 00000000..985615c8
--- /dev/null
+++ b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/fl=
utter-samples-material-3-demo_%.bbappend
@@ -0,0 +1,4 @@
+FLUTTER_TI =3D ""
+FLUTTER_TI:ti-soc =3D "flutter-samples-material-3-demo-ti.inc"
+
+require ${FLUTTER_TI}
diff --git a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flu=
tter/flutter-wayland-client-ti.inc b/meta-ti-test/dynamic-layers/flutter-la=
yer/recipes-graphics/flutter/flutter-wayland-client-ti.inc
new file mode 100644
index 00000000..4d211568
--- /dev/null
+++ b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/fl=
utter-wayland-client-ti.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
+
+SRC_URI +=3D "file://0001-message_codec.h-Include-cstdint-lib.patch"
diff --git a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flu=
tter/flutter-wayland-client_%.bbappend b/meta-ti-test/dynamic-layers/flutte=
r-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
new file mode 100644
index 00000000..46fdd2af
--- /dev/null
+++ b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/fl=
utter-wayland-client_%.bbappend
@@ -0,0 +1,4 @@
+FLUTTER_TI =3D ""
+FLUTTER_TI:ti-soc =3D "flutter-wayland-client-ti.inc"
+
+require ${FLUTTER_TI}
diff --git a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flu=
tter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-ti-test/=
dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_=
codec.h-Include-cstdint-lib.patch
new file mode 100644
index 00000000..7a9bff41
--- /dev/null
+++ b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/fl=
utter/0001-message_codec.h-Include-cstdint-lib.patch
@@ -0,0 +1,93 @@
+From dcfcb92c7f42cd6bd92b1048b5e4ea6f01d40e21 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Tue, 10 Mar 2026 11:01:28 -0500
+Subject: [PATCH] message_codec.h: Include cstdint lib
+
+Include cstdint lib within message_codec.h.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ .../client_wrapper/include/flutter/basic_message_channel.h       | 1 +
+ .../common/client_wrapper/include/flutter/binary_messenger.h     | 1 +
+ .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
+ .../common/client_wrapper/include/flutter/message_codec.h        | 1 +
+ .../common/client_wrapper/include/flutter/method_channel.h       | 1 +
+ .../common/client_wrapper/include/flutter/method_codec.h         | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/basic_message_channel.h b/src/flutter/shell/platform/common/client_wrap=
per/include/flutter/basic_message_channel.h
+index c081946..fcc6b23 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/bas=
ic_message_channel.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/bas=
ic_message_channel.h
+@@ -7,6 +7,7 @@
+
+ #include <iostream>
+ #include <string>
++#include <cstdint>
+
+ #include "binary_messenger.h"
+ #include "message_codec.h"
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/binary_messenger.h b/src/flutter/shell/platform/common/client_wrapper/i=
nclude/flutter/binary_messenger.h
+index d552b49..82e47da 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/bin=
ary_messenger.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/bin=
ary_messenger.h
+@@ -7,6 +7,7 @@
+
+ #include <functional>
+ #include <string>
++#include <cstdint>
+
+ namespace flutter {
+
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/engine_method_result.h b/src/flutter/shell/platform/common/client_wrapp=
er/include/flutter/engine_method_result.h
+index 3cc8b6a..9634ead 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/eng=
ine_method_result.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/eng=
ine_method_result.h
+@@ -8,6 +8,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+
+ #include "binary_messenger.h"
+ #include "method_codec.h"
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/message_codec.h b/src/flutter/shell/platform/common/client_wrapper/incl=
ude/flutter/message_codec.h
+index c84d25f..c007b1e 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/mes=
sage_codec.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/mes=
sage_codec.h
+@@ -8,6 +8,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+
+ namespace flutter {
+
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/method_channel.h b/src/flutter/shell/platform/common/client_wrapper/inc=
lude/flutter/method_channel.h
+index 6e39a64..34687a6 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_channel.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_channel.h
+@@ -7,6 +7,7 @@
+
+ #include <iostream>
+ #include <string>
++#include <cstdint>
+
+ #include "binary_messenger.h"
+ #include "engine_method_result.h"
+diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/method_codec.h b/src/flutter/shell/platform/common/client_wrapper/inclu=
de/flutter/method_codec.h
+index b40fa64..edd14d6 100644
+--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_codec.h
++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_codec.h
+@@ -8,6 +8,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+
+ #include "method_call.h"
+ #include "method_result.h"
+--
+2.34.1
diff --git a/meta-ti-test/dynamic-layers/qt6-layer/recipes-core/packagegrou=
ps/ti-test.bbappend b/meta-ti-test/dynamic-layers/qt6-layer/recipes-core/pa=
ckagegroups/ti-test.bbappend
new file mode 100644
index 00000000..8d1f95f7
--- /dev/null
+++ b/meta-ti-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-t=
est.bbappend
@@ -0,0 +1,7 @@
+# Include the examples for Qt6 related tests
+# Include qtwayland for wayland support if the distro enables it
+
+TI_TEST_EXTRAS:append =3D " \
+    qtbase-examples \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland', '', d)=
} \
+"
--=20
2.43.0


