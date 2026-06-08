Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7308FCD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 08:09:30 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49631.1780906160678967452
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 01:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uPLp5Kwi;
 spf=pass (domain: ti.com, ip: 40.93.196.5, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TknK8A0eNO2zRDkVc8NyArr9MESABgCdeXWARGF9gdSc+PzsLLDmGvU8DXIiip3sXDsLQkqEo8GIFx/7ly1lmO1mwDHTHdcUvW2GRkACTs9TM8GZzrUaC2xYeGAw77bNNEp7yJHG7YiP+sRCOiuDaTi5BKK91KbMgElik3bY6VLCkh/yIryF0kG1Sox8gbva99cyyxjM7qZpYpbXmAjnqGJQ5+gVS4qvPA4TSpCyCmq5n2EbjMYSbbdI2cwA+kzXdoARTBaMbjDaKPZRxVtPOttI+fUDIkRQo3bebVwWAbAUeLMejN5ZT3WVWsFkthgM9YeIP0PYxc/XqOZpfZ3ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4e1kHCLHCIBtP2tAIx9yF6Te9sYMWfKE/yyupf4m30=;
 b=jsGASdLd4ztSVBlRzMIMDFdDLdmyuDpJnXiorZSO0LajNCc92sndnZ4AsuV1llEklyN/PI3rUDVBzXi1IP7SRvUWntjZuIkXoHv2Y48KJ23yUVRn7Um10Yd0jxf6NW4tHGHWJyIOUyPqFAsQhr1hRswgwnMrWPRGog2WBaKoZ1VU1cozbabqqTLS7euEZULqR9nU2oifaNm5QAEqYfTF9iFqFSfCxfUaZjsXz5toNDZDpSxsP1PIlPj5fPGtXuPhnQ2w8FkHC2XwXQtEwTSK74kbjASzYa7287vC9cFEmJ8IDB9E45xDyMTDMPfB1QghZcn3xwTpt4yMhCAnUWbrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4e1kHCLHCIBtP2tAIx9yF6Te9sYMWfKE/yyupf4m30=;
 b=uPLp5KwinY5deuJIJqg4ejY3qrw8dUPfgsTJMVc66lPE8zlzQlbzBGKr0kR2lAYv2K4TI8k+8xyptJ3DjOUzYe0+kzz5D7tgvBZp1gUS2g/7+UYZx1xskEenx6PbwYdhMgVtnFtoPR+ZhSC2fCVR+e+9ik6RlpJqcWSIrUZ6/Ao=
Received: from SN7PR18CA0016.namprd18.prod.outlook.com (2603:10b6:806:f3::20)
 by SAWPR10MB997812.namprd10.prod.outlook.com (2603:10b6:806:4e4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Mon, 8 Jun 2026
 08:09:18 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::aa) by SN7PR18CA0016.outlook.office365.com
 (2603:10b6:806:f3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 08:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 08:09:18 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 03:09:10 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 03:09:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 03:09:10 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658896GJ2633349;
	Mon, 8 Jun 2026 03:09:07 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>, <jcormier@criticallink.com>
Subject: [meta-ti][master/wrynose][PATCH v4] initramfs: Add initramfs-module-netsetup recipe for NFS boot
Date: Mon, 8 Jun 2026 13:39:06 +0530
Message-ID: <20260608080906.2266315-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SAWPR10MB997812:EE_
X-MS-Office365-Filtering-Correlation-Id: bd068679-9bb4-4627-bd69-08dec5353d48
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	b8zz0Gto5TLEPxGskV1xo3eicPF9aUzlXArlcps75YznH0F8iRRDqBUGWZUEl5R08fb1bEPy/JUXicEwlUXYud7e5hBQO5bunGv5EvPuuNZZcM9oTtIAxRvsOdIHaFKJEmDQFjOlYqhtKx65Xr6MpB0/4mEK1/EtDGdMd2qkbrtMR0Oc7NZumIOUwpfmwjbcMOP4boHz9pc9sji5I68aXATvYHBXPVIyDuMkTwURtqp5KmpimnSknRXsYWePWMbr19qk+LAj1u+GW8kiBrG3hZdMzF45jXyNF4mO0k779stTypyGsNW4uBdATD8+L8UEp5+BnBnPB12flM8P2wrvphJ7enS9VDBW3EAANYeJdLXZeXJILNuI5ZOQJj28MUHTsscjDgC/i9iCO6cb1jNm5mqvsGPRnTzWUG1e8qqvY6E+YB/XRqXlOLC7qqqx04PxdLUmW0YRWU1YgsEs/4/8v6Nxq0zKXBJouK8sJM3yW7MDibDMvZe7sTbkHl8Tl1CLgYYmOHBH+1ul3gfm3Huzn4TMXC9UJA2b8oZjhAtPT3Z83lC9YdQVclCEbfMCuaVB/vRSSLdTKSxp3Eb47kYfMk037zoTlA/xOWZWJC+2n+8Bw6f2yDGK/Hhygp+iuCc5zRM8IHbeXzaz/60tMaFZMlbIxH0ML+vmwHynHBrs6Ce+ZewxH9pAyK851UPVHls5k5bGduzJ01/3cwKJyeKiHvwUitkQhU8x49CQ0nV0CK8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CvzGp9JCgMYP1BJx1J2ASO729+mOscOo8ltaXh7NLQSJ6qZtBb4cCySl6HcF6XyzT4CfkP1HaO8FqXTz8NI4NrV8oRATFQWW1lx7ZVe9MMNLm9C2iSy8wHuksn3TH1yPzZLKY6GCNBkWdWW53a8Cjrw174v9KZl+hJDOANNLq7StgS7CS+n0+kSYCLNZaByhVR5SmlrYCMRA5N2gN8uLdlQJn0BLfNmTTKnojQz/xOJuqQSFShcHuEaXg4QbJYYCC4AEl/Va9S/fmx+7RwE+S+Bv+qdK0DyjvsjbJhLbC8/TaKLY68PnCnk+e17AqeHQ2KwCDJt8+1UNWp/VnsZ/pyE6A+tNmG3vZ/yolUBAMiv3Ch6g8GX8NDDvSAh3N8x0kTAaiodvkactc6HcCxODIdEJnICjxh6Fyvqk9lXu86snuNL5nQuyOBdVesNJXxhY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:09:18.4574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd068679-9bb4-4627-bd69-08dec5353d48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997812
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jun 2026 08:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19983

Add a standalone initramfs-module-netsetup recipe that installs
83-netsetup, an initramfs-framework module that configures the network
interface via DHCP before the NFS root mount. The recipe's RDEPENDS
pulls in CPSW and its dependencies, so the kernel modules and DHCP
client are only included when NFS boot support is needed.

Include initramfs-module-netsetup in packagegroup-ti-core-initramfs
gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.
TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).

Signed-off-by: Moteen Shah <m-shah@ti.com>
---

Hello all,
AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
Ethernet driver is no longer available before the NFS root mount.

Add a standalone initramfs-module-netsetup recipe that waits for the
Ethernet interface to appear after udev loads the modules and then
configures it via DHCP before the nfsrootfs module runs. The CPSW
kernel modules are declared as RDEPENDS:append:bsp-next of the recipe
so they are only pulled in for bsp-next kernels and only when NFS boot
support is needed.

Changes in v4:
- Switch from dhcpcd to udhcpc -q (busybox, already in initramfs);=20
  -q exits after obtaining lease so no background service survives
  switch-root (Jonathan)
- Drop dhcpcd from RDEPENDS (Jonathan)

Changes in v3:
- Remove FILESEXTRAPATHS:prepend - redundant in a standalone recipe (Denys)
- Remove PACKAGE_ARCH =3D "${MACHINE_ARCH}" - script is not machine-specifi=
c (Denys)
- Drop k3.inc patch; move CPSW modules into RDEPENDS:append:bsp-next of
  the recipe, linking module inclusion to NFS boot recipe inclusion
- Gate initramfs-module-netsetup on :bsp-next in packagegroup so staging
  kernels (where CPSW is built-in =3Dy) are unaffected

Bootlogs: https://gist.github.com/Jamm02/2d078c20f0062394b0b7d09da7ee0a57

 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 30 +++++++++++
 .../packagegroup-ti-core-initramfs.bb         |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-=
netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-ne=
tsetup
new file mode 100644
index 00000000..8e76bac4
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
+    udhcpc -q -i "${iface}"
+}
diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0=
.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
new file mode 100644
index 00000000..ec04ea9d
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "initramfs support for DHCP network configuration before NFS r=
oot mount"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
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
+"
+
+RDEPENDS:${PN}:append:bsp-next =3D " \
+    kernel-module-ti-am65-cpsw-nuss \
+    kernel-module-k3-cppi-desc-pool \
+    kernel-module-davinci-mdio \
+    kernel-module-ti-cpsw-ale \
+    kernel-module-ti-cpsw-sl \
+    kernel-module-phylink \
+    kernel-module-mdio-bitbang \
+    kernel-module-phy-gmii-sel \
+"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..b4e6adff 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -23,3 +23,5 @@ RDEPENDS:${PN} +=3D "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
+
+RDEPENDS:${PN}:append:bsp-next =3D " initramfs-module-netsetup"
--=20
2.34.1


