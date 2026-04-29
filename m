Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D44CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:45 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13590.1777475376442573561
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FiXy6yK0;
 spf=pass (domain: ti.com, ip: 52.101.193.43, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m36JNzsZ9VPmbSmUeHkZjBtGVgFaPPLEYPKRInnvQAxBfv73h2u3fULHam6LyXuiYBYZiAduoNOmt55/aS6zl9Vl4bWbC1Rg53j1Iw3kNAsGi2JWXaxD/DFwC9/20KM83rLlYOCoOnlO/4omVtEiYtiVmASt2UzMUtY3is4/1U3QtIZY5munDQyFJFDDZ/2wFaLulesSmjRjkmpA7O8MYVxhEvyLNm6dGa6Wi9FdKDm4oYLWReoDhe8CFsMGwhRIaKGEBrx4trqKAIJKWrKJ5kI0aVLeXig8DPgzCi7r+zgBgnQO2QPs0ekfH+NmfRxc83ahzvwZRz8B/OFkE4Wf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X98TASVki32rWTiZ59KHdZYDzUo2FdUgMK39MJh9+lY=;
 b=rfoqFSp8Fx8RWu12HukqrbM61QCIwOHOC7nzkBVCC/sHjaGXi9zcS6lqjjNn/o85iZ07CWq8So05SeXDg5zCB0M18gDFk7fbp3DrDnYQqKaHy9Le1s1OXKiNXm8eJWiYXzDvBlXpTFwxZhDsThWJOeYwSpPcwPXR4RYKvP/nyQVQRGJjTlS8J6EqQbG1eAk+nH3sefO7PkkLffCn8gGeUkKTNFV0MOnrBlMA0g5cn+S9uYuJ21iGnXys5wH+ipg26bR8Dwl0PLWvxhqlQoJjCNklpbPB65iwsd72XjkxcMakbcL/cRdtemsrCagrt06im5SyBHU0wB9VTc2udgKzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X98TASVki32rWTiZ59KHdZYDzUo2FdUgMK39MJh9+lY=;
 b=FiXy6yK0GlrlQHaXC+q0hKWJUYRJALsyMn3P+O6BJMI7Msojg4Qk7AHjynfcZIVITyO9U12dEtYaCVym0rp7sgO5CAl4vhbheEXboWOYWl58qhY3sAE8uoZqJT/YvZ92BOz8ECRHguYAc1M+dKmGCKnw0UHC/w0OA7KMb7qj8KI=
Received: from BLAPR03CA0055.namprd03.prod.outlook.com (2603:10b6:208:32d::30)
 by DS0PR10MB6151.namprd10.prod.outlook.com (2603:10b6:8:c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:09:33 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::8e) by BLAPR03CA0055.outlook.office365.com
 (2603:10b6:208:32d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 15:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:09:31 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9Klt3565167;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046Ve-1zKr;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 10/12] meta-ti-test: Import the dynamic-layers recipes
Date: Wed, 29 Apr 2026 10:09:18 -0500
Message-ID: <20260429150920.978263-10-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|DS0PR10MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b2315d-c870-463a-2c03-08dea6015124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003|22082099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	4JFxNMkqonh9F+aPKbqiiD7E6W+F7Xo4wRDTbQLouqrOFZrHMIWeP9svGpiK2lHgGUW6ZOtiqK2IxVBmEG/7KP5qijW5APONrqcTM9BNKBiH5L27PFFfln6+T2nVup9qlw+Qjx1OcGkNwMigqa/xkneEvLg5SgEnsXbdxtOb4j64rhMceZuZLPaxwRbh+8Uo2WmVeJCgyrm1cwv6a6neeH4G8tgEKvB2HNLj6ipxK5hWOTVljnr+GsU7kgWKBUJ7qnq8loZJ3/Ul/H5i6pPF6ZcxY8Aixg211yXeG0iBwxv2w3i6IQiZGmnrw5DwPSEmvqCQhND6pfvvnk52cvrqfm6e7wzBjCQJV3d1oIRCAIzwUJy3ix/Lp+WreAg+uXdu0ISmeD0uIgTo8o/CC1L1bOXUw2vN5bnceQ7cKOxGoHvPPFx6U9LioJxU4DktocpuyEfhg00HWL1Ew4utnZXn6NrN1OlJYnj1LZi+UTwwi1QDIcarmvSHG1B9gGeEppHcnI2MDt4soRVtvWmgyMBKcwz82hHdXKgLryBEWcBnlMnr+CrOOZE4p85MAKTV98Kmya3rJKEI34IqD6VrfNAUFhFZW9OO5HYn1wq+VR2G+lak6YKwtTPaB2VyeaDPsknkY3uXd+nRmOu5flTCSMYXJ8496IV6+TzEJU9ON4Ia+SmsIWvFuzadN67pwe4ynMFxsHuO/QKUGow39x8y5F+UMTruCJ74LEuiL4vibH7HgBo=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ga6sW23p58qgW5MkfZrNzhftNChf69D2i2hrt0f9s61raUMiay2P75GkgbxRA9w+1/6yqmlsDK7DdSzrECOyGffa1AuJ1VqP3+XCAU1yGQJsRZ9AI8PcWsbr4QHX/1LTY2Y1+Jf+g0PbYSlC0TC9DZOS+lRI9UXOoR9e1MNLJv25zZGKpYWtGmUCzlF9GepRV05Leaq6EHhJBG2lTVRJpI5qVNlGOHZTMH2OPa2Amewz3hhjAUIcaP3j0WC6ED6vECZGpXhePpkNJ6ZOT8GwBL3ThUHa8NlOGtUOQdBTBxRRHQKV+qDC66ZZvVGzvZsjAVPub1HGrUgbbNlJivzOfuYlDSjKCUBjtm3tHEN56Glq4BWXajFdLHZchGR+SxBlLH/+9xwkVWdqBbe3Az/mi5Bw47yDxclacuYY80uv+eEujLak5zv/pmfKY3zJdqVw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:31.8497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b2315d-c870-463a-2c03-08dea6015124
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6151
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19885

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under dynamic-layers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


