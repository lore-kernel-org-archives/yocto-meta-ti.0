Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701F8CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:17:38 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6740.1780661851568638373
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 05:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TOt23CxU;
 spf=pass (domain: ti.com, ip: 52.101.56.42, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+NlqI42yKTqYHpimqNqTEL4OaBez4Xx8FxHtHAGIirIYjBL9W3Y0FrQ9JAtmKfUO87qU3nUn8xcDRdAmVesS0XPh6cNgSFxOhEvyiZ32h24kDXOcg+I8+/X1Qi0lMk8avXxU4SLnMYBVqx7zNEQgO4SdbPW+zokmKd5+Cd1zinquXMH2xZ9rC4r3cxSo9wqWXzB496HXnyEwrzmpK5qwEzLtfp48D716KvosQtitW7vyK7X5vCb6CQxepwsy67ClJTEaiELpmQBpya2R8Xe7EtO6jYpvQydmxk2MGM2qYhXVxCx+/XuyAtB/1Bx+SacGCJMhfC0kLpbSuDp0Pv02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK2igrO6eort33gAe3BxkLqy5nw65RDul95ivY+dFlI=;
 b=GC0m7E3TiUMJnHHlLsNrWOwb7FNAbA0xnQ9uuBd2X9wk1bMX79QZBs0WGOvict4LX40yGhcuEhruRs0TPPGyNnCm6gywk8eZZyS52QpZdbgMijcuqeX2zIk5Rp592LTSWwNqBbN8ZYyv27AiReNOJSQ9DJfehmoCB2vhVDnsYm7jWf9blImGFYc0byZ61kTw89dFoUDpg8npqA78gUZ5uEIBh/mo9ab1D5m9VklQdqL7QBGM/uZ1GgjR7MkM6++kv12ePzPsOipBDWW3cIhTo5OYcEi1U7/fMFYmtR8rwo2uTNXa8kwDPTyJFN0IbpaqiNiXc844gVD9GTurV+aHdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK2igrO6eort33gAe3BxkLqy5nw65RDul95ivY+dFlI=;
 b=TOt23CxUESQRo4g5OGRcGeNx4KCHaa3j/P05A4BtWaN9ZgtRG4gPla+OVoZhm0wBXlH02vNcrlp8mjndI1WiPnlxdr8WIFY4KVgJdxbKcs3oR3ZlXbjERZs7sAH0Kx2UOA3+Pg6a2uXkQN61cyAuAtaloqO90oGF+QDIrnjeEs8=
Received: from SJ0PR03CA0365.namprd03.prod.outlook.com (2603:10b6:a03:3a1::10)
 by CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 12:17:25 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::8e) by SJ0PR03CA0365.outlook.office365.com
 (2603:10b6:a03:3a1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 12:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 12:17:24 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 07:17:24 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 07:17:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 5 Jun 2026 07:17:24 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 655CHKiw1857284;
	Fri, 5 Jun 2026 07:17:21 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH v3] initramfs: Add initramfs-module-netsetup recipe for NFS boot
Date: Fri, 5 Jun 2026 17:47:20 +0530
Message-ID: <20260605121720.1850683-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|CH3PR10MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 0422b635-d8df-40d4-3e49-08dec2fc6719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Mp6adCs2L6KF0bm12eTunRIN82Zk/oJqiD4KYfUNzkK9UIqYUk9FyTxul4ajHAt56HPr6X/bhPLFv7k5Z5ZUJ33Fc2tTSfoMBBjyR2dY5j9V5pGe96jvnjfahlus6UasMctw7ANTYqzESOe1SOJv3yVSxG93OkCaKnwIXKH1qAZCO+mH50ctGIrFBmooDQx8O5N3P6SJCCtZR9+3lkxJmlGs2uTuZpfHKtNfPHhT3OELmOioAkH/nNT2K/neFC3uM8IsTsw+c82Mfwx6pUmqjYwgHaSScTHswOooVw8t4xLa4vcUqZRzK0Q4HtQMbcs6Z5VcvCmwKKUW68RZZdmrk68cM9wu7riEqnwIiKIwI85/FK0CH6MFTZ1isQYTPOrfb7IBUNdbgWwuY5XCquTiN+8DlGwo/YmhEkWfgRIETiTXiY/B7vkjj74a/+VTgZtQfPpGogwhNVkNgqRXY22R/zxRbRKXd0pttt3EPxjRCBnHGmZIC/I2+L7/cKN6Nq63dvBum7JpaPO8OgxhxrK4+BZaB+b/dstywPfgg4LRM3NEn2+KJ06loF63fuQr3UlnKnyFVbpNtczBHn8GDalGBrNoC4eyF0oMBO5xy6ODC2frYUFUDeNgLp67eXnwKmYJjLQUr+ynNTamtMRl1ynTGIJJfZDB/YgXiLNxJDFqF4oPCRpGNLCXUNk5XhmzqDWp6bU4eHvxRSJBjJbYRdCv5wQXnl/+jgvK/YlenCyPudg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JzOn4K2TdRAn6+SARjzHe/LlkSGHHtQbtsAY6Ahuq5pHy4NZl1Iy/v15oG9iGfOgcBmnVHg6FtS33Q5C8qDOiYyP2BFc5M3MVJB/izvt4ohVG1qnD+oe3g/WH4J5BfSagFA2fk+UKIwv3lAq/2AH+ApO05h1ofEjhYp2JbI3nvW2E4DMVbBIBznHUIg9J/xwOZ6085ZVKa3IGiJA27vG9/0asaT0KgqdodtglQY8gnphX7qzyumDK0bdqP2EqzAUmyqTJxyfpVW5+R9nhEvUj5LPC/KZ8s8yijsMtuGgUd2sdsTCnKZDmkEGfpJ3amd21dRAf5gGij5/M7LaQ9UBz28QVuBLEIwMDLXAS30vGSPAd2t3nCH6RPOzLs4lNzXQ3VVX2ODGWeGQ/2K9yBOxNkq8sQYETX4a5ydxYc+fl4XB/s9E14IjS7Cnt+fuHrMG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 12:17:24.9183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0422b635-d8df-40d4-3e49-08dec2fc6719
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7329
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 12:17:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19979

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
Hi everyone,=20
AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
Ethernet driver is no longer available before the NFS root mount.

Add a standalone initramfs-module-netsetup recipe that waits for the
Ethernet interface to appear after udev loads the modules and then
configures it via DHCP before the nfsrootfs module runs. The CPSW
kernel modules are declared as RDEPENDS:append:bsp-next of the recipe
so they are only pulled in for bsp-next kernels and only when NFS boot
support is needed.

Changes in v3:
- Remove FILESEXTRAPATHS:prepend - redundant in a standalone recipe (Denys)
- Remove PACKAGE_ARCH =3D "${MACHINE_ARCH}" - script is not machine-specifi=
c (Denys)
- Drop k3.inc patch; move CPSW modules into RDEPENDS:append:bsp-next of
  the recipe, linking module inclusion to NFS boot recipe inclusion
- Gate initramfs-module-netsetup on :bsp-next in packagegroup so staging
  kernels (where CPSW is built-in =3Dy) are unaffected

 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 31 +++++++++++
 .../packagegroup-ti-core-initramfs.bb         |  2 +
 3 files changed, 87 insertions(+)
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
index 00000000..cdb6116a
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -0,0 +1,31 @@
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
+    dhcpcd \
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


