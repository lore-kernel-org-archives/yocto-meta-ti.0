Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4412BC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:32:53 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13940.1783531964031870495
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 10:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=i7sL6J5R;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=opF5+a3p;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668GHIlI2792060;
	Wed, 8 Jul 2026 12:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=enQhWYLg7uj+z
	u2mZ9u4Zhw3A6A+S+/5chQn+eNFi4A=; b=i7sL6J5Rk1OHQ/ihpJXsz47iW2OOC
	XoqPJ9OnEovkSQmmE11n5n6BWBKIk5mlUa3MqBPgN3L8qCohHlakaj0zD95zM986
	0OOPU3gXSXldrAgOyfOSlBnBl7ZTc2aXUa7IYJhRi5QRK2nqmjolC9p2MF7ytdPk
	FLAkdCe5t3n1fjLf0CaV9ji/gcXOQ31xLpWFy3YOTPvZTH/zEDAygzTA8JUQTZ1R
	L2VQZilHfEZY2ikwMHpfgGZdGsOuKOi4XvpIXPWp+971xQIjOBd7EMPPXlC2I05Z
	a1It75182zGlzG5yRXPrbh4QP5beqy8ACjntNw+J55f3pwH3JmiJurqpw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9ng32jf1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 12:32:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFzYFcpnx0vreC0aXW4sH5cJBomvkmBFs2IzhZyy4tdI5uejFk4wiGsBKyKns6mw7YsZBMIbnzL7ZV6615OgfvonCKn/AtjP9pyrY3FjH/FLWQGraDFyCyjWmuNSDpbuJj2WGvsbpa8/AqRxd+2PlPEELcTBMunqGWSs8Zq0/4vqAVWee7FELEPlmsdZfEqHdmMjS09v6nnHZIukixxaoZVYlDIfCzEoDNPfkW7J5sVVCeScOj/UG8JkWcXZjFpjXu9HVFQaYVb0LTY+X8hywEpSeM5MezZgPxF+2cIEuzaK7/ZmdvDrgCwJvn0x4/x7I/2PV5A3Bs+ND94AoXZyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enQhWYLg7uj+zu2mZ9u4Zhw3A6A+S+/5chQn+eNFi4A=;
 b=OgBALzCIBTNFgYOKGGyVLWuJhYmf//FEfcg3WeiSWQl3O2Z5s8WzELSP3lgI3sC+UqV5WYM3EMa156EkkRHFv6yi29AhWbpqa0K1xakH5oHTmUvIKZa27Wb7Rs64LrMH7z/f+UA44pDymevR20nYbBISLCHv0ntBAWek+qEKUWEEPI+r/TNYG+iwodRVqvvN4SJaVC3cL7k7kogW01fXwAZC5/xNFZvZ4ThS9ZqWx6msk2KU874KQ3qhVTYUg6B3mHKdGrzFYBLasgTkA//WfESrM2j8VH/Fb6HunKcib7kvhYxepSaOfgKCc1WWMG8NLljoG7gqHcVtTMJu1CMAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enQhWYLg7uj+zu2mZ9u4Zhw3A6A+S+/5chQn+eNFi4A=;
 b=opF5+a3ptxujlWkC1lFYsH4QyfRaQhnWxvk3nJFgeUwC9tbN8t3rG3XH9zTQPpQ2jlsO39ZfoQ65dnQRbtlpR0BR2Pwk/IndVEP6LGoc6kKzfcO8dLQOfXS2vfTvo1FaXify+UXtVrkOUxnq/y7spXXl35SsmizSe5tTTr6mj4c=
Received: from SA9PR13CA0156.namprd13.prod.outlook.com (2603:10b6:806:28::11)
 by BLAPR10MB5172.namprd10.prod.outlook.com (2603:10b6:208:30f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 17:32:36 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:28:cafe::14) by SA9PR13CA0156.outlook.office365.com
 (2603:10b6:806:28::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 17:32:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 17:32:36 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 12:32:35 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 12:32:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 12:32:35 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668HWZBb3353862;
	Wed, 8 Jul 2026 12:32:35 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1whW8R-00000005pic-2wDR;
	Wed, 08 Jul 2026 12:32:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] firmware: Update license path
Date: Wed, 8 Jul 2026 12:32:35 -0500
Message-ID: <20260708173235.1390439-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BLAPR10MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f102d8a-e498-4a77-f39b-08dedd16e6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6uEVjI4jUHphFwRYRBPj2DlaNN/aiNqiSSLHPH/Mcajt2OvnazDp+/iLMYzvOC6lfKyuBE72z6d+lbyj7DhF7mmrIZd4YWDXhkrShGXRnW176eTzY6VJy35caBCtsDsR7vqtfWVloKhbmOadJJ1GVuL7n0AgLqU3MZgQSvFkn2vPjE89ylrB+Tgq98bHGvYTYrtWS6KzFfftPd9yGdpDQ8mnMegxrzNUu8b9zPXD4ALgzLRigNvK0u6cxZENj/WTSvRBbTn9UbiNXefXaQ3vMfb2/dAmYQatDh3ONNXLgEfHGdfvG5OKuTz+BwHpxkdB8TZtm/Iz/ktYAMsEA7nOUsgRY3+mGreTIP7luTws9Nz01wBCeL76BNLZ6oEoujhDJZ/6X3RT6roX6y4fmSe1vC2VXu3dnIb0Ta0K3Ik/VGcB3nOIbbZBnZL50JHBh3OxC6BgMGo6Cy2PNtA63kK26V84FiRrpppINNIn+Dg8XWlj2Z9WUUPMWk0IAhuPjOOFMK2eVLLfxt7sZcZvh+n+dbzVvD+L1E//gGNXYdI2JWjGpdm+W9pi/ds/RqFURTxyBmSJFOYSEO4ztxmEdLc0p7Et69zOOH1W3v0d+gcm+WVS4wtH7+dY/uU0Ge8pvRliaDofN/8t4QFsjpYXMgJkQd55XJeRymFcfD0YTFHiNWxQmYJ7dom3p+iemYyQPGNPko0nUo7qJwa73CVd8lgceg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2wU+WRy/0os2s0JdWtdhUDvMqYf+5YS8AQGC4ww1yB+bBeOsEhRU9mbRyQC77q0aif0LFkOkRtBlFpuiUoBWEjCwCH19utl4Xzl8efSPVSFGLt5gJgo1dE5Mm2+n/3k55Q3uBKQzypX6V6YvQ+oOb2ejTZSn4fva8E7wcd4YKxtXsYO79gS7whkf9QyYLM2Ps3If6JEO1Xczxb6kohn/WPnk5GxtOntUEmx9PNI/kZLbd0IC4XIKB6fV+wn9DiQ4szp7NESClLVZq29SbmkXzViRA11M+rCMNoBDmjcicJ6tcy9bExml7Oqs1wscSBk3ackB7v8u0moYbmzdfYTd6wgX2XtJ8wulnV/P6FKbyXBOp7iIn4flVjKAbkXCfsq5B0lB4kzaYush0D3l1TuUSrHSVxlhz+XNUOJF9eHbsezW5rqPm++EsP1q/I1h4m/t
X-Exchange-RoutingPolicyChecked: 
	fwPivYUYnTJoPctG+TdCLH/Ub0f3yibSGRbXw6X7RxT7HCF5OO0wl3I4OEyYsZ/tivj//pGxwJBcTsWmEMpJklCkXRB9HqvOcbOzjvK+o5AkK209I56oJuSf42EyN3YqDaByFlrFuUjW2Jy6Fined/aUutSEOnRI3DKZy+tA9NA3VmA/sQ/jHMV4Y+z4RFHfxBAjr1oZ1aHL6Af3aeOMrE/WaW/wprTAX45+Q3SBBXlW7mDvlEwM0aCCs4SQKtUJe7QoJuNMX6I4ihSYT1Q9QT3V/spvi1MSkSLZmrI6Mp6MwKSpRg/lhkfnc/V6ZFv3V/NDTDxjDFNOGY487eKKbQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 17:32:36.4190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f102d8a-e498-4a77-f39b-08dedd16e6d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MSBTYWx0ZWRfX6qDzyxTnEBvl
 XTDrgSHJqXftfq+1xK6EtVZRGUo1ZOKHwxCT2nYPczikFtQXOw3ETcVvEGHHAOIj0xX39JV5kdf
 fpXkC7SHqNhMBsmcuUFhmp32lje82FG/hUrr62s5JSv1EJbOonCz9ZLKEmSS8YLdOJMCqzlI88E
 Fm7HIw3wChxD713VR6PoUHyb6Doc6sRJjfFxwsBCxrWLWU7Ptq8r8n4y4liWPnmHzX6D1SLMQNS
 QiG3t1CvbzUfCy8VKSPC6rkknnZMQP8/TWcHcTh5ou0DO8zR0k2lwMPN1Z9iwq16Y4+VgjQnjmK
 9bIPdsmmh4zwWr/Q3XfTYF9rsAPlfJ+xyBnghmdqKz8KR9tbHx9PYC3lM0dTCqjoH2D3paC0arL
 XrHJDbCCHCNkrBr7i/1wHF3uPD2Zl0g4Eg8dUVju6f3nMnURABaaG/qu3Mm9QilJzlLGJJhOblR
 HjrtWT12fYguoqkRt9w==
X-Proofpoint-GUID: omMxDJT0YqkfL-x2wnd80cu_79LWMGYT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MSBTYWx0ZWRfX/YixyiteDpAh
 cwIO+/UBmWl+ReEDwkQnsORBKqgpu5Jylg3pjkoZVDt9NWOUmYgklOU0cVmIYOe5OQ8bl/SumoU
 hOVU9a4Y0BcpeiCJLdYYb+BG6WN+SQk=
X-Authority-Analysis: v=2.4 cv=OfaoyBTY c=1 sm=1 tr=0 ts=6a4e89ba cx=c_pps
 a=JgOmb2+ItGzuqF5frRSN9Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=z5F7RAkNL_eyAAFI1_4A:9
X-Proofpoint-ORIG-GUID: omMxDJT0YqkfL-x2wnd80cu_79LWMGYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080171
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 17:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20130

The licenses were moved into a sub directory in the upstream
linux-firmware repository.

License-Update: Fix paths to new location.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 +-
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 97363b2e..b25e04d2 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Cadence MHDP DP bridge firmware"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 LICENSE = "BSD-3-Clause | Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
+LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
 
 PV = "${CADENCE_MHDP_FW_VERSION}"
 PR = "${INC_PR}.0"
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 95bfd01a..e2909014 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -5,7 +5,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 inherit update-alternatives
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36"
+LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.cnm;md5=df3992006621b797e36de43f36336e36"
 
 PV = "${CNM_WAVE521_FW_VERSION}"
 PR = "${INC_PR}.1"
-- 
2.43.0


