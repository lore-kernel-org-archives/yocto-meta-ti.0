Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8268CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:29:59 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14490.1780471792352625312
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 00:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=V7Vy+4wx;
 spf=pass (domain: ti.com, ip: 40.93.198.17, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHHhIHKKzNScV1HD8uD52JLnTBZBCbIMGSBAxokuXKe2YGFfjvlp9jm+UoeRsyIEeErFzcoqp+PLqx1OthQoEE9yIMhksX9smS8CzgAEvrtIzE0O6vteSFffIhF46qtKRIQiNkU3fW5gY/wVUODfGe4jtx6dI3vzAjh/r/XJ6U/y+VaqllyBHLjtZBp3DpaLuVxVlQYSXm6WwiTLNdDefOvqzbOMbo2ZJ4Jz+n4UQ/9aGi/4DDqmCK91SK+j85E2f7TI5sAveWwBkBlgSS85AvYUQh9DP9ym2UV5pAjykgIX019ER8fOcDxIE4fMa5TIIi5F5rFxnJGtAE88mrL8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnguubD8lCMl0dbPuJ5LeWrgRMcD+kVMBZcX/eYOPdo=;
 b=ybxUwuOrEkw1t4qsykT35VjUg/VKs6IX2bUu/C+gFtJcdtLkZRHxIC9QCxiURDVqqJW518tyc8qOgdDU5/bBNwHLYvVHoxKhSVEJlCIzSEY3nqiGnQE18daV/64WT6NjVWVXPZrg+GV6eQ1T0lAmA8SeB0ERzIrSRN14IgZlAPaBNdP6kFJTYz1aqIXvU6M5OwaRHmIr5JaFgyZtNIhCBDWZh+gOupvUvG1wYqOtGoyny7sYBFZ6zpN/JZgbXYdsMBtvnyT9c1IZ3lQNPNhUppYncMLTDz4A+7NB1YuaK4rb3IoEXemyUwua1n4h0rgD0bOcVsu17s0P1jDdUK62Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnguubD8lCMl0dbPuJ5LeWrgRMcD+kVMBZcX/eYOPdo=;
 b=V7Vy+4wx5nq4WY8nd0DcK2aaTELuCjMNmLFXaMOOJ+LmCkEtMRjGAKnBq8QtwEVKZHa/uTVMnPtvQB3TE5LYvlmEqUpNaIJnOuQDfC2NghOysCDoL7PMa/Kkxd17lwlgmiA63Kq1kFV6ZTmE31hiNwA2/26i4D//lGfkRwTQFaI=
Received: from SJ0PR03CA0120.namprd03.prod.outlook.com (2603:10b6:a03:333::35)
 by CY5PR10MB5939.namprd10.prod.outlook.com (2603:10b6:930:e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 07:29:50 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::75) by SJ0PR03CA0120.outlook.office365.com
 (2603:10b6:a03:333::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Wed, 3
 Jun 2026 07:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 07:29:50 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:29:42 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:29:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 02:29:42 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6537TWbX737025;
	Wed, 3 Jun 2026 02:29:39 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH v2 2/2] initramfs: Add initramfs-module-netsetup recipe for DHCP network configuration
Date: Wed, 3 Jun 2026 12:59:32 +0530
Message-ID: <20260603072932.1273938-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603072932.1273938-1-m-shah@ti.com>
References: <20260603072932.1273938-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|CY5PR10MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 3400acd8-c203-405a-c117-08dec141e5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	UyLLz9eCLtgCKWCoDI+WzTYkff2CBEZEwWFOlVmXHz6H2Dh91kh2trukIgLElRtSPwtcA92fHl6LKqLxtxfJNhC74ZGQOpaTPIZbcGS/4yBgNI99EKPaJEw00Www/lMCY06Uc5wRKMn92pAfII3I9Jef8NDU4oLlBXGu46nTC1EH0ASkDMf8qXR88LYD/KtJEEXWruWm29LaHfVDdLeFNKn2eplXptr+Vjz4UaWlOQbX429Uv/qanSgKayrPAyt2OV+mdWvzHoU+mpRMB8DMnNAg6FizhH3qPvNe45VIJJDNLXESbPzCZqE2931YRoBZSMkKv8Lh7UpgUBb8o6QdR5MCYud9qtm8Zd/Vs7v4xBxTxIB7C5fhetkWkVJ6jGiR9F9lPyOIgwXNUFonk9LZOuqkBRau3PtkxAowqOQUlQy3w5QnvBldJ6vqVUSTOQsNVNBSHQHj1pdmOY9NPWOYmvgPT9PtnfCKvmZXytWERPKXu9W+DH04CgM5vOw2tCpwXmENt5DxdTY0FRa9puL+R6N8YVxhjZsUeXEXRFrnRy4+hscwP78c+jhbJ1MN1jUfXmTobMda0V+6l+grT3w65T4Zg1ErxGkEC94bLgvMlP+oAQV2wUWqfG1ipRokUdKJ6J+dy/TZVp/C0aMsNF2xKt5hGhaZG7GiI/Z1n7qeWYmoG2AZXExuBG3YWQPbG9VlsTGn8MiUePzNRzvQjaW/XU3r4pc/nUhf+C12zjG6sX8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SMl59Gak4lXD0zzrziV+DCGLwMo167KGfLZSKzwgBRv68+FymeaMXDDj+cictfVVF2buU9AmVf4CwP9mrl+7GRpRZcIEKtjQ6Rb4hasu+Y7DwbFVa4ou+4cPdeWsvjiHWGqJGW0IzTGMG30SzxsnUW4H7L+s+bmgZ1DBz1bDgn3dAh6cufYWBnDfeSL3pvDaxN3MpR7/bqXoAE7D5dz+E7l8Lc0BO7R5be40yAqKJEJiiEjB/xtbXUFpsmMwE9PHXk89m3AgErFxkltMeOg65WZNdXCoWOSup+9fngqrvihbRriVWZR4UV157Wy2aJiGy8nGGTO88ZU49YMyn+k5GCj27v1XCQZcTcNZEZv/XktmqiOEY7Jb1CmbD0rDhlM+ef9cjZHvAAURGMQ8Fo9sfwFifF0BcxCdWIW1l9aaf8/2wutnqJQzApPjxDCTVbJ4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:29:50.2374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3400acd8-c203-405a-c117-08dec141e5b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5939
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19958

Add a standalone initramfs-module-netsetup recipe that installs 83-netsetup=
,
an initramfs-framework module that configures the network interface via DHC=
P
before the NFS root mount. Needed when the Ethernet driver is a loadable
module and the deferred probe chain requires time to settle after udev load=
s
the modules. Add initramfs-module-netsetup to packagegroup-ti-core-initramf=
s
to pull it into the initramfs image.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 24 +++++++++
 .../packagegroup-ti-core-initramfs.bb         |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-=
netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-ne=
tsetup
new file mode 100644
index 00000000..b71bc3b3
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetu=
p
@@ -0,0 +1,54 @@
+#!/bin/sh
+# Configure network via DHCP before NFS root mount. Polls for an Ethernet
+# interface with sleep 1 per iteration to allow the Ethernet driver deferr=
ed
+# probe chain to settle after udev loads the modules.
+
+netsetup_enabled() {
+    [ "${bootparam_root}" =3D "/dev/nfs" ] || return 1
+    return 0
+}
+
+netsetup_run() {
+    local iface timeout devtype
+
+    # Extract interface from ip=3D kernel param (format: client:server:gw:=
mask:host:device:autoconf)
+    iface=3D""
+    case "${bootparam_ip}" in
+        dhcp|on|any|"")
+            ;;
+        *)
+            iface=3D$(echo "${bootparam_ip}" | cut -d: -f6)
+            ;;
+    esac
+
+    udevadm trigger --action=3Dadd --subsystem-match=3Dnet
+    udevadm settle --timeout=3D10
+
+    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER =3D ty=
pe 1).
+    msg "netsetup: waiting for ethernet interface..."
+    timeout=3D60
+    while [ "${timeout}" -gt 0 ]; do
+        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
+            break
+        fi
+        for dev in /sys/class/net/*; do
+            [ -f "${dev}/type" ] || continue
+            devtype=3D$(cat "${dev}/type")
+            [ "${devtype}" =3D "1" ] || continue
+            iface=3D$(basename "${dev}")
+            break
+        done
+        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
+        sleep 1
+        timeout=3D$((timeout - 1))
+    done
+
+    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
+        msg "netsetup: no ethernet interface found after 60s, skipping DHC=
P"
+        return
+    fi
+
+    msg "netsetup: configuring ${iface} via DHCP"
+
+    dhcpcd --waitip "${iface}"
+}
diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0=
.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
new file mode 100644
index 00000000..a4565a25
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "initramfs support for DHCP network configuration before NFS r=
oot mount"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI =3D "file://83-netsetup"
+
+S =3D "${UNPACKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
+}
+
+FILES:${PN} =3D "/init.d/83-netsetup"
+
+RDEPENDS:${PN} =3D "\
+    initramfs-framework-base \
+    dhcpcd \
+"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..2e68366d 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN} +=3D "\
     base-files \
     base-passwd \
     initramfs-framework-base \
+    initramfs-module-netsetup \
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
--=20
2.34.1


