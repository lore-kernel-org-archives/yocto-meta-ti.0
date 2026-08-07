Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0B1C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:02:32 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36613.1786082545643275067
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MDZNyVFg;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=guqRNIY/;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6770GQTG2309346;
	Fri, 7 Aug 2026 01:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oqubnM39PKAQ8VXWgJma0ioPxltpWdrJ1QdV/XrHm
	ks=; b=MDZNyVFgKDbHdXduJ1ml02jVO/mJYgJL7oR7Dv7x5E1Y7N6YwyxbM53h9
	9upYT2dH4kQ5R0v7dSVkR97TH2Xd5+r5aNU3tVTvf/LrJwQJhC8w76JKZnPn3xPx
	vD848bLWuHAYB4GwJAkNJtjFd3zB7CZDEZD0ajn9IugI2lbfWmKce1Y5Vic5qat3
	NdQ/z32+N7uBkUSraiY81FO2Bg7SCYvdXwgmoreoHTGxmXVfX6Q32mq9UaBHtXcp
	rDDnf3CeOyPkw2xiFFuyOsk02cwk78NaqmvfCbWbAsnuNJcwkUx/xsg0hU7yF8YI
	UacZdpl2swsnuQazX9yGBFJDmU8fA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjgg07b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:02:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfni/eupcIKoGRDc1vSixGIKsPQP7sM70uGrhR7YahrHKybpyeJdAcM+inR1z/3F1U0jKU/1/JNVnpNQftxRBpeju5CH8D2h0awva2VLISo63ej/Y7YdvxLVSqCWZTh7YDgsdxYZd8QFFfZggJ2pEcKiCJb1KsrKV0KalhaHIpNsEM5h4cWwpi6gbnfo8Vc6q2N1eTbairLTofCRzjLkM1vTfaG4TSCrmOrDwCd7zHM2V3f6LQm6d2CpKAHN9zrrr3/D5ASBowSnZjhDFh2K6iYgBiELOmVvnxmgyN4+LP4nTuLxQZVw5VWn93kLeFT2AtZvnaGHQjA7P8BzWlVVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqubnM39PKAQ8VXWgJma0ioPxltpWdrJ1QdV/XrHmks=;
 b=xsF7dzOz7ROVmQS2GCIwYCLhFDrZuHXB0YGShzO8YU0aSTs2SXvecL03fQtt8jKAOeBg5jzngC18OF5MR9+VfoP3eLPoe5TB99KYwCOGXk5Tn9AU8bxlgjHe5ONqvI3YOXcIZVsZVzYz6xhelWM2otGX1JeX5OjanUQz2TA/9R4Td7/N2cHl3MoKhq0Nv8jXNvC2dXAx4mr6YbaJcyFllVwXT/SefcsjetyeVgxtI1LnMYs1P5kgMlIfWquiomd6moFWQAsvnhQWnrEudzjK29+2X2Zd0l4/XGK8CQQzlFxXtYvx69B42poDcfae83qNZOmmA9ojedJs7gKV901DgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqubnM39PKAQ8VXWgJma0ioPxltpWdrJ1QdV/XrHmks=;
 b=guqRNIY/dEzUlQnL8DnXO6azp2m1FbdDmabu1Okdsv2hPZz0H9kNciar1k6r/0lyNxhANK81syhxwE58KpmzN4Pbx0cNCqB3YdccKOhZT0JwQrBV5/sqBaJmYuIZpmxjkRXqnSpa2fBAv49MHTmkiHd+cpn8ln1eSCC0AKyr9E4=
Received: from BY5PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:1e0::34)
 by PH3PPF898A57FC1.namprd10.prod.outlook.com (2603:10b6:518:1::7b5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 06:02:17 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::3a) by BY5PR03CA0024.outlook.office365.com
 (2603:10b6:a03:1e0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Fri, 7
 Aug 2026 06:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:02:16 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:08 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:02:08 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67761uDp508776;
	Fri, 7 Aug 2026 01:02:06 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH 3/4] recipes-ti: initramfs: add initramfs-module-netsetup for DHCP before NFS root mount
Date: Fri, 7 Aug 2026 11:31:54 +0530
Message-ID: <20260807060155.1381364-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807060155.1381364-1-m-shah@ti.com>
References: <20260807060155.1381364-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|PH3PPF898A57FC1:EE_
X-MS-Office365-Filtering-Correlation-Id: d04c19af-0260-4bb9-3d1d-08def4496f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5uubRhPi3LqAYQucdykXRTNTw8UeUY2vUfMj7MAkVGTUMohyMzGOWLubzKKS/GJwmP9/AjgrKixNLwVeZIZ+tBRtpT0Sidww/9+0areTe+u28+l2eMtGWbII6HpdooZc+isl0Bt0qY2EFPU/TPrjDWK0zT/M3XHhYEvMawsjC1+PwLyM1DO3i6r9m3d6eHCO3p4UliFRP5NRdr0MF1+SaKQDwSyjBvBLOZNAesEElofj36SS/x6wk3yJ7hJCcz1MCSA88irfCUYS2R3Jk7Kg7E2CzI1qwde8nLVb8nvYtZjglaZ98JV5jQFuNKPO4xNc+JPPufCAuuQFfzOjLVXeyy8UJdE5xI0ij8qYsXTlu4JokTuzIHQabmgqLWHZ4wx2MiMD78ZlK4/6OrzVA+mCkYTBuaVsBV89puKEZFFbVcpDXPS4PRgTQpCgcLhKl8czFbw3jwh9+HLT8TWaq38GLGny/MilCRYmnRkDV+00E7kostHbrXf8S0xYk62iCRSsCUtOvHjIBYZbU2oDr9yoc8R7o+3wYu9JElTl0f6yeq1DhxZSHT56TM7uMloEglRoXfAygFs7Q8oIPG2Tb+jNYAxHE/NFzKYxKpEvFGW2B5dtUcNm4S23Mfvzb+Q0nuOJwDa8rWndtmmBQAGiQWGpDgP3otq2zz/B/xXxbkP80BtZbY7hpkuNaNWp5WBfaHoGN9NAy0xxHJNA0YCMIKkIag==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5aGYQq/3naoMTrtuTIdnPrQE+qTTajtalK7P6fbnSrOlJ6UYDL/671XaC3nc7x0NYAb1DRw7fmzHQOjzAp/ynB1py7uaiLAkz4WpO3UG8eP2LyiJRyhmuLwZL8xG9xOoR49EEyoVwGtLO3bPFFGWSQCAmrR9uiy5S6+soqx0BRDhTQafrnND0NOiAMPU+YEDYE1fgDuMbID6rK9o1ICAy49WLy+U0Fgv4QqCtfdnhOash2Ltoj9zJx5EBUbD46ES/2ZWPhlO0gx2paaPTvpRYTKHp0tO+GDiiPikQ7BMVm+gZY3cZsNdNdSjON6pRg3G8Lh35/8XkDMuLEzoe8FbnknbeWwnO0jAjBKAPnKrJzGqtEZqpgOVPMWWA8t/93nMK+1P0eLFgwl3RTiIULFysC1tk3MQgWujmHLyzKgyoaK+1AQeg+NZWMHoNLpZthWe
X-Exchange-RoutingPolicyChecked: 
	a0HFKpbqaTqbtuPpZP4e65ZWcE8wZy/hT8Tz5OaucfA6t7lkUwCzMjJavvJfbae74zKuzEJzQTE0mhJOMjeUhHBHvkhp3bl+ndzHAJ+as2DDX79vWMGeU5+ikB8MgDLf7e27B7mJYyry9U+SAFG0R5Is/EMJ596FV4xnIdMEKMKxRU8SNdZqtUu6vjtsRI78bkkJgRqCz55RW3jol15wulrPHzOuUBQyHQVxcev9QJT6Q/wZprmlGWjfvZNBMt42JsF0iolk3T0dEPzms7B+l8fFAXF0jdeFTkwHHvEA86Z47cXr6QL3YhD8AyC0ZDYar9hsBXf5CAmi8ZhLm7Dspg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:02:16.6246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d04c19af-0260-4bb9-3d1d-08def4496f23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF898A57FC1
X-Proofpoint-ORIG-GUID: Yzp3OBmyPyl0bDKrF_gz4Di2-OgJiOH5
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a7574f0 cx=c_pps
 a=XnoXs6g8SJkBXVwgXvPJGw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Y7y5GAGdEv-jaJFZO70A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfX9bU4/+Pq6X6v
 OsXrlUsRKiItqs6MOn9gixV5KO8tTK85EydGLmwUIVzOvflcuK54967WwNQRfaPMnUzFNLJA89k
 pNYci+2ty0WGXJcZCxb0UFGi1CM3UOc=
X-Proofpoint-GUID: Yzp3OBmyPyl0bDKrF_gz4Di2-OgJiOH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfXwZfG/SptA+Jy
 elqPyoYSqJTfTv0uT2k46hucHxGEVwqmFvaEppXfuqa6cs3C10DXvHQYTOAKHggWJWYcgltpHTj
 LhD+tISQj74oSc/cZsb4tBzFVo1n3z+flClwKm1YaMap9yOyJC3r28O9bc/Jn/vu9UIfvm9D42W
 iobAY39AlVreMgItS34Do6+DAg3cDvgl4GgI93c9I4yITSzrLMunnSPDTBlO1nweU6CzdT7ApV1
 +C1SR4slwUGlc1IpdJeBEe14aBo2tMCMFzN8PAda3/BFLEgc6tqiVj2FOhjre+7fglhixTjTmjz
 sL8s8m9SDTXTLrbjKVuhbZqaD7gTKEnf5t+0jkHOdkZ9VpLgsU78N4Cf0tktfexa/YOQV3w0OVS
 SAHh63aA8bsAlMdYwoESgGrOexz3gWSuVNMo+Y7CEm+VbpLnbc5ijWvx8zI7zAgedmxs/m9K+s4
 sdxiYika1VLMRHtUUnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070042
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:02:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20226

Add an initramfs-framework module (83-netsetup) that brings up an
Ethernet interface via DHCP before mounting an NFS root, polling for
the interface to allow the driver's deferred-probe chain to settle
after udev loads modules. Pull it into the initramfs packagegroup
under bsp-next and bsp-ti-6_12, matching the kernel-module CPSW driver
sets those brandings need for the direct (non-proxy) CPSW path.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 30 +++++++++++
 .../packagegroup-ti-core-initramfs.bb         |  3 ++
 3 files changed, 87 insertions(+)
 create mode 100755 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
new file mode 100755
index 00000000..8e76bac4
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
@@ -0,0 +1,54 @@
+#!/bin/sh
+# Configure network via DHCP before NFS root mount. Polls for an Ethernet
+# interface with sleep 1 per iteration to allow the Ethernet driver deferred
+# probe chain to settle after udev loads the modules.
+
+netsetup_enabled() {
+    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
+    return 0
+}
+
+netsetup_run() {
+    local iface timeout devtype
+
+    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
+    iface=""
+    case "${bootparam_ip}" in
+        dhcp|on|any|"")
+            ;;
+        *)
+            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
+            ;;
+    esac
+
+    udevadm trigger --action=add --subsystem-match=net
+    udevadm settle --timeout=10
+
+    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
+    msg "netsetup: waiting for ethernet interface..."
+    timeout=60
+    while [ "${timeout}" -gt 0 ]; do
+        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
+            break
+        fi
+        for dev in /sys/class/net/*; do
+            [ -f "${dev}/type" ] || continue
+            devtype=$(cat "${dev}/type")
+            [ "${devtype}" = "1" ] || continue
+            iface=$(basename "${dev}")
+            break
+        done
+        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
+        sleep 1
+        timeout=$((timeout - 1))
+    done
+
+    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
+        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
+        return
+    fi
+
+    msg "netsetup: configuring ${iface} via DHCP"
+
+    udhcpc -q -i "${iface}"
+}
diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
new file mode 100644
index 00000000..6b465462
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "initramfs support for DHCP network configuration before NFS root mount"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://83-netsetup"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/83-netsetup ${D}/init.d/83-netsetup
+}
+
+FILES:${PN} = "/init.d/83-netsetup"
+
+RDEPENDS:${PN} = "\
+    initramfs-framework-base \
+"
+
+RDEPENDS:${PN}:append:bsp-next = " \
+    kernel-module-ti-am65-cpsw-nuss \
+    kernel-module-k3-cppi-desc-pool \
+    kernel-module-davinci-mdio \
+    kernel-module-ti-cpsw-ale \
+    kernel-module-ti-cpsw-sl \
+    kernel-module-phylink \
+    kernel-module-mdio-bitbang \
+    kernel-module-phy-gmii-sel \
+"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..e1d75327 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -23,3 +23,6 @@ RDEPENDS:${PN} += "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
+
+RDEPENDS:${PN}:append:bsp-next = " initramfs-module-netsetup"
+RDEPENDS:${PN}:append:bsp-ti-6_12 = " initramfs-module-netsetup"
--
2.34.1


