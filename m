Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF6BCD13D3
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:13 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14114.1777476190988559011
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OdFKY2dC;
 spf=pass (domain: ti.com, ip: 52.101.85.65, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjPiZtO4cyiYE82VDAOtwe2OzJeZgpCB24902SRdf2eTAA2AK4HwTQfuEI7M5DLJv2p/2gO2fHEYO/ir1uEYXgDp2fYAwdzXqz3AvaCvh+erblme0lYY3BUdzJ9QIU2B4R5gb+z9e/AKRe+/Axno9JGrIIFguERaN9XYXZIpdtcu4XAvftwN9WJ/dMUNK6PZkdvhFxSo0uXoJZR4M3tGelO602NZYryY+V/gP9JUOtHBl1mNsSdzu1VvtP43UKxBs82VefX8QFjbBtjfq5OcEgUUBuK1tkJqK/RPAExzWYv9cdMYhRZgKXa6re6x/tYAgUtSHr6oVKu4U9Ru6sUwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFmHiUTPu7gZ1YCDQNjDgF8oJDzdE+NMlfxdN90gtdg=;
 b=GuOTRmoMG4yXQeqVHFNaZOBfKA58iOLwDzWnk9lk6DmU6zrKf122vmKRMhKEvxtVGc4MHxr7vP7f/TyVjYQSDRFj7kHbYeWh4UpzEPPM/RV+/oGgrXQZlrP4lVv10WUANR0p85fylAzJY5c95hJcfBGsAiyUPvNTQVYuH9hKusoNFBtq6qeFag+aSZ5XAcQFsDny9CKy0tY34rMkIQqtX1IkQjUKAQoTvZv/4TgA5+2y6vHFEjKeuRaoMjmV6Q6SrGdTE4smeCCwA7VAu3WjSL40FCF4XNDfqh7DWmUc9HGlY557sqks1B5sqhvJp2mzlR0xd/1dgEgF548sjl/mNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFmHiUTPu7gZ1YCDQNjDgF8oJDzdE+NMlfxdN90gtdg=;
 b=OdFKY2dCr9o6seIack506yirHkkmLl3TmZhM/k7zYkXbJC3rEbLT/ZzNo2++fT80ua9iNmHVzWUl4LP7hkvuGTtT6bzphYBgtZ1xCrAD0TV8b4IJnf3+qBWm4RWAxQDTz21XzBCF+pSf2GMDq5m4A2O2646D6t0+VBg/QL+uV+8=
Received: from MN0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:52c::22)
 by DS4PR10MB997573.namprd10.prod.outlook.com (2603:10b6:8:31a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:23:08 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:52c:cafe::b7) by MN0PR05CA0022.outlook.office365.com
 (2603:10b6:208:52c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.20 via Frontend Transport; Wed,
 29 Apr 2026 15:23:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:08 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0eL3353828;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sV-2tIM;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 09/12] meta-ti-test: Import the recipes-support recipes
Date: Wed, 29 Apr 2026 10:22:57 -0500
Message-ID: <20260429152300.979685-9-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DS4PR10MB997573:EE_
X-MS-Office365-Filtering-Correlation-Id: 666f97d4-bb71-4c4d-3588-08dea60337dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|20052099010|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	C0oBgtas2ZysN42A3i2l3cYztrKFDk8jlXw6U13DzSdR55ArcG1CLXjQMV+1wZmj8zx6/w6cEQsQQRF6h7vhLa81BEerwNdbz7m8dHYR+6O5XayfrKn0RQLs2leL7NI5cX/Y22mDbcXLBjtshkNPGT5wRN+ekPMw/3BZucwoCnVwr+4QBp1XahiHrmEpSUi2q9dWzbw9og2q8chLg+SvwoFKdLiOCb4aK5Zwk+4YOQ9ttHxJrbp2Al3gSXG032iq06jEL7q6+30dSjGeqUyfYRPziG9TRdJP+xjO8Z/dwc5WtkqQfDry4NMHpjOdiKzc6vrHEwroN0B9l/J263VSdJgsGRxjA3B9p4jTOvkubZUGiZhuzVatrvP+oDQSAYlei+arEjiXPWB6rI7hkWgE5kwI1uOVdcTmF9SwdEc8DoZ6gkXYhg6CVcwtce6QmffH9zVa+0UIEGIg/jD21O9YoKAzU/ZJonI4vKv00YpB5wgObeRcMyBsSqN9R8l907VLchJhYrU7Gx/enoYlLcMGBsM/Eu34hM26ZPh/uh5gvaNsWm3ub9ai5Yva1cHfUuMk7e6/YcUZoUOEOiWr8qrc82Nia/CkW09bPyu2HwjYL4o7KG0m46pYYUu92+l5cYTFzRLLiKK00sWzI4RyO77sFDrJNbmuXEYB4/0clq9zuFMJUIK47qO1U+WwNskUcU7MBm+QwwJxr+uzI6vj1QGrgYrChWMhD1BmyS2t3wCF3/X8XIWld2swKOw0R5pxr0Hwy+rZnJHbfeuJy8j7N0D+joaGol2tyjEA6XyyptdZLPI=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(20052099010)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CtiuP7omdMo32nI66t5+Wy6TQYBNXYUdBm6f+Tlg5U0arhz7SSPPL7a2dmXPqEGZ70dDv2WXN0iZgpUUd1Ji+2yit7zemJRPjFhhyhyTSlA/wk4FRs1ukCO/qsaWJLKHqUM0Wmn6zPeAISbWFoQMFz2cRXDGhQVErh9CgldtR7t972svsox77i2cPbN1LJbUjZ3w3sVGH+/bGTlmvP2kL05fWko8NaO84I/ZFJP9aexIIL4zOh/mGN6m+MAFjUjbbJ+nCET0xP3tz3Ct/tOJ2dMX9BSwzLI2yrYfaEJTWo8LuOfRZV7J+Ulcs0j6VjDCLRO7/jXsHWJf6x546fOSWPzJIFBoH0NeUnD5n6o9s3yqWyJ+n407iYjZrcUobTvv8JBBC5+rPNFo3iRMHvtfWhit58ePQe3MfiRTgkfj0GluJsixoP0w53oYfGunTliC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:08.4365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 666f97d4-bb71-4c4d-3588-08dea60337dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997573
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19895

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-support.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

 ...0001-configure-skip-toolchain-checks.patch | 44 ++++++++++++++++
 ...issing-prefix-map-settings-for-OE-bu.patch | 40 +++++++++++++++
 ...0001-xdpsock-Fix-32bit-compile-error.patch | 42 +++++++++++++++
 ...-not-detect-libbpf-header-from-sysro.patch | 44 ++++++++++++++++
 .../0003-Makefile-fix-KeyError-failure.patch  | 31 +++++++++++
 .../0004-Makefile-fix-libxdp.pc-error.patch   | 34 +++++++++++++
 .../xdp-tools/xdp-tools-ti_1.6.1.bb           | 51 +++++++++++++++++++
 7 files changed, 286 insertions(+)
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/000=
1-configure-skip-toolchain-checks.patch
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/000=
1-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/000=
1-xdpsock-Fix-32bit-compile-error.patch
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/000=
2-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/000=
3-Makefile-fix-KeyError-failure.patch
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/000=
4-Makefile-fix-libxdp.pc-error.patch
 create mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6=
.1.bb

diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-confi=
gure-skip-toolchain-checks.patch b/meta-ti-test/recipes-support/xdp-tools/x=
dp-tools-ti/0001-configure-skip-toolchain-checks.patch
new file mode 100644
index 00000000..b5f2780e
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-configure-sk=
ip-toolchain-checks.patch
@@ -0,0 +1,44 @@
+From 9c9dce2e5f04de65b7b00321f96fff6071546ea1 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 15:44:16 +0800
+Subject: [PATCH] configure: skip toolchain checks
+
+Current logic fetch full command line along with the tool. i.e
+gcc -m64 -march=3Dskylake -mtune=3Dgeneric ...
+
+Which throws ERROR: Cannot find tool -m64
+
+So need to re-write for loop, so it can work in cross-compilation
+environment too.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
+---
+ configure | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index b4e824f..10618fc 100755
+--- a/configure
++++ b/configure
+@@ -70,12 +70,12 @@ check_toolchain()
+
+     CLANG=3D$(find_tool clang "$CLANG")
+=20
+-    for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
+-        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
+-            echo "*** ERROR: Cannot find tool ${TOOL}" ;
+-            exit 1;
+-        fi;
+-    done
++    #for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
++    #    if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
++    #        echo "*** ERROR: Cannot find tool ${TOOL}" ;
++    #        exit 1;
++    #    fi;
++    #done
+=20
+     ARCH_NAME=3D$($CC -print-multiarch 2>/dev/null)
+=20
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-defin=
es.mk-Add-missing-prefix-map-settings-for-OE-bu.patch b/meta-ti-test/recipe=
s-support/xdp-tools/xdp-tools-ti/0001-defines.mk-Add-missing-prefix-map-set=
tings-for-OE-bu.patch
new file mode 100644
index 00000000..faaf6bc2
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-defines.mk-A=
dd-missing-prefix-map-settings-for-OE-bu.patch
@@ -0,0 +1,40 @@
+From a7698c7172a8a178efd73bdc0ce31d4aa3646f6e Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 5 May 2025 14:30:10 -0500
+Subject: [PATCH] defines.mk: Add missing prefix-map settings for OE builds
+
+The defines was only pulling in one of the four *-prefix-map options
+from CFLAGS.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/defines.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/defines.mk b/lib/defines.mk
+index 411a97e..6061e81 100644
+--- a/lib/defines.mk
++++ b/lib/defines.mk
+@@ -26,7 +26,7 @@ TEST_DIR =3D $(LIB_DIR)/testing
+ LIBXDP_DIR :=3D $(LIB_DIR)/libxdp
+ LIBBPF_DIR :=3D $(LIB_DIR)/libbpf
+=20
+-DEFINES :=3D -DBPF_DIR_MNT=3D\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=3D\"$(B=
PF_OBJECT_DIR)\" \
++DEFINES :=3D -DBPF_DIR_MNT=3D\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=3D\"$(O=
E_BPF_OBJECT_DIR)\" \
+ 	-DMAX_DISPATCHER_ACTIONS=3D$(MAX_DISPATCHER_ACTIONS) -DTOOLS_VERSION=3D\=
"$(TOOLS_VERSION)\" \
+ 	-DLIBBPF_VERSION=3D\"$(LIBBPF_VERSION)\" -DRUNDIR=3D\"$(RUNDIR)\"
+=20
+@@ -43,7 +43,7 @@ endif
+ DEFINES +=3D -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
+=20
+ CFLAGS +=3D -std=3Dgnu11 -Wextra -Werror $(DEFINES) $(ARCH_INCLUDES)
+-BPF_CFLAGS +=3D $(DEFINES) $(filter -ffile-prefix-map=3D%,$(CFLAGS)) $(fi=
lter -I%,$(CFLAGS)) $(ARCH_INCLUDES)
++BPF_CFLAGS +=3D $(DEFINES) $(filter -fcoverage-prefix-map=3D%,$(CFLAGS)) =
$(filter -fdebug-prefix-map=3D%,$(CFLAGS)) $(filter -ffile-prefix-map=3D%,$=
(CFLAGS)) $(filter -fmacro-prefix-map=3D%,$(CFLAGS)) $(filter -I%,$(CFLAGS)=
) $(ARCH_INCLUDES)
+=20
+ CONFIGMK :=3D $(LIB_DIR)/../config.mk
+ LIBMK :=3D Makefile $(CONFIGMK) $(LIB_DIR)/defines.mk $(LIB_DIR)/common.m=
k $(LIB_DIR)/../version.mk
+--=20
+2.17.1
+
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-xdpso=
ck-Fix-32bit-compile-error.patch b/meta-ti-test/recipes-support/xdp-tools/x=
dp-tools-ti/0001-xdpsock-Fix-32bit-compile-error.patch
new file mode 100644
index 00000000..da439bf1
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-xdpsock-Fix-=
32bit-compile-error.patch
@@ -0,0 +1,42 @@
+From 9b649be4876a3e42c44e57013840904006530e52 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Tue, 17 Feb 2026 15:11:18 -0600
+Subject: [PATCH] xdpsock: Fix 32bit compile error
+
+Using UINT64_MAX on a 32bit machine results in a compile error where
+unsigned long cannot be cast to an unsigned long long.  Since this is
+trying to handle an error case and return a big number, switch to
+ULONG_MAX to match the type being returned regardless of the compiler
+bits (32/64).
+
+Upstream-Status: Submitted [https://github.com/xdp-project/xdp-tools/pull/=
553]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/util/xdpsock.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/util/xdpsock.c b/lib/util/xdpsock.c
+index 5d71e6a..899c3a3 100644
+--- a/lib/util/xdpsock.c
++++ b/lib/util/xdpsock.c
+@@ -35,6 +35,7 @@
+ #include <time.h>
+ #include <unistd.h>
+ #include <sched.h>
++#include <limits.h>
+=20
+ #include <xdp/xsk.h>
+ #include <xdp/libxdp.h>
+@@ -171,7 +172,7 @@ static unsigned long get_nsecs(clockid_t clock)
+ 	res =3D clock_gettime(clock, &ts);
+ 	if (res < 0) {
+ 		pr_warn("Error with gettimeofday! (%i)\n", res);
+-		return UINT64_MAX;
++		return ULONG_MAX;
+ 	}
+ 	return ts.tv_sec * 1000000000UL + ts.tv_nsec;
+ }
+--=20
+2.43.0
+
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0002-Makef=
ile-It-does-not-detect-libbpf-header-from-sysro.patch b/meta-ti-test/recipe=
s-support/xdp-tools/xdp-tools-ti/0002-Makefile-It-does-not-detect-libbpf-he=
ader-from-sysro.patch
new file mode 100644
index 00000000..df1543c7
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0002-Makefile-It-=
does-not-detect-libbpf-header-from-sysro.patch
@@ -0,0 +1,44 @@
+From 2840cf0b89497f545fae2eed7ece3f3c5fc558e3 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 15:50:34 +0800
+Subject: [PATCH 2/4] Makefile: It does not detect libbpf header from sysro=
ot
+
+So adding sysroot headers path.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/common.mk       | 2 +-
+ lib/libxdp/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/common.mk b/lib/common.mk
+index 56c0406..ab0bad8 100644
+--- a/lib/common.mk
++++ b/lib/common.mk
+@@ -55,7 +55,7 @@ LIBXDP_SOURCES :=3D $(wildcard $(LIBXDP_DIR)/*.[ch] $(LI=
BXDP_DIR)/*.in)
+ KERN_USER_H ?=3D $(wildcard common_kern_user.h)
+=20
+ CFLAGS +=3D -I$(HEADER_DIR) -I$(LIB_DIR)/util $(ARCH_INCLUDES)
+-BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES)
++BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
+=20
+ BPF_HEADERS :=3D $(wildcard $(HEADER_DIR)/bpf/*.h) $(wildcard $(HEADER_DI=
R)/xdp/*.h)
+=20
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 358b751..8f459d8 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -28,7 +28,7 @@ PC_FILE :=3D $(OBJDIR)/libxdp.pc
+ TEMPLATED_SOURCES :=3D xdp-dispatcher.c
+=20
+ CFLAGS +=3D -I$(HEADER_DIR)
+-BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES)
++BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
+=20
+=20
+ ifndef BUILD_STATIC_ONLY
+--=20
+2.25.1
+
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0003-Makef=
ile-fix-KeyError-failure.patch b/meta-ti-test/recipes-support/xdp-tools/xdp=
-tools-ti/0003-Makefile-fix-KeyError-failure.patch
new file mode 100644
index 00000000..d0133bcb
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0003-Makefile-fix=
-KeyError-failure.patch
@@ -0,0 +1,31 @@
+From 157546fbc4f18751c52b3c8788879c05cf253331 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 16:02:46 +0800
+Subject: [PATCH 3/4] Makefile: fix KeyError failure
+
+Error:
+Exception: KeyError: 'getpwuid(): uid not found: 11857215'
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/libxdp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 8f459d8..9a340a3 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -54,7 +54,7 @@ install: all
+ 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
+ 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
+-	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
++	$(Q)cp -fpR --no-preserve=3Downership $(SHARED_LIBS) $(STATIC_LIBS) $(DE=
STDIR)$(LIBDIR)
+ 	$(Q)install -m 0644 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
+ 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/m=
an3)
+--=20
+2.25.1
+
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0004-Makef=
ile-fix-libxdp.pc-error.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-=
tools-ti/0004-Makefile-fix-libxdp.pc-error.patch
new file mode 100644
index 00000000..b1e15e52
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0004-Makefile-fix=
-libxdp.pc-error.patch
@@ -0,0 +1,34 @@
+From 46b3ff797135574aa0ee42f633a281d44f48da95 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 16:05:15 +0800
+Subject: [PATCH 4/4] Makefile: fix libxdp.pc error
+
+Error:
+do_populate_sysroot: QA Issue: libxdp.pc failed sanity test (tmpdir) in
+path ... xdp-tools/1.2.8-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/libxdp/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 9a340a3..bc39177 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -76,8 +76,8 @@ $(OBJDIR)/libxdp.so.$(LIBXDP_VERSION): $(SHARED_OBJS)
+ 		      $^ $(LDFLAGS) $(LDLIBS) -o $@
+=20
+ $(OBJDIR)/libxdp.pc:
+-	$(Q)sed -e "s|@PREFIX@|$(PREFIX)|" \
+-			-e "s|@LIBDIR@|$(LIBDIR)|" \
++	$(Q)sed -e "s|@PREFIX@|$(prefix)|" \
++			-e "s|@LIBDIR@|$(libdir)|" \
+ 			-e "s|@VERSION@|$(TOOLS_VERSION)|" \
+ 			< libxdp.pc.template > $@
+=20
+--=20
+2.25.1
+
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb b=
/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
new file mode 100644
index 00000000..e25ae146
--- /dev/null
+++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
@@ -0,0 +1,51 @@
+SUMMARY =3D "Utilities and example programs for use with XDP"
+HOMEPAGE =3D "https://github.com/xdp-project/xdp-tools"
+LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9ee53f8d06bbdb4c11b1557ecc4f8cd=
5 \
+                    file://LICENSES/GPL-2.0;md5=3D994331978b428511800bfbd1=
7eea3001 \
+                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50=
909238dbd \
+                    file://LICENSES/BSD-2-Clause;md5=3D5d6306d1b08f8df6231=
78dfd81880927"
+
+DEPENDS +=3D " libbpf zlib elfutils libpcap"
+DEPENDS +=3D " clang-cross-${TARGET_ARCH} bpftool-native"
+
+SRC_URI =3D "git://github.com/xdp-project/xdp-tools.git;protocol=3Dhttps;b=
ranch=3Dmain \
+            file://0001-configure-skip-toolchain-checks.patch \
+            file://0002-Makefile-It-does-not-detect-libbpf-header-from-sys=
ro.patch \
+            file://0003-Makefile-fix-KeyError-failure.patch \
+            file://0004-Makefile-fix-libxdp.pc-error.patch \
+            file://0001-defines.mk-Add-missing-prefix-map-settings-for-OE-=
bu.patch \
+            file://0001-xdpsock-Fix-32bit-compile-error.patch \
+          "
+
+SRCREV =3D "84906a0fe98cbb5e5eaa2c888c50a1ab32d5d0b7"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE +=3D " PREFIX=3D${D}${prefix} LIBDIR=3D${D}${libdir} BUILD_ST=
ATIC_ONLY=3D1 PRODUCTION=3D1 V=3D1"
+EXTRA_OEMAKE +=3D " OE_BPF_OBJECT_DIR=3D${libdir}/bpf"
+EXTRA_OEMAKE +=3D " CLANG=3D"${TARGET_PREFIX}clang --sysroot=3D${RECIPE_SY=
SROOT}""
+
+CFLAGS +=3D "-fPIC"
+
+export STAGING_INCDIR
+
+do_compile:prepend:aarch64 () {
+    mkdir -p ${S}/headers/asm
+    cp ${RECIPE_SYSROOT}/usr/include/asm/bitsperlong-64.h ${S}/headers/asm=
/bitsperlong-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/byteorder-64.h ${S}/headers/asm/b=
yteorder-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/posix_types-64.h ${S}/headers/asm=
/posix_types-32.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/swab-64.h ${S}/headers/asm/swab-3=
2.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm/types-64.h ${S}/headers/asm/types=
-32.h
+}
+
+do_install() {
+    oe_runmake install
+}
+
+FILES:${PN} +=3D "${datadir}/xdp-tools/* \
+                ${nonarch_base_libdir}/bpf/* \
+               "
+
+RDEPENDS:${PN} +=3D "bash"
+
--=20
2.43.0


