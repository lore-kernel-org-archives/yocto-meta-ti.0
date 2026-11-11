Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7768.1794397852647969867
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 03:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=f3+9Pg/K;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=DXbt3O3m;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7MGcK088696;
	Wed, 11 Nov 2026 05:50:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=J4RR6c8jt/uNF
	usX2dmyunsUifftIwiDWKWr98mltX0=; b=f3+9Pg/Ki6dbqZjdqBkR0iMY1f8jw
	j9HDVDdMJu2C/q/6eo8Rt7YTV/6SjhqOBBOf0OQyBJmzvLJ9yJgmesoe97Yci+d+
	lleRq+kDaLplmnlppvSt5SQpUSqDU4UzVTlzD5Oq2/+Rw9IpF0VPkcTU3rL8xR0h
	nb5sGPmwnNmYr2K+mRB6k5C5nGteMtkI7U0oTE0orAMtI4kAWVTo1ydYiixGzqlp
	UcsjMtLUKjUSdFQWAKmqpzwEyqUhOV0WHDNw2MJHilgZcfsKfInLTqgmU+KcSsVE
	TQ8omo9kvnHeDRH0y2wf/bFPGp5UKHB8rPET3T8+CFsZuIM6igW+Hrv4w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjvgme-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 05:50:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tzf2AWHxPm/pKg/Rc0Q3OtSyPewSboUrKt9jJY4ioowADG7tdYX0GJJwiI0VxRm1JvK8zrYZZ7uqncsLibNq5hvran24jiwCBlv5M552+u1DQL0i9AQZiPZ4ZWV2Gm4x4NK5zZahOipDGa4AYw0Rel4kZWT0NjooWLPpvggW7V/ILtTv2UjHalSW+ufHIyb2Mdj5cgJL9McpGf2uGiZSJGUq7a7MkDFAxfJvVX9xYSGHEor0S1YPd+r6m3VbIcaIroeagFdN9CCjLjso2/6Qa8Znp/pO3iMF4m+ecW8A5u08DTjz5pg6F3oKmJk4ebQOwXfgALd1XkRhsNV9F0NRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4RR6c8jt/uNFusX2dmyunsUifftIwiDWKWr98mltX0=;
 b=Rv3q5UScxjlhJFNpomf1EEB0lAjaYJu8ARQeoKSnoxDfGDRe4t0BENjzhJb31Csrr+sIMaywSuRJLjkqE61qx2Xei+tB/rT6IfWU0C4CU0nUKWAbOOfKx6/eWtkXaUCuX0ydFmpmu0+MJcS/dltCfEo37RJSwyfZ55JpRPrA651gT3t4QF5rNt++AJQSQKDBGtTz9XG/tAmQVpWfVYF0Ey8it9QYrLq8jFELdhOX2ZRMF0RyC8wr7Ui6OmZfo8S4/Fb4JgExtG2q8wcYLE3W9eW2h3XbcgqwtWFB52RHDJPnGvrTy2dDe8TduTIFYtxsDqcbUufSd6iAuOkiTetzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4RR6c8jt/uNFusX2dmyunsUifftIwiDWKWr98mltX0=;
 b=DXbt3O3mMyIHpzqo9V4nDXogU3fn3jDyy/jlU8qJ9dYwg8rWkdyWTSIUswKcp6WLp/KP2r7WJxClaITekcIxgHn1GaJtA4qri8nYc5PH+EpEOC2rdw0WmXEC14CmyuIC9yB7a7uGo0mIjS3XKyUM+j2pQ+XB5bqYMN2fmZYHeHk=
Received: from CH2PR11CA0015.namprd11.prod.outlook.com (2603:10b6:610:54::25)
 by SN7PR10MB6406.namprd10.prod.outlook.com (2603:10b6:806:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 11:50:48 +0000
Received: from CH2PEPF00016D47.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::e) by CH2PR11CA0015.outlook.office365.com
 (2603:10b6:610:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 11:50:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00016D47.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 11:50:47 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 05:50:33 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 05:50:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 05:50:32 -0600
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABBoUeJ3837088;
	Wed, 11 Nov 2026 05:50:31 -0600
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH v2] am62pxx-evm: Add tisdk-uenv configuration for display support
Date: Wed, 11 Nov 2026 17:20:27 +0530
Message-ID: <20261111115027.3278105-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D47:EE_|SN7PR10MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fce4557-de72-4ab9-8402-08df3fea06b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261022115727099003|261009223027099003|56012099006|261022105027099003|261026140227099003|261022075727099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: h/iLvPNoy9nuRZNUWUAk4sXCgqtuzMU3zEn3j1xsUl7yIiVgIougYw/xJGacEQyGVpUsKdTmu/TzmDZAVpgcGyt4gL7e1SYTgcDFM74ZrpmTZ8wX8RCHWjncEVR39pTBKXNTiQIavyVq+kcAm5kRrJ8/VD/hbBZ4dlTja1xQUGm7eSRd3MNN+WCjhDAC8aku074iUL32PMaQJohMvHGqGWvoikn+uz4JmDtyEzSV6t//YK0yP/LaFDPGxtvEJZEtva2XwmPphT96iPHKMhEzx8DotAgteRdeI/4DfDwJQtqE8b6Nhb/rI1g9HZL4+XEK81h+gL19J3qryrbvHKHb3j3CmUB4wZM4S/2j9omoovWgi7PmCTI4XWcan3wDOCRu7eAPioTJ/Dw1F68A8s8Qu0Hpowp3pb9DzWyDdCgr5SvRndd7FznCYvlQ+nZkYk7PQ/vtA1eb09AoZ0Zli9btoQPqKag1uzQNldceFCpHJtb3wkCOW7O1WWe0cHfxHaJjf5sHuPsMepKlZQDwNZLvEqtR3dbZ+jJ260tYG7w2HFKZjl7hIib/RLotbBD6MUSJVwnXiRaHVAISo521uyt+hoZ5qhg71dWgaf65SNQ3rFEpiFzivZVMbvdAnNYFKR1xngpaRw92c09CDYkx87QuJUplUZHhAQZ0Q6f3LYQ+P8U=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022115727099003)(261009223027099003)(56012099006)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uMBTL2xo1WGII+3RPZCDfTROdbLUm8C2eODJeaqxhc+Y/TGyFvY0KV8MktdMWP4bdGdjzXR3EKvUzDiBW62nAko001+yn/ZKGG/MXrxpj+DC2TBox6ljIilp9K32Ruo5XlsU8CVIz3iWNpiGmKK46A1R1FVJcNoQT5eIaINeT6nVi7U9V6o/DJV+youXpyu4VVZ9ZSzdpwx4c2GXQvRbW0VxYA9prU3xH92T5eI6GMyHHwG30L4Z3SJv9rtPiSHzb7xs6qXatoJ88IPYSgncnj0ZGHaAfK9qvWoWNom+AGBSxkjFYkoGI1QzWhAUN4kMhMKQTb0yyquWOWxEjjRi7rhRzOdP9ZvGYurJ6EVHUwxja0XvFM77EGfAMOwjJgp/Fnbw+7e4L30IVz0ejQ/1YmrJwo3q2e2VGW9BMP/gSQ/Y1+F/b856bzUTgPXT6eqm
X-Exchange-RoutingPolicyChecked: IcFJqUpAN0pTDXDCIE/9wMYRksWVIPWoB0KKdCOOniBWhTZQPR8vVt69Efqym0u7quM+mrdxoqKmeq3NwKBXYgWjxgl1xcak3n58OFGBzEAqR5aIVNVi9CfOojdbyAYNK3dq/KLjD1oXVWdAmF9xsuW46zCwRaynmehn7BNas2t/CM+UG/JUelyWwd+5+h+Lfthsl7VePm7nIhq5gg0vnWgQCY73Qgk9x2RkVL+cb4DCowDfXKxhhRb5nK8NU4TfTb8fqccEhs3h7bC4kDk8YTv7SHEc8HaSjzxbCrXCJnEQoTLKHESnVPdn2bJ2xwEbGRzdtJSASU70u5R0E14cjQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:50:47.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fce4557-de72-4ab9-8402-08df3fea06b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00016D47.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6406
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfXxXtH1HIcDQO5
 YE5+duEjSz3NWqPm4ZYafUJ2HkmdWjLAxh+HclyXB9ij8AIoy6/hSS7qOXaIoA0MIJqyhqRHIRl
 wHf9rKbR3HSC0QUCpnZMagD9soeV1Aeg7IAGKWCegT/+jdn+dvBtMAyAGNj4nJNtMoaZG1249f1
 zo/12JN1Sofh6fr6FwMUjqkfWY/9zsA2CA1rlzGfHxHp7A5sq8AVqVgqnrqR0xTaoF7CkBezwU5
 Y+JRZbYuKVOis0D5WOviasc4dSv9di7Q6fLJFoY31vVYg9SfGskuKxNlxVnk87mMNRyTlNyxlQ1
 Tl3cHiWonUEyM1sHIcLMWUUAnpgT+/NGG1fFiAnu9941E5yUNf5lSZZTWMn+3nude1KVr1KTKS3
 R3hBYPLybp73fBFG4uGnhHGtRTzdZ8FIz8kiOpMGj0Jw0gm9zZqoRFUDjkkm/3Tg6SGH73t1ZqB
 zENF54Pf/+LSwln2FuQ==
X-Proofpoint-GUID: iFj-3QTKliPpmM6Sa2HCkA3dkvDa5iHJ
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af4569a cx=c_pps
 a=NzAOMTrFL2nmaFUJOsdohw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=ysI9Q7cufbgfHl2RfqUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: iFj-3QTKliPpmM6Sa2HCkA3dkvDa5iHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfXxGYlTNXwaLBq
 qyGV9pgUYWtmR7+kv1PJ65+/19ASj1cnViXDlTIyIvhsK9GHxIoD3tJe8JPDAr5vczgb8CDg16g
 Jhtxg8dCiO6W3vxUql+lFvZKXJ+3nSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110046
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 11:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20525
Content-Type: text/plain; charset="utf-8"

Add U-Boot environment configuration to enable OLDI display output
on the AM62Pxx EVM. This includes:

- Create tisdk-uenv bbappend for am62pxx machine
- Add uEnv.txt with OLDI simplefb device tree overlay

The configuration loads k3-am62p5-sk-oldi-simplefb.dtbo overlay
to enable display output through the OLDI interface.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
---

Change-log:
v1 -> v2:
 - Dropped the cursor blink disable part from uEnv.txt
 - Link to v1: https://lists.yoctoproject.org/g/meta-ti/topic/122209407

 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend      |  5 +++++
 .../tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt        | 11 +++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
 create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt

diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
new file mode 100644
index 00000000..bc061b1c
--- /dev/null
+++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:"
+
+SRC_URI:append:am62pxx = "\
+    file://uEnv.txt \
+"
diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
new file mode 100644
index 00000000..6ee36e55
--- /dev/null
+++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
@@ -0,0 +1,11 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
+
+name_overlays=ti/k3-am62p5-sk-oldi-simplefb.dtbo
-- 
2.34.1

