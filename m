Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5092DC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 14:30:52 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10045.1787063448720730337
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=gUhz/JLH;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=k2mSPZgL;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDuHr23683799;
	Tue, 18 Aug 2026 09:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=VM02xOAOB9wHU
	+d9dxcjbDk+qyE1Uurx0fziJeRxgq4=; b=gUhz/JLHvhv2Bw7C2vukug0SwovG8
	UBD6K0EderXzH0T5PFUD2ruRKsQV+qte92AAtlN3z+tPRApzaocHoUiNUtMEHKya
	NRQrt0+K4IzmgzAdz0cWsZWX3mtp86soUoMHgKItgVgIuf6YO/FPJszl2gE6Vtf1
	LbxYyMO3xM5UYEchla3oD5nfHPYs/BzNuqr1OD343xBtGshseJu8ZwkdUnIYTiPF
	RpxcIhi3Y3bJtQVZkJjsqxI1kfioa4MgKsHAZhGNOl1anzLIp0w94uXaLfEU+RMM
	YdjgWpDsR65UckGxDqxkf4xLdsI2uzoCvyHY7Q9KZyHfKVNBdeMYOItvA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4mpk1fkc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 09:30:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCrkytASYrORyBOGymwhBXwHTMWrSee0/BYoZWNhxIA5hF7gaL8m5Aj4dsnwYxLVGm6fhvApoWIWlo+nhyTqvd44nnShrUxySug93F0VXBMRCs5rBv/6srZ1RNzQqYCaBWes8JZLYP7ukpsTfVh0Lvk/2S6WBJAIVoX4dBlVW9yn+EDntIp5pbMw233AAhHcINGWFXeEnX5L3OSn3KIdbqCs54LZqNlAjTFeh+duMKeCgkp6391d8jA8J4ZMb71FJ4Y/4T5EvEEfffEyeyEn9ditzotif5kZFM7ZAuU71h+2ugNA+IhKRMefFQO9d+Uu6RyNR9FAYNBA+XQMOM73rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM02xOAOB9wHU+d9dxcjbDk+qyE1Uurx0fziJeRxgq4=;
 b=CMlzMNZBMT8Vh8YiBas/7C3IYa7/YTOT3Ls8kVtWQZl4tTjEqaPH+Z5Ra0r4Y0LnQ1oAKvniX3NAQBeTfZN2OlVWCRONp/O2WKkkijymUYHquTG5GYPxB7DI+zaClKr7pXFRq5arQTJTzfjg0p67Skgk9/cKwKYf0wyc24R9je/97UJLcSFcrYFbQFV8lZ85NfNsHp9yVyfgGBBs59iouIoquU6di4972ft6HBaoX9Bw9e1acjU6+aQBG50H4Cm2L6gb/XT9D7QjtoafOjhwn4ktY/laiLyLk/evlMWzyEK1meYBazEuedaJWhKgjIFWhq3app0dQQXJnzOkiaq+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM02xOAOB9wHU+d9dxcjbDk+qyE1Uurx0fziJeRxgq4=;
 b=k2mSPZgLrVb7sr1ZCGIgDeuADrUJKXSP4txkw/iIW5urnLjBLujzLAdSPsKMm3U6dpCxjoo7ZzCxwWf1hkTMQ5JcaKx5zVQY7Rst1fxLccFm0J0s49siVjUln+632ghsFyuSsPk+13YriH4remp0qSMC577FzK9B+VyafHrG3ls=
Received: from BN9PR03CA0260.namprd03.prod.outlook.com (2603:10b6:408:ff::25)
 by SA1PR10MB5712.namprd10.prod.outlook.com (2603:10b6:806:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:30:44 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:ff:cafe::57) by BN9PR03CA0260.outlook.office365.com
 (2603:10b6:408:ff::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 14:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 14:30:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 09:30:43 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 09:30:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 09:30:43 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IEUhl81592131;
	Tue, 18 Aug 2026 09:30:43 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wwKpv-0000000G6CK-0oLw;
	Tue, 18 Aug 2026 09:30:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
Date: Tue, 18 Aug 2026 09:30:43 -0500
Message-ID: <20260818143043.3837065-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SA1PR10MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: 999a5e9b-91cd-411b-5cd4-08defd35494f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	lH6oyykIQYHkK9td21V/R65XkbrD5OYYquuz+UmuKrW08Qjo/NFiqtQ20sAXlz0dvXeTPgmOem3i80YATXxcrLsMEg7+a8tSHLmGGcI3F6YoXVEfpDShATVnabp2ra1Z1gH9czBu/qe/XgvDxN/Dv9S+3XbIwXv9T8zH6DKlRJU4aA1Z2Z5YCGjDAwpOUJmGUsDTzKfx5vcXIZTwoBeOHonBO7MGUTqOgVULLBSBVWjsc+vRFb/oWu+4T6/BubYd1lDq/c2yCUNCA3zTpPO3JW3Nx2EPis+vOEk8ZNMXZmK+0U8K/oB9Ig/OJO26lxPFVE0KCmyT9RVdGyU0gqaHcXQj3kQbIEHmrU3S+tCnAsfyxPONLe+fJTpRtgq+dw3DJNQoZ+JjK0YKYgtqaqTHG+K3VpAohPGyLvY2NJhVtfuwp3Gu6/g7AVriFVog4DAqlrDLGEKly8gWWvsjqdX6kBu8lhJmOFt2xLtHtjmD3JnbNXIVybnm/7brVIvVf3frxzzP2rA7TX6E6LrpbaUg9fe2Iaz2ZD2phENfzTe0AoOFEU/XG7ducX+0H/uirq9qMyGHChXj6e4iXJ8ItfDLym6F7BL6djzDbvEHQ2KBscb9xNL9PHh3hSw4dcpV28ZGCP4N4c9MzE0bCRUaiu5KxMXWLY0uo7g6ZGSZOUwnuUZEpWwwbdY5h6tDgyXYiIcLHUVWD+NJ2pjTKacX/x1Wvw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	45NhSfbn+MMUGxcJbwfFkddfcSswhHF73YHuoV+jQ3BNyKJc07GB7Tz1k03JY/ySjA5wsJ3lGVX+1fE00KCLbU9N9vH9ITXnU2zkY+CqUGwQ7C/V78GylEj90vvQzpJXAqGEa6VQX+fOMOmzwAtxQbjVlt7nIk/849RBtAL1ynKfrC9ruurxigbzr/a5lRDJ5qHqJF4Og26Vq+2G0O/OkNcuA4nw2UjxyDGVghEu4cZVKwl2lM3qHA+9Xp9yENrHpSjHfXEFTxZ3kkpXHTcaxjTXthSR2YAccfuIzzRV5hXP1Z7Yqw7EloWNZmijdbD7taQacKB5e8zvOAC+d4wmi9/F7/5HAOnjuKWAeS4k+OvxLWKj2+Nf97j0J4SXsKUFMVMmaq5S+DgUubVbbXoaNVLSWJIrGPn4+aqesfh/d7nMgXHUKVxbYRz7z3/TDbAb
X-Exchange-RoutingPolicyChecked: 
	gJ1UjeziNiUWWt3PIU0mPmPfPaeYKbt0ys1eNMYJKsKYpGhXZS+DpihYqsqth8sF83KKtB7lsDT6BhAfqe74t63lxTXMOENbb6Kg6pcCzK/5dAhqt5vgTeUFivcHSD0ja0r+zmdMoFHzLx/X1cmmLX60TvabbAKwirLSjAEv6krg7vVvtJ8U3zUteMR2WBdP2Wz6ko4du2YmCmZgC9RfMfl3cLihr/pdDu0xvNqry8I4d6sHOq7hihO44hS0q9y17RlJO/eCmW+VAwwhpt96UHu4ul97IpNeEU9DEDLu/3d9ogAdfb+LiKd3McAYeHvt3xrqmhpLkC2uUZM/NX9Xow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:30:43.7028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 999a5e9b-91cd-411b-5cd4-08defd35494f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5712
X-Proofpoint-GUID: vy0HXPsmzBN_X-qbCMU6c7ohx_wKhgXF
X-Authority-Analysis: v=2.4 cv=Ytc/gYYX c=1 sm=1 tr=0 ts=6a846c96 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=63sAO6UpSDpxqliMaFwA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwNyBTYWx0ZWRfXwqQjF2aHvtNk
 NVzMbOs4BdQmIsZzUIhpcjlHtZ6chqkyYFl7JqJjpG8KFiaSIJLNXGITLXjuSzfjsr3m7CALmZQ
 mTBU9x1kz3ZTO0vmiDYsNCEXwIhp0PzBB6m8sqQ+d4606ntVT9zurb9XFSPcfw2KiRemjcadsup
 oE+F/x2gq+Qc8fvM78F7CXz4kpnnCwqHDA41dE5/e4HdaoulSrkU2mwfT3J/i//dA7n1W7/R0zB
 pvmyYewvHFUIk5m2Yng3bTE8K97/01Sv50RC/V42imIAlZQ5Gilf9cDI4zK5QLzGxoZr39Uefad
 4CIX/zo8r53spyJgYjDxyzZcy+uMaO06PoXbolT0dlaG9iY4J99iHO9hh6fvsMZyyF9ORYA7kmK
 +vUHUOk8mbZ4OtWmwvtaVuN9BeBzTEyjIoxghnvtJkvhNQ0nqsD1dgcwV0RVA89uBG1oJop3xCH
 BZW4fsVhIzlaaZpjszA==
X-Proofpoint-ORIG-GUID: vy0HXPsmzBN_X-qbCMU6c7ohx_wKhgXF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwNyBTYWx0ZWRfX11RdajBSUqbp
 jbwB9eFXDRXdYuM9JOlUaDd5HtYzKIjD+6SScUiWSP49ggaQOUITncQhArd0aX1HNewdGmHcvu8
 8YM1Up4cZ+d+knPBPPOTKcCHek3mKx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180107
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 14:30:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20273

Two oe-core changes [1] and [2], have introduced a change in how the
kernel-fit-image class generates the entries as related to
KERNEL_DTBVENDORED.

[1] Corrected the support for KERNEL_DTBVENDORED when generating the
entries.  But this broke our TI settings and caused build falures
because we suddenly had double ti_ti_ entries for the default.

[2] Adds support for KERNEL_DTBVENDORED when figuring out the value
for FIT_CONF_DEFAULT_DTB when building the fit-image.itd file.

With both of these we can drop our custom setting of FIT_CONF_PREFIX and
update the values for FIT_CONF_DEFAULT_DTB to match the same strings
that go into KERNEL_DEVICETREE.

[1] https://git.openembedded.org/openembedded-core/commit/?h=wrynose&id=2f47b623ea3d8b25b931e43aa751dc145c97f8e5

[2] https://git.openembedded.org/openembedded-core/commit/?h=wrynose&id=d78d6a1e3d79385c6499764c4760d46d28f3cd35

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62dxx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62lxx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62pxx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62xx-evm.conf               | 2 +-
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf            | 2 +-
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf            | 6 +++---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 1 -
 8 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 01955470..db409e5b 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -30,6 +30,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am62a7-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62a7-sk.dtb"
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index b723d457..08dffd98 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -18,7 +18,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = ""
 
-FIT_CONF_DEFAULT_DTB = "k3-am62d2-evm.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
 
 UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 5104549a..7a422617 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -17,7 +17,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 KERNEL_DEVICETREE = ""
 
 UBOOT_MACHINE = "am62lx_evm_defconfig"
-FIT_CONF_DEFAULT_DTB = "k3-am62l3-evm.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62l3-evm.dtb"
 UBOOT_LOADADDRESS = "0x82400000"
 UBOOT_ENTRYPOINT = "0x82400000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index bc056e6b..cbae21c4 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -21,7 +21,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am62p5-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"
 
 UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
 UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index dd91ae66..5f75943c 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -30,6 +30,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index d1f6660c..44fc82ff 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -24,6 +24,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am62-lp-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 252a0380..8c5e59de 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -22,9 +22,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am6254xxl-sk.dtb"
-FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "k3-am625-sk.dtb"
-FIT_CONF_DEFAULT_DTB:bsp-ti-6_18 = "k3-am6254atl-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am6254xxl-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "ti/k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_18 = "ti/k3-am6254atl-sk.dtb"
 
 UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_a53_defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
index cc90d390..d241954c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Generate and sign the fitImage file for TI Machines"
 
 FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PKGV}/${MACHINE}"
-FIT_CONF_PREFIX ?= "conf-ti_"
 
 require recipes-kernel/linux/linux-yocto-fitimage.bb
 
-- 
2.43.0


