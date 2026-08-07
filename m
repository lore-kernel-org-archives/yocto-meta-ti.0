Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456A5C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:39:16 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37820.1786088347508926008
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 00:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZdSFdvXA;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=r2V/JnlM;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776GXlO1663697;
	Fri, 7 Aug 2026 02:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rwdaMSXkg1mxO3tNXSRVkqkdYvSwtgpz7AZ8sf3rZ
	us=; b=ZdSFdvXAF+xfEPR+VGB9Cjmc+gf2RUVhQmH3+XsvYMgbAt1LqRTaeKVhW
	ivEwaBVY4V/dVEiRoKx5LzKe5D5jI/6922hn5HgkPNJ9wm3sU16l7+86oKN/H/n4
	6wBaeopKQWuNOjiHnvDd7UCBu+DJy9InOGH+iwMuyw8EZj+o82GLNEfJPPyWp5hw
	MRGWYnc2QILB2I2HCMJqVBau/UkdCZJBHaxzmM7iWEvGAA9Q/WFyTNPsVIH2ph12
	iQ7AGMVw31Cg3sKXAzGqWFd0oepm9dQANkPxIKN6hbdwmhXHp94hl7pk0pLXfoob
	jLP6WPgpjLgILvcr1abeoRy+d+IsQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf7s3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 02:39:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eea0hXxw9qeMC57FkGlikdX0qEXYmMpQorSQCav5hK9QgtXzqRiLaq8nGsIaNJgM5hfLF5GIKpfH3+qj/jAWzJyk3wpNvh40xIyKayo4lYsBfFBzSDOoJYhyiGYqpJxrDoJplE/+ZpYQuzezbhX7txknV6LC0PwpUsfhup2Omcsm3fD647m5csBdOtyb4ege3JnGENFJnjEsucj9XgZr0fVbWozCC/ZFeT6jOVZppm8U04rrVyN6YKB3FRAqhbdLhgFjb7Xl8Yaa1zErHS2wYYVzaaz+4nDQfncWCUsl0PFppbVvYjDVvccW1l0wwdooRUNdexMV9YtqD3tNCi9/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwdaMSXkg1mxO3tNXSRVkqkdYvSwtgpz7AZ8sf3rZus=;
 b=puZXJvXgX6H+UEL0tpJBV+uDHuoT8MPd/X3Xcbd9x0+6z8BkRYoepa54h7c93fRL4bIWog2cTMIj0gd5WJ5PLqGbvgPrnKYzNCE32goAoIWYGPDtTr0A2SSYaVH6j/ocej0LuZmYZsCSa9GmHZit25Nxu9mDMvCnMqQqNWl+J4jKIE8DavE+DkMAdl8Z8/iwIAe5t2554nViVP6oGAGFp1PkVn1gbxvhghQVtRzP+ySGQVqSdQHXKepT6mwuHEwcitrKrzNTgUAx1rtaH5yVLgX4uw9cbnAgzsRUaAF4GUmA96B97+U1PCqL3pvTZboubXfxSPfjQp7+QKVfFb2K8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwdaMSXkg1mxO3tNXSRVkqkdYvSwtgpz7AZ8sf3rZus=;
 b=r2V/JnlMWk91o+rmSulB7OtN5PRq3Vr8xXCT+j/Wh1yI81gdPdhuTZK3mmXYPh5mm5Dx7aba11/UVEF9RUZn16PgCBH4FnNJbFB1M4ONiDC0JkGO3nXd1PcWHVN24kh1NDhXjvGCQpb2udleHwmgdsUi/AgVlNX+GQXZgMO7tvY=
Received: from DM6PR05CA0045.namprd05.prod.outlook.com (2603:10b6:5:335::14)
 by CH0PR10MB4873.namprd10.prod.outlook.com (2603:10b6:610:c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Fri, 7 Aug
 2026 07:39:02 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::ac) by DM6PR05CA0045.outlook.office365.com
 (2603:10b6:5:335::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.10 via Frontend Transport; Fri, 7
 Aug 2026 07:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:39:01 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:49 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 02:38:49 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6777ccMt647375;
	Fri, 7 Aug 2026 02:38:47 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v3 3/4] initramfs-module-netsetup: add recipe for DHCP before NFS root mount
Date: Fri, 7 Aug 2026 13:08:36 +0530
Message-ID: <20260807073837.1394655-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807073837.1394655-1-m-shah@ti.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CH0PR10MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: d5af54bc-2fec-4bc9-2e3f-08def456f33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|22082099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	xnbxni9cPCoYmmdeg0b1L52N1eeBEjJjbj0U8Ch65hdiI+kVCqh1N8Fzx9OXJMp3IaxJVBlTVYN+KWGQn2nyG8nxb3Ta00I3jtRTCyqKeCFhDOe4Wr1x/5xPPboIRHoVVKoiJ8VY/PMgDxqANiuNqyNOGr1PdA4VELnIv/J6QmBLe7iT6th6+hyCe+KnIpHG8ZClxGDUjibjMWK43Dsic76tUiT1zcYuafxtBk1cyu9bNjgZt06BOT4xoSeJBmsBW4t112saUybPEuu4nTER76TBr01R3r3GgSgOUuP59yUXKdVTX7p3Fodqa8RN1+AtrvMb/v3C37b91v/Fdxz/nHBr+QmKlgp1INfdZD1UVfss2hTASWy5D1wjPmMAzrQXh4embPvcFAgQ9wPyUBe9+zKvUveihEEiyps4Kv05owje2GO9TvJCse8xF1nQHwcQz0uaDCpWVpXgYdKSQaFWoJEhDYJhePpoaOoHgca256k8pjKawNsKGn1pS41xhfOGn1uBjsyZjwh+disD7Ywucj/WmgIVoV6fDWNQ8CMJd803g9NMvXx613JuH6TgrTLS9tlu2/pHZKqfFDpDYfiJGzqwFLEdsle0DyyPvSnFVOu8HzVgnBaKCfBYcEN6rZvydAzkcem5HzTjOaBiD18UtoMOMpU+Rqn9FuFKDk/hSiN6DLM8i/egyNXhko65hCyznSt7Kb/4HYz60bKIOjHsfQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9TTpeIoK4X3nFggLfgo8Rk/ZyuZkKzJl5pC4QPZmQrHW6sM/2dtCH2RHtqV1BLYTMj/5sMwzHZyrjzeCNf+X/sXOAezQ+TPDMgvkV1D/pZr2qmyxOOTiSKWwF+NxFpRr7RvZw3WCka3KKWz/72SnUwPRpB+mry9XzdjTE5D1DsTFWRLpi0YuAp5eszc553btu0xwD5ZnxlRM8Fct03Ntww9ub23wgqkYkNWES3+NUbyu2uppn5Vs/M1jvGHzr5og+t7HB41bjNwe0Rgu1Y82XbAzO5jkqI9uIoQOLE2Kt9G2Mlxn8WMOAIPZqHW0ZnZfPP3i+vV72diziiWU8I/Mmfwck9kJtyHhLQibOa//uGeeXmjWq9uA93zUTqA0SacOFgcon3tL3G0B8jK+Ta9p6fmCfK76nT9ZL+Nz7JMSTS1Zxajx0p+sZ9nGtd3NSwph
X-Exchange-RoutingPolicyChecked: 
	jm57gjgg0zx0l0H4VU5Rjq3tNMV3SsSNQJ4E3AJWmiiA7yqpbNmmi9VURBAGKdDPmN5y21JiSBt7gl7i9lqPrEYVtsDgiNQzsoWiEJ7M4q2AUPgJjQYpfE9tukFEX9SYoNg6C0udemzSSIA/S+EDszarDysFnRPEoXzZkRULRVwzpc2tXmRyUMNOk8aBcPGwO8xHP+2WY2R/e4nfrDpCeXrOhj5B1w+wOGRqf2zBEwaQ77C6pg5qhZ8OVz9cZ1q+H4DzpUszE8uyyx1tyH5mvO+OBhOFZD/JUnU8mTU3AWq0pzjdz6kIJNFeAMKD4LJBrMd99hpDoEhEl5QAR1SL2Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:39:01.7637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5af54bc-2fec-4bc9-2e3f-08def456f33c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4873
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfXw1x7jsUo27Gl
 J9Xl1uuG+EvuhmeFVa7zodm44D6ObJGJEYvSSQi1+gWkgg31lLimLm7u5IxzslcZZwcExDmUsMN
 VETMje5hhx1yr8yqAvtD+iS8IgeaKtopPGQObSdBu/arA9RGz+zkQU0V92WLazM6izizIQjWhSi
 H8jXGh99pjmrDlT+3mcRnDrMK2y+KSMGvupvOTmLBHeAX0X/zrhTzCUSWyyz78V6QQBMs1NRcGX
 Wr4HiM+g8eXdPYStu54u/C7KgV7Kcthk7nHagyh+ZnLyL8xPHI7WdPSJqJXu0YrrwaIRwtLwqeR
 qkS3D++Op2Vand5YXltrldJtUjiJzEB13Xf+/C40dAPnEq/8h61Fg3NntqLu7/Bu/bBhSyRbFYx
 d3KOgZD3j5QZnSRwZ71QNLefvFkrAugrR4Vwih/OWL+VZqD5eKwb+iYyh3c7rKijOZX4mOnWw4a
 4d+b9AHUqcgXN82I4Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX8fiOk9fpAGAy
 EUQVvvyTm5A4otbl/BV9APWxoU4ZRbu+o10g50gqwt+Q1oAWBKfg039fKokjoZ4BmSvpDeoWZvt
 C9QCXfQ5caZOB1B8KnHlWDOh+JR4ioM=
X-Proofpoint-GUID: 4yDvBZMZ5lWX2JLrZxMWXO58qwk5rDWo
X-Proofpoint-ORIG-GUID: 4yDvBZMZ5lWX2JLrZxMWXO58qwk5rDWo
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a758b99 cx=c_pps
 a=Okhg0g0iqq/spNumFXwzOg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=Y7y5GAGdEv-jaJFZO70A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 07:39:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20239

Add an initramfs-framework module (83-netsetup) that brings up an
Ethernet interface via DHCP before mounting an NFS root, polling for
the interface to allow the driver's deferred-probe chain to settle
after udev loads modules. Pull it into the initramfs packagegroup
under bsp-next and bsp-ti-6_12, matching the kernel-module CPSW driver
sets those brandings need for the direct (non-proxy) CPSW path.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
v2: Shortened subject to fit under 80 chars

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
index 7f62dd19..79100920 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -25,3 +25,6 @@ RDEPENDS:${PN} += "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
+
+RDEPENDS:${PN}:append:bsp-next = " initramfs-module-netsetup"
+RDEPENDS:${PN}:append:bsp-ti-6_12 = " initramfs-module-netsetup"
-- 
2.34.1


