Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE255CD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:43 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13938.1777476216704667281
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rRXUOrAj;
 spf=pass (domain: ti.com, ip: 40.107.200.12, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPmv3rSwhxFV50nqO4HXoYFEjdtwhjYJuRkz1tpHyEDev77i3DhVPrs4KjAN/2fZaoRH7P9wWoAeYvQsRknqzwDbZQYSu86xi4udlSrRlwck5k4BUwYPZgUVFgy/GKaq2uqVfERv2iHJT578cPwyU3jJEXqYtw+bEPnMHG5woAF4D4MX/imkcNYtlPWX58XQ+2LEhK2nv+6vCqUxZ8AmWhfV1VldbP0+eAFG+7j2vls1FHaZrC7cewuxgKfBmwcGoyex0+5nd5+Ammbr32ejnoUotMfK+8DZlQMGw34qpxAJlbPVHWqYrZOnsWBKNtgImuSqDv9mmOHLrG7PhlBICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUydSic3KoDzu2HKqurLYuaYK+9Oh0JmzBDOTC22BrA=;
 b=Bb/lZpTaqJbTW3xEKOq6asJ13S2g2f76MWMJS2V7F9gbx4x5t8JLVgQxS9gCOBw2CRrib1Qf+cP5TZw3ocjbPEvUxTMB+zc/Uml9mvhfXQTJ0/ZW+uRGzVswhJe6YCydsHXon6VRbOhms9KAkIiSKdB4WBlrc/ms2LIIKDNccNbgZZB3XlhDy+cEkgypjzvHrktRhOjl/x6gYK+V8jLFea9nXrJbqooyoRh4PbCpczLiCiHjtfHKQ+lkpiZPfuTtTvu8QwUK4j5jbfRRdc8XPjktx9ByyRszgomrpZG8XQaSU1JTkkNze8lw44zXVGIQ7US94Ad+V3L2NRi6ehe6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUydSic3KoDzu2HKqurLYuaYK+9Oh0JmzBDOTC22BrA=;
 b=rRXUOrAjPQwuB6vQDqCxooGe1dyJQF89adyLMeTZi0pd6xkg2t8x/0FQc2ln347oqc3werdbxQTK0mkUsajZqguGs/U5bXT6Fqeqau7xbLMOugT6MhRpMmuoFxq4nFEohQ8UyG3McugAfXxR0Bh0zSk+WB1cbfEnwz0WBsytnFo=
Received: from BYAPR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:40::21)
 by CY8PR10MB6467.namprd10.prod.outlook.com (2603:10b6:930:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:23:33 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::f3) by BYAPR04CA0008.outlook.office365.com
 (2603:10b6:a03:40::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:31 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:01 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0X73585468;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sa-2xTH;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 10/12] meta-ti-test: Import the dynamic-layers recipes
Date: Wed, 29 Apr 2026 10:22:58 -0500
Message-ID: <20260429152300.979685-10-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|CY8PR10MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 024daf5c-2a3c-4129-903c-08dea60345e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	sDjWkac9iBewkoVbSwY5jr+xQDMb3EXzlMElVevl2fK1B1q/RwQ8gT6nqOzNdxfLv11x4ch/xPMmQXp4o9+qYN6utTOSW4qHZKsgNou7ID6vGjyCFzHUzHqSlD62KULoaCV5iPyigj7DDS/waeS2X1eDAqCKj5EPXm7zyrWU2HkM+5+OEbs8gbIbM4SijEkCH2+VZHPsOPXX1Vng5IE+hyHlLPcsQskCuCv5rUxDjLLJCs14ucahsFVro0OQcvhEI6lfog8d0tZV3tsNZ5cTAoLMz5662fJDfTrUfrFBMSvzx2REmC77nbFsZWAFUEBHFCxNee0efdNiQ6mrhkxQ89bPV2p5TySAUrf4Bhaphwg4XSLrVq8eRk8/0FFFGK31sd7NPrWlKnvvSVgyiZCtKOI4MRBRJvQY5scdacJynya8A//EVxjSiNXVwWZbL69ax+NeYz3swl8Lbolxkz2uTEIZfbbLGA91Brfc8AsMtOYntio3SU8pp63yCDbvYzciayBSr4tixoyHj6Ys3c+CfbIn1+b0zTHrTk/EmMEAX+xyOOzr1br1O72LijheEAPPZhxW+rPS4HDDpO+ISTn2hD8fk9+AyZIFpulNORasx3nMRGVxb+ciM4enuqu66eK/VZ6gq/QwILhnHHZ5U2fi0gnGTux6IbEPS9Nlg8ovNLNsIX2zjJo9RfF84lEU/QMW4dME1f2IrSQEs8OzY6kbaTcYfouzyqsLjwFfI6NV1D9x1DM1Iy9F6Zyq1MQePsFbp5HaTvfNFy54+utjS/uPuA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U9LtWX+ER4+IrXa7VQb94Fn1E3T2jTDCX9OEs3Daj0NumxmynlH4yLI2Yv+99no1cdwpZK86O5D5aeTdALH0See0Cj/qpyOXsBzWP6/VrxHOrg6ZcqrqeR3ehw3Yl0gu/C3GCFZWwHtTfCXSOaeS3u8jplEYkh2FcfHGUe/SvCZrLpoEiAckJpTpL7iVuBZ0iM0FFwC8K4OESzGvuz55zTLkzx981EAeAa0pg5kKpr55qwbN1E2iIlHZQnc0hF63Z4SwrC/w1i/vqU9WCVHhM9uWi6B8WZw/rOYE1lI5hLTQK/7CfaebF8byOjlT90r5j0u66a3BjEJiOCEZas5beRLenY7sPexL+4wd7fKyd9ft/xYLE83nUVrH1wMs+IYW/jJiq0Q2+aQjuMKQCcGgbnghymjkxK2F2k4hFbvOk2Hn56FAzprufrO/UnOx/9Lh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:31.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024daf5c-2a3c-4129-903c-08dea60345e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6467
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19902

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under dynamic-layers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


