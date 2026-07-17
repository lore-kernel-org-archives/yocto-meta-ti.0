Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A544C44514
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 08:35:40 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9300.1784277334119290704
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 01:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iJTN7aRY;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IJ3oN3RG;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6bIdS1764559;
	Fri, 17 Jul 2026 03:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sUA1906LCN7zF
	WhuMSj3dYvb8n9wM92Rl7QUezuc1Nk=; b=iJTN7aRYu63hTlHGSVm1y8FA+/5Wq
	pa9rxvQewxexzYIba5+2r97wlY9SR6D5LKlxzCLaSa+KNbIKoFcD6psHRT4qYNxX
	tGZ/509mSgmLbrg7sU09oiReuRip+Z5r7zJnQIqO4TK1bib3tZhLmqQn9eIoaOoE
	tV0P4lwf06kGRuLRFpybAPMgEPgJjCANcykjQjyKi+0fAZobFpcf10jQIkvjcZVZ
	1OcgDXAzzRI/YuUbHTq5TE5MjMNFFW8o6sXMJWXKOrDfgZds02ufaNVZjAdBdSEW
	8w2ALeM+YZw/ZPqb1ZMxCGFFIWHmwGSUhBcrLQSGmhMP2qgn5enuJEYvg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff2ccvet2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 03:35:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qzcoz776Va7baMEjFHoy4tp9SgVDPECj3WLAOasTUDnRGqCpUpJx+smWI89P9sY+yi6KrHF76m4eKUVHAa2enEOejg0xzEHxe9b0z/MfzSBiT43IvVNP2eYbuBLceiSRXfLCn/SQpV17y+bPppwayDwJmLpftH2ZofJ/RllT052ACXC+aYd3qWaC/aJSGO09ukI60hZLm08hKt7TrwDLbjSh12p2YK4hequriFJuK+Srw/1HyQT39dE1wkx4scPeUJxNTRFvvgXYG24ld6YtbAzJlLUsd+aJNWON2/PLV5h6GF1C2En2B0HyK3jjZPAwyDRVc14wVihOil3tFCFfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUA1906LCN7zFWhuMSj3dYvb8n9wM92Rl7QUezuc1Nk=;
 b=V9gIH+ZRROT/YW3KdXLhbtPWkn4/Ro0g44s5BHtMOcGsSkp0QKi1mySnGWTkHoSK8+iXxPR2Y56HTP6DHMcUvv75676ctiRaPLSTROHTiiug++Z3SQDxPO5cIo9Lwwmxb0ekmtxbBn38C5RcMPv9r2ph+bkfIqGLWFI9dZP28+N+gXw3XcLw078RdxhrhKzUqGddmlcTdSX+EslZsQ8EpHScE3/evC+SSLeoO0gOdWNUWw+cDAGCyTHQzsEvHqC8of9NUmHbKeXZm8yLj0QTghWGbDR3hge+ipnDQgwIDpXC1l82Mw3sSuykL9Ls4cHIbdpdhH0WnYt0k2vkT1TITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUA1906LCN7zFWhuMSj3dYvb8n9wM92Rl7QUezuc1Nk=;
 b=IJ3oN3RGxE7Xfu+2/FB2H/yX0Pl5iN93XGtj+i18Ib/XB8EV0sGqzuxpIRQVIFeIn/Gde2PR3Fximjliv7Ty2njRn5sj2VCvgmrhjALEI5VDtAu0bLgjUFrKyxLNWnaGeOhatWZoxpTB5jhJl35Dy8FMRANfTRexsdd/W3aT/WU=
Received: from SJ0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:a03:2ef::35)
 by PH0PR10MB997667.namprd10.prod.outlook.com (2603:10b6:510:382::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 08:35:28 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::1f) by SJ0PR03CA0210.outlook.office365.com
 (2603:10b6:a03:2ef::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 08:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:35:28 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:35:26 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:35:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 03:35:25 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H8ZMNi2797064;
	Fri, 17 Jul 2026 03:35:23 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>, <jcormier@criticallink.com>
Subject: [meta-ti][master/wrynose][PATCH v5] initramfs: Add initramfs-module-netsetup recipe for NFS boot
Date: Fri, 17 Jul 2026 14:05:22 +0530
Message-ID: <20260717083522.1889008-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|PH0PR10MB997667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb710f4-1481-41e6-531a-08dee3de5afd
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	LsZD0u7unpQHztOSB+fIbY1ypNeuz7rEW/NXMKbAXIumDx1+r9/U6CZ59FucLLLl3bogB+CH+V5GUP6b/bi9RAt0lVH8uOuOJ9gtPyaAKhyT92KcompyrQqAHxuzOw4LnzbvLUEjZw/RV3di9lzedNEqG5riwkIsYJYKSDfOMgBRRhDZJ9nRb2DQtv+nu7urRr3h2/jPcv7sih3Pt1pmfH2KFtJeHk0r8ZbVrfCZCIc7BOdfNPu3tmlyth6gLHjay4rDEQvGkq/aI7DGwZ/EBHYE0lMDD7udY/EdM0HswXu26N3COsAr37JITwk0rPFjZqpo2zCnQ0HLvbKSy841nXt8tgaMmZpmB3KihreUM1L4uHGvy/iDgwLwm1uR9SI7fzfVhVmEyVMtDpDPksh5DKUmTBrSlZ5E8b0lCzzk6F9Y2M2k8rjCd0sH20lPZ3WT11hCVc6TtlTCptNTolP3Vvpx9oj+Qay2rAs8OmUFEYG8SLy/Hzcv1pIAm4qjTnPtobuIKld/UTDQ3fFt3muaulywayplOLFsLlRU+NxyfMXRrfa/x8Cn2CnkleDF3FQaGFhdaYctvVZio9P8UHl1DyUD0uAfJm/FsX8RCdN+J8vcyRIRwfLNpt/iN6uW0C30rmzjM1kNwtD5cUwbnnHgJCOR4j8nDdydYsKU5aBflYhQ803gIsiM1PUdV+n6SxIryytWVXA9I64J7BBIyeW+5w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9nGtWQOPsOOqyaVIfCHQvyKqBWFvWtwPRClv0WqjKPX8iOVWPQglpykxS7+iwvn/fa2YhN5W8YbQYMh+vhsMUmJ+Lvkv8ejF4vwpoY6EpWLT0r4cfUGAxkiNISWRPKsrGs2PccGGwzt6vlUlVFEotQjfv+LxGsObwFWWOXgJuq4D7C7v9MfbMrG1iI12sRQnNCp689hx5TI+d5nUe+9RXRAoBHlITq8XR08Rd7tbX2J7xOO45bHJdqFoEM1bYf7CDME48S/s8tdlHs/nz4z+NYJYfYpvty1vbS0pTNLIcH/UpejGtPJHTKk54xInSrVrHZDzwIYj686AiF+UYBfkpPLruMv28sJwv8ja5frbBn/oJK8lrKSt9n1RdnFYjlkaG77VT1nlLCsn7f6bd6EfnvELaZLdudQSiCEBK5d4GzTABXEn/c3RxTry0GFQTtQd
X-Exchange-RoutingPolicyChecked: 
	ZicF0MMFPR6kNSv7d0XS1KS6WEHq5tOkxivd3TFy7hc6JEKx8cYaGWpgsfQTSbclPXCcX3WAoY5qF8w9NKe4cmL8Oq9LsPraHbIycNSQlxzZ6xfzv9/ev2w/AewpxF/u7/1fKpKAZouiXWOO742B8tbhAkjkmVrIYRxU26ETRSdvrQ5FK26fZ4BYw+dSXqGfn5x27lf90Ab7+t/rkE7Au5PMDLnxl/AiNt8RKYuovGJAhb82RN3+7V4LZ4LUoD5qCqiS5JRMqSssW83RY5CJPSgK3z1y2YPX/Ent1lNhbZjGeuGBAoaOg1/37A9iumfVnt/ok5INz/6Yq/VOU3W+vg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:35:28.0701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb710f4-1481-41e6-531a-08dee3de5afd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997667
X-Authority-Analysis: v=2.4 cv=NtvhtcdJ c=1 sm=1 tr=0 ts=6a59e953 cx=c_pps
 a=CQGnQshk6KQL3sGkhxSvaQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=9txZmVWHpX_ypQBaPFcA:9
X-Proofpoint-ORIG-GUID: zreoyYE6Z3IdnA71Em27AK2Az3zo9NsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX9TzN/y2lBuQz
 h3isTLCA9q2TJmI6W2+pyf0Zzv2imq92lOMVkB06KuW6sbwsBX8k4JRZ+dKwHPM2ikBlw8CGW2s
 OSCLpGJMLIHDy9B3JLiSkWepHEHQn+jiCBRYim1tl7VuXaQXRQFduWaT4buhN6WXWYScDionAsn
 bTLvQyvwbWvGVt2llGXif8Rg3Tf1xp0Vv8M/r8Cw/qmKCBWF2TgWx4sEtvSztbNDZRBdg9zewfp
 SRilpeNZtAEwEjuEm4qtKquD+As68hqzbdxQumMS1iNvF+kOsWKtSv0j0CxjDVDhCej4sbJX7gf
 fyZFD16VqbDbuHvPydGv1ekNv9vsVGSS4H34VtZWvp+WcMDC0Ay7Jtb1DlsFgln/+Wgj/2cbosM
 VLIMD3PKM4IirW7pDd00fD9fTc1aHJl7to+YtEkTqX6rgH0DgTBDEYcU5Gf/K8zsuMEea+JFQ1x
 4KpLB3imFPjAF1yKMLQ==
X-Proofpoint-GUID: zreoyYE6Z3IdnA71Em27AK2Az3zo9NsQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX527OeC9Gk3UU
 Bx0ARGEAHg5/4a+uHd9DFObSAQ0qvkWGN0ZvW5CJEqq7rDNlc7RBwIfEaAGwU9qsOi7deiWPitv
 SVoGxYyO46d4cceTnaoVQv8eyZdfxXk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170085
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 08:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20155

Add a standalone initramfs-module-netsetup recipe that installs
83-netsetup, an initramfs-framework module that configures the network
interface via DHCP before the NFS root mount. The recipe's RDEPENDS
pulls in CPSW and its dependencies, so the kernel modules and DHCP
client are only included when NFS boot support is needed.

Include initramfs-module-netsetup in packagegroup-ti-core-initramfs
gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.
TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=y).

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changes in v5:
- Scope CPSW modules and netsetup inclusion to :k3:bsp-next to avoid
  breaking legacy non-K3 platforms building with bsp-next (Denys)
- Restore PACKAGE_ARCH = "${MACHINE_ARCH}" since recipe has
  K3-specific RDEPENDS (Denys)

 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 32 +++++++++++
 .../packagegroup-ti-core-initramfs.bb         |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
new file mode 100644
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
index 00000000..03925497
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "initramfs support for DHCP network configuration before NFS root mount"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://83-netsetup"
+
+S = "${UNPACKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
+}
+
+FILES:${PN} = "/init.d/83-netsetup"
+
+RDEPENDS:${PN} = "\
+    initramfs-framework-base \
+"
+
+RDEPENDS:${PN}:append:k3:bsp-next = " \
+    kernel-module-ti-am65-cpsw-nuss \
+    kernel-module-k3-cppi-desc-pool \
+    kernel-module-davinci-mdio \
+    kernel-module-ti-cpsw-ale \
+    kernel-module-ti-cpsw-sl \
+    kernel-module-phylink \
+    kernel-module-mdio-bitbang \
+    kernel-module-phy-gmii-sel \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..537d1f5a 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -23,3 +23,5 @@ RDEPENDS:${PN} += "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
+
+RDEPENDS:${PN}:append:k3:bsp-next = " initramfs-module-netsetup"
-- 
2.34.1


