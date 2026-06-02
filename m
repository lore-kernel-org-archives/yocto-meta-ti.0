Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB19BCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:48:35 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21951.1780397311839459811
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 03:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DLSJjsKJ;
 spf=pass (domain: ti.com, ip: 52.101.52.49, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYyNuR6UsoO9HaGnm9ll6skT/FFEcfpWZ2DiuLgJYCsHnRFsH22fEezV+vKJMnca/f6QMo2hfFuJeSI1RXkkZqM1OPlEBNT3lpMPqyEMtR9Q4XDRAa1JA8h91XCz3edZFfOjwBcEyMh4oQ+SgVIf4kyMy+uekNKyKby0jPVH8HGy0QCheUW796LdeJPVxetZqmRv0FhMNvemLsq/zUn0TIxvWboq4l7tQXIFPLuJFR7BUS2/RaOc68LRVvB20TENJjL0X8RhN5CHDY7O9TaYbSBhZHwZuxCMsozSCvr0GhkX0nmVf5u7EyzmLnoYJLGIdSrVpEF/vqNLceK09QYZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blHlCaqCpioEVWRXUXiWJx8iOH4AyTyJprXCsekHm14=;
 b=WDO0d45z+M1L50ltE0+GVo3XH+sE4cUvJG26PLk2FF0fisFnjIotPUxNcRgypE+jzY7MGPy1izGILdoFz1HyMXkWH+AJysYRvAAIuSXm6VqBXMwWgSbMiy98Abg0dFuu9dm89GSfo1Kquxrj3cOdFZPnFoTUtjKwl/R8lB/brc4/fOkKUucS2v8fKHRAFSIxKDiM7ue9c21LFOVJiy8AvY2+Vd/oKo4zobpQ5tlWuPxdB+lTnDSZby7jZVXUbJvUPG3RatN9tKappps3t8d1RG6VvlAGBQNSJfvLsXfR/6bxAmf9Oj5NtpgOQWYwGTskEUP+FOJfrR8BHoWZf4WDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blHlCaqCpioEVWRXUXiWJx8iOH4AyTyJprXCsekHm14=;
 b=DLSJjsKJF8O1PqVoCLTP2YZ0MtYLQks1rdjAgBTgCKZ6VX1PodbMVc5Y2XUoWcEwQ46ZGRY3k4H/0VBTj0ExnNYusJtB+n068YUxqRRWMzWWUYPIXjOWezlu5e1Ye8H/a6Dr+LeSW7n8UU7ZN33IML8RbPgQth2mxvPgSF1K9J8=
Received: from SJ0PR03CA0275.namprd03.prod.outlook.com (2603:10b6:a03:39e::10)
 by CY8PR10MB6825.namprd10.prod.outlook.com (2603:10b6:930:9c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 10:48:28 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::3a) by SJ0PR03CA0275.outlook.office365.com
 (2603:10b6:a03:39e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 10:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 10:48:26 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:48:20 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:48:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 05:48:20 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652AmAhY3602223;
	Tue, 2 Jun 2026 05:48:17 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH 2/2] initramfs: Add netsetup module for DHCP network configuration
Date: Tue, 2 Jun 2026 16:18:10 +0530
Message-ID: <20260602104810.1068959-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602104810.1068959-1-m-shah@ti.com>
References: <20260602104810.1068959-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|CY8PR10MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: f7459faf-1b4c-4a4e-ba91-08dec09479c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Z9zE3EBsYo2Cnnr1PMy9V+OJ9fIYGqZKyOTVxVjzdPMG4L5/bu+2P588PoYFp54EXCbFuT5aOqJgF9KBfBeZzpqa3BkwDzpb/pbe/Vyd27IyE+ojz53Lc//9m5qNMuuNQ44j0FG0+ssJr5WiCzl8rBqxLUBVgw+dD3MBRncP4R2RkxGESBsHuxoC3oogr2ccWfn5eKEbuHBsSWH1kLN9L0qaUe+AnINwm801/ZRZRmM3nxc0kxC2EBsCvc9p7zp58UTfUAmFUxjnZ9tJYiWRznV62iFoZZTmrv3Q70iSjPib152OjmC1DH056p2yHOQAgzVgLZgr13WNAtFkCk4R0bqeTG9yoKYnAw6/oPtyrAufmK1Os/s8saQHaPn9wWbK9ZGeOmVXAb/LyM1/sKfplvnBRPtnH/1XounZp40SBb9fULrZKSn8DVkRfxMUdch0XynZibJpkaXF4yQw1U9g6UwW2iCVE9MT4ygTYb+xhNHZ6djU8ACYSN+tFsnCwq/VGE7m38qeusETh2VZaSMcu6ZQHpelCghKUYdqeqyYUrg2CudnfF3G4Rn7oDfqXbMQgxynhNmPLlHDd6JqbapvDViQSN/4zLaat3BoGum7mYCRiVw19YmboniYom8+MclnWJ8VqBAvxgW9Pwa6axwWzScCzB1O/VFCE4u48IPKPmwdvBjqZ+0yp1b4Z0NWzKtboq4II687+Pk4/khMTuDgUL1h4pakSyf238SsZpCEKbk=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lyRblbFhv3tYFy1YZ/8NYaihvpxhc8SkeYJqYDG6ko2cJ5DiuJ+qiqiYj6rvrrBQFrBM4VcCLdE7MgJt0TWFT/b0Wwgu7XDJNKVJ9SxRlRGspb2r0A7tVh5mMWXApKv2WRTNzqsD4F6axy6+WSBb8qAR5nEMdHwiINkY356tBtBzQRFRD7fL0CvC2R/oHlKGUYrqTz16m/dPvFeHl082Ai6UFfEl0pMq3MTMJ9461kd2Mxqc0dL8i862EhuDlLN3/NNNCQYp7VKGQkuqNWylqDW1oJlueBTbbFpMM8oP233R3F0oBbIcbitKoX3PW66djJGpkaUwQHBTpKgDeWNmelEHasyM3ljC3AUa7l/vzPVXygkgP66LcBRpd0HBu32rfHWIJSwVqC2tiQvdYj0WmuJjNPq1/gOpcbGfbPw8gxrY5L6k1iXqHLgxDuAC8Won
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:48:26.2672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7459faf-1b4c-4a4e-ba91-08dec09479c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6825
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 10:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19947

Add 83-netsetup, an initramfs-framework module that configures the
network interface via DHCP before the NFS root mount. Needed when the
Ethernet driver is a loadable module and the deferred probe chain
requires time to settle after udev loads the modules. Also add dhcpcd
to packagegroup-ti-core-initramfs to support DHCP configuration.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs-framework/83-netsetup           | 54 +++++++++++++++++++
 .../initramfs-framework_%.bbappend            | 15 ++++++
 .../packagegroup-ti-core-initramfs.bb         |  2 +
 3 files changed, 71 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-fr=
amework/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-fr=
amework_%.bbappend

diff --git a/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework=
/83-netsetup b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framewo=
rk/83-netsetup
new file mode 100644
index 00000000..b71bc3b3
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-net=
setup
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
diff --git a/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework=
_%.bbappend b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framewor=
k_%.bbappend
new file mode 100644
index 00000000..c8955689
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbap=
pend
@@ -0,0 +1,15 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SUMMARY:initramfs-module-netsetup =3D "initramfs support for DHCP network =
setup before NFS root mount"
+
+SRC_URI:append =3D " file://83-netsetup"
+
+PACKAGES =3D+ "initramfs-module-netsetup"
+
+RDEPENDS:initramfs-module-netsetup =3D "${PN}-base"
+
+FILES:initramfs-module-netsetup =3D "/init.d/83-netsetup"
+
+do_install:append() {
+    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
+}
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..ede0639d 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -18,6 +18,8 @@ RDEPENDS:${PN} +=3D "\
     netbase \
     base-files \
     base-passwd \
+    dhcpcd \
+    initramfs-module-netsetup \
     initramfs-framework-base \
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
--=20
2.34.1


