Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2604DCD13DA
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:47 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.834.1777481085158174033
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sqz+dBso;
 spf=pass (domain: ti.com, ip: 40.93.194.11, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccwY6AbGWplvRXuS21ap9puuXScUQJqbsom1NH5wNO+7ivi3hY97XYKBfbqFAyyMDXyrbu6UEOlXl6Rr3rk6mXOYjeSZH6VYsaYp2u+lCxhAbj7Q+ecJsHA58TLn640Qmryvo32MetCIWIw1BbDvMR81va+yMrB4zRWtzgBdwntqAbfhWJXJ7/cCstRwgnKQH3lTCBXQB5MiTbiMq7UN+xiIl/jNGW8PCPHx3etPL18Vky4Cq44Gv/LomaETb8ts5XNLUfKdCNkOW9td0RrzgfGywhqROBoIMYnlZGa3y3b/3gcUSc1QFcjL6e10sSexOodv7NbCRtQqDDiqdMwsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rcde/nfBv3cI7NiNT5hjfe8DcoN/NC4sThrKrXGQ4hs=;
 b=jJfKPoZ4aju9i3sRbvAZ7VWjpagzLvagbk6sZfrn2hvZfs2nCN3BW+Srkt0Qso7oyi1/CG0CDeTB0dwcbg8Do0ClS2HTld0S3BIyCR+GJ9npLEQ/2TM0jXzeupWvOmEzdqrSUweVbssAEOvSrUrWdirWDl9reBJjO/UCAQc3aQRi44n+OO3cc1vDjwbRz26xM9CvYMWM6LCbNadclQxzhChFZsOeYlB2uK+LLG3RYYmWDqm2LetpNidArGEKQzolkPCMb4bdVG7Myrug7n4Yfjuq85dUAdmSbE9Z75yznkLy5IgyokHPIx5wSrPfktMaKVywPNQ1ZLGvw6RvJ4EbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rcde/nfBv3cI7NiNT5hjfe8DcoN/NC4sThrKrXGQ4hs=;
 b=sqz+dBsoPMIlAnf/4j174V4nOjsmkef0WDwmfAsZcor4NR2sedrXk+b+6atSJV2OklvyU96uM7/Cjh4prONs2FlEfXZBhPa9Wzpls+0KFzdNBrx7Z6HStppn34eaN9L53UqZRf4xyXaKPw2LkexQkHASiI/qbvgV5X+rM3oRz+c=
Received: from DS0PR17CA0001.namprd17.prod.outlook.com (2603:10b6:8:191::19)
 by CH3PR10MB7701.namprd10.prod.outlook.com (2603:10b6:610:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.28; Wed, 29 Apr
 2026 16:44:39 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::80) by DS0PR17CA0001.outlook.office365.com
 (2603:10b6:8:191::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:37 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:33 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWpL3487249;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oO8-3H0n;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 09/12] meta-ti-test: Import the recipes-support recipes
Date: Wed, 29 Apr 2026 11:44:29 -0500
Message-ID: <20260429164432.1623594-9-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|CH3PR10MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d43e74-8af8-4544-3101-08dea60e99fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|20052099010|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Z50u+CoIfNY/4UYy8/UcmmjG5Di+JdlAA179BWK1S3OAcc0TmSAlEye6h3Yfhb/UQyPQt9Rn8ixPtD0UAtsR8THWPPF9NN4cljGq6BQJKcSQaLc5fc6Q4Q83cIpDDldYiokiJYEQOt4PvuxiHBinmHyKk9dDKQmChV6VyDwDLtFHpCn9g5b8av9I5902Lk0Zp0eG5Ad1SSGawgr1jj5dFoUtMUP+a0OtZNeo06l/f/aa/DaWjFvRxW2nYeg7up07Y3APWo2KELBqmpyIOoogqSv9ntQ3gcV0xeJNc3xY1Fmos7woKcd4Z8xBhy35NvwjzQuXIyH5ZPPGeSbAT/lBZtsrvq4mGnTs/ZpMF0xd4fbF7HJSZypFAo8B2akDpVGObctSdkrXY4/FR7oLfvzmXvc58RNY/5LNJPEGhA+qhikIFnlzNzswEZ7o7CfxFaoacP8GHhpv9p6/B6RnB782vC7helD7kS94CX9Qwke4qqdeJWX+f0RjSbGdZuIqSb9F5VGmf/lSUCDubNK+ZIzxpbzCnetfNGEnjYWHQRFZYAKhKo+yRm+ETwXVNcfDoEgI99VeK6xa1t+okAkaeUoXopj20wPGxhNmnKqJyHdBDw9HCpVfuZx0mcIY8z6zSgHicVt0QcGB7h4Dvpnv7j2XO7G/CS4E9gbNSz/gNa8/gzHhHXtT9CdMjoGxPqo3E8meG+nSzIGvQw816fZEQeyOB5yfoD0UULshHE1v0yafb6oYgTtUk3dWG40BdcbwhTGHbMFUgVGSDceNNR7INHbecGq46NHtr1xau/28KuzyL5o=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(20052099010)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tXPIHbme/tsmK+51lWxQH3+VRfp3SGRg7JS06xAgGTu9VEjobPHkVdU1yhGvfl1+QfFauYXimbwKJwBjtvJRYyw88E+LueW/k3WzzMDBLmJSB4Q9g25/LRqvH3W1P9TQLW/P9tNdTHUhEjSTCJcJoyt5O3m7BKEehoFr5Qn0OKjGPHPR0jdGBt6affiYwP/nuG0z43zYT2FkxEnnly7d3QI8Z+ml4/bh+2CMWuSDRkdqLifxjUGgkuzP4xTysbr6zIe/XWH1AL57iJYoAYOWdz/HXJzYY34Nyh7YG8+3OH73i34s51/nWdOFGFAc/VllQThiLdGMay85qKbrUXHNBJSknmn1sdyftS/AWX+j7bNj3YwVlHlPAite0Qbg7DLhirTTjk5gamm14cZ1PgSba0Ke4q+yAL+DFbKrVY5tivSW77PoKHOH1vnO5i/v0rqc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:37.5539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d43e74-8af8-4544-3101-08dea60e99fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7701
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19913

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-support.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
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


