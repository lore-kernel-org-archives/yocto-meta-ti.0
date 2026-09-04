Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C230EC79F83
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:46:40 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10365.1788515192051557746
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Sep 2026 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UkvEDFaw;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PhONgtEE;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68460jJI2945914
	for <meta-ti@lists.yoctoproject.org>; Fri, 4 Sep 2026 04:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7j
	jo=; b=UkvEDFawdr6U/19+Vow/ADWy4yfc8RNgX/KQZv149SR55cmI8Z/KKDP4Z
	PdXsIPCc7rS9ISg1xOYifzjhGZlUDh9croWsDeNB08knxWjcWUWgS/nQkahMlxsp
	3YRWA1wNj/2ldJbPYWXGEFAKdZN+pHzEwyxmc2ykpsErM24FQiKGvYgz91W6Ciyk
	yURaSf41d6ayOh9gvKKSRUUwgLRtqb1Omc7NzLLGiJjeaihCftrVEl2B5+JgwiRm
	kUDwbxQSQCkiAKqmDJ8VOMAzq/68TE2/ywYzF60XQ1SvYiTSGvhHbhY1I27sJezI
	CtkKzs/rrCUKGseftVFBnS/yLLmmw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gfk4xtx8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 04:46:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTYMAOzQ/Ig13pP89AN/q9bTNQsUb9vIim6uypnFFspSsgctcKyMUf1oFWH2MSAx4KwHAE2avvIY8TBPE/Yk4k7kTFPbF7ig6sXFLpcCRyZXiBvuEEG0Xj2jr1bLxluAAlyo1lpYW1V7rXTisk+LtR7SJJA87jgXx8sOU+0Q2TCc2ZpxDtls7bpwBhua2D7lVBVfADvKYmxBf0vfBQoUB6SjuR4aoWDQvAmjUiijHpOcY7rJ726Ou7Y+BGUKsa5rdlqR+wAGnDA70475scbMmy5uq7NvBpTDfhjvyQVZdM7AkdKaDNkbMHmPuMHQWerc3jygAy5Xgph/LkIyFN/BrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7jjo=;
 b=zJKlZrfnMYZBYTSTZOkcl4X5Z/YhYq++oH5Z/uqwbFlLwh7seSFMcn7jO8LDD8FZ+KsjrXfE9dHAQO30PnXqLWJCKaB8BMB88iwja9F8t16TYzH35ohv5nFzf9By4fgkKPVCDmBAoIuKVIprwgJhK14Lr90WQQpvBhnX2/Z9nELN8cuXNnMfw9Zc3Cxo1TkP7Ki75Zwrw9Y7djoZ0Lc9xC2ihXf51SHdOoz6uno86CliCRNRpO/8QAUcDCsU0swmeP3qAJ0MykWxiyx1rE1D8Efq4jTfH3ifDshoVE/WW/dP23w/9KdpwquxTkEPFZ21Gvi9ac28aq3gevvMRO1Xqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7jjo=;
 b=PhONgtEEu4LfIbPP/ncdleCGh1lZOecfFO/Xy9NYxoWPJmltMXWeyTOLAOqJ8C27vrd7r1MZyaY8c7JqANiBAblP6nJpXSM6A1C8AYjsNCvZWolZBZpjqLBkkrTUK0TIl+7TPiFLmXrc2e1B+tdMHRHQNYSLqTH+ZfnBcR6a4a0=
Received: from SJ0PR03CA0167.namprd03.prod.outlook.com (2603:10b6:a03:338::22)
 by CH2PR10MB4165.namprd10.prod.outlook.com (2603:10b6:610:a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:46:29 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::72) by SJ0PR03CA0167.outlook.office365.com
 (2603:10b6:a03:338::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 09:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 09:46:28 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:46:12 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:46:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 04:46:11 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6849k6m63272627;
	Fri, 4 Sep 2026 04:46:09 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>,
        <u-kumar1@ti.com>
Subject: [meta-ti][master][PATCH v2 2/3] linux-ti-staging: Add dm-verity kernel config
Date: Fri, 4 Sep 2026 15:16:05 +0530
Message-ID: <20260904094606.3233160-2-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904094606.3233160-1-a-dubey@ti.com>
References: <20260904094606.3233160-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH2PR10MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9b4ecf-18d1-4808-4c12-08df0a69649f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+xzRjL6AkhejC0KxS1cV65l2QQkiPFcKpmHuISH2yzHX4bcBcJ+ycZFU9i3bfIoe8AnnDOB3qaAKYkLqLoCBVyV1eUnIZ0Utc2X/wxTT1cm3BnPtMakWKfuoIByTRg79e1j5z75bDlV7fSojkr6Z5pE9arZBOBXAbULULTJ00uhgQ1t4vA9+aOI1ECM6v72x5BxIi3eR9vrcE81kFyAwXJaLV7roMG2wcztLX6Mw+rpUm+O9uqBEO+D7GWV0Pp+15pt+53KOxLnTT3aLwWfkm3v3U1LmGMnuD85EUqnP9Q0X5aMHX4OQsITlIP1IdV0kRbi82Zsaj9+8EEjujhpHSugpEAcgq+Z6VjKILP/oJFSsHLvNXnZLnNGq2LsKc6WqkTKWq7pm0NATlKNeEqVixIhEM9E+Syizv9NdfCr1TgOeYuUM+zkv/33fFe0T1tXqoVlfa/JCFn/Z+s4KOHWgxk6ZL8KPr2DJMITSEHGskTsMTxNuYAWnJwojEWc73WDT9n5b05asdZAtcDgNmY3m0BvcwVHOWgKBzp0bTv6hYLYxRQEYo+SqlaRKyWdgu67ahYe+mb2THhzL6EsRtATFK1gOQqgXd+HUoxQp6eW8+i48mieUVwr8eIKbkDiykJojyWIp04b/6dUkHbfU9EAerCZ/3KIEb0DAdnsY9ziRM4byv4Yobjaodd9aSNf4W5DsTS7ODMHeDchWP/ITGmQSUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Aj3K9bOUH68dGVenl4sMy9cCwIYMU1STC7hCvBZzKdsuOUeFB6+peL//xnK4r++ISOD7zOJcvYYmD/hQPpv/9E+EouoNN9ddpowZuHqOuioR9aqCbnY02SHkH0SDRotSMQAo+k13xAnVjtwpGPr6lbW02rXbJ3/CORPVe7yUT7ZnnOEVjVDmD38TMsqMjCw480P/09YtKFNI1oG6pZCGKPul0ub23tG6Yq3uNci70RvYPoFdImmg2CzAr/Jz+7vfOd2+ElDggmUxBVKMOr1MQmX2jI3fZmLdw7md3Fzbyc7Ho5Wh3O87xpw9UcpPWhpN0yplLqbfDp+fMnTEa87t+xzMl1vnt0JUW/auH2e1T+MBzmYNI0I/8iMEchnaggFefGB3qTx8PAw9yz43f8daS+SihEe3ADYuo877O0dw48985dMuvsduB6eSVQf72uIP
X-Exchange-RoutingPolicyChecked: 
	aL1xZxu61ysBsQPun3C/UDpdBC9TcgsKMEzygkHWuaAZl3+h+cCcG6bRKqq0rMRhsHZiGL7mjNPU66nkleZg0IUOGnXEmf9nrfq1RRh+cOhX1oc5WugOZJY78u8WuV4kx6EpZ/RlBdL0HiCXb2xl4bi2k4pTS/JSBA7EeVhbUob4ml/8i/scVcD5Vb+6dP8suUEV5cfywB4RF5CiQJP2usAhGd+1bPMT0BM64BSWTnaHaBcIXx2TdpnZhe3ppWnPn2FWGdp09biQC9oNXwseRzm/4O3z0e0cRTJzxaHaaD5S0gGwD/s8J5vduIC+u+tA8qa81LPC4LpiVc0UujBkmA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:46:28.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9b4ecf-18d1-4808-4c12-08df0a69649f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4165
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXxj4INjSPrN+g
 aD2TTIAQXfr2N+lSvvNoNsOtnal7t65lfauHkefw1BxPMEC+tlcQP/E2cL8b93YvxmPAIKHDdPH
 PzHTgrTca4DKAEE8+YAXBkmx9dxZJGo=
X-Authority-Analysis: v=2.4 cv=TKd1jVla c=1 sm=1 tr=0 ts=6a9a9377 cx=c_pps
 a=6XSCBLYFY2RPGp+89yprvQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=dVGgIH8cX6fh8FKggfkA:9
X-Proofpoint-GUID: bpxY9Qv-BzrHcBqKd1UJVnfHL0v3g3rU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX4KN0MJmEAAns
 blBQll0FIgX9gWYfmevH5GvWqJFfEfuClfzAKOXNYUzL48RkYa0uXPkBAn2MMcMqusiYaXkdvEw
 zmcOZ+a489LQY0fDx0kyOLsUolNk815Z2otQs9U+dY1oOLO/wQbba2OR6noWnH9+2RBGSrhFV7o
 9zuPc9FZvxsIkcpqSZRzC7pWoXaSxNMvjuL9u6Sr8MSzlwDXHrFxSX3PGT6E+CTyA1LLj04LXJM
 gwbW8pYrF/hKu5NEIcpgrLy1Nz7lTeoh410YbN8yawQXPmJhF4XzO+IlBBdXlxKou5/LsjowQgi
 r32qGaKh4nd+mF13W+izrMlzMgerfw2elCizjAOhFbICDxP4FTxNZvu02WVRXSshvYmAXbq5w2L
 vFBNqxs+t07bZSeQGBpBxMGJdn9Qhl37/DDP6sGgaNJOVjCWRoR9VXYkkGNtd09aCss2nekvPIA
 vgkmY7kiVnL9qOsHTkQ==
X-Proofpoint-ORIG-GUID: bpxY9Qv-BzrHcBqKd1UJVnfHL0v3g3rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 09:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20326

Add a kernel config fragment enabling dm-verity and its crypto
dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
and merges directly through merge_config.sh.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../security-layer/recipes-kernel/linux/files/dm-verity.cfg  | 5 +++++
 .../recipes-kernel/linux/linux-ti-staging_%.bbappend         | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
new file mode 100644
index 00000000..c50ce403
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
@@ -0,0 +1,5 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_VERITY=y
+CONFIG_CRYPTO_SHA256=y
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
new file mode 100644
index 00000000..87bff5c2
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -0,0 +1,5 @@
+# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGMENTS.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.cfg', '', d)}"
+KERNEL_CONFIG_FRAGMENTS += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', '${UNPACKDIR}/dm-verity.cfg', '', d)}"
-- 
2.34.1


