Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1668.1792738541902726275
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 23:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BKxDJSSg;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vq5d6afM;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N64kwe1862139;
	Fri, 23 Oct 2026 01:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=q9w8U1ZMEj5ua
	RMCXHhlLUmuU8yIzG1fpqSmETy9Zsk=; b=BKxDJSSgwAN4KZVWpYTXJQs9uOd0P
	GlhC6NK17FJxlVeKbI9jP2Y0uezZqJSrF20f21L6KWQxjd7QhLXeMLYWc6xMUosi
	XgFsVHEW9nDKxbN7DbpCftt4zyvL+w5WHjj6x3pjXhev1qw166t+kALRSMK9qpSF
	xlOGCaQ7dpxsMvBLm3UJ3UPZVk6Oqb9Un97/2TH2LgFyuC7Wl9JpbDTkCLwOLFL9
	pewsuQgawGWhqfVw4FiYQqQr2vCfR/toz4M3ryF9wqATvQACCDYH0lMK7nQnHjmm
	GLCByOiY4E5duVW6FA3I9zJ/bxoUMONDr4m8eixWoMeFm9eXmI+8ynm+Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfmg04y26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 01:55:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3vDnZyR9h/upe8ZgKEA35Tu7e+oQtECjiBFDyHUol4mcyRJk5QuVBcKAZ4qFItGMqYm4b6cGSEkqrtPV3grMCSeVEPQTwehfFpxktn+x7NjTKxq1/rqsdZDavrteqE6rZsi6bycJgViVcXOAnZ/zCdmtaZ+C3arlu0j5kG19tuFeOhPDKcE0Bhq3kOIvIyx1KRadWuFVTDMWCTLtgqhCCyMMXhnPPm0U9I5t28n87LpD8MzoXmuTlawaP5XK127WPxeTq4fn/0KxGQ/aCfJLvidnpnfQpEnHwkv7x/UYfB50GPxbKXoFfS0JH8VcjZ8AuGrcd1pbdR1agU4i0J/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9w8U1ZMEj5uaRMCXHhlLUmuU8yIzG1fpqSmETy9Zsk=;
 b=V3yPbNUahrDrEv7wD59ftNj+UZ74nYWjDqurYZeJvISbtum1HNhig36+ojvA7s6BcUTz6yNd773QrJ0rK1f7Gy7Kia0XM9aBbHBqjhsx/U0Dz/HTBvJUxI8mL27RN8EWYqtfmZOXRdhQNnFgf2Ce6D1/2Ko2Re/g7/wiGhAsgDiK4AWjamI1TlYB1tvM7kSHJh76pA4fjXMKo0qxObHS3wcGR6nmHzjBhX9+sILO3QHzLTyvgK9s1cEFbpQp8vgSYWQ5sOfgYSQkaLNtkEdCEx8Wb6zx8k2gtRPKv41/WGy6sCOob9ycu9UDa7huZM5SqRQNmO6ouUWhhDX9vkbNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9w8U1ZMEj5uaRMCXHhlLUmuU8yIzG1fpqSmETy9Zsk=;
 b=vq5d6afMIXM09WeGXtCUrAkdDaVS4ZRVOMZV/pnwkk2yoMRMzpbBoU+dL+h/1Cexvb2IG1HRN+QcvWfwBFWm7t6lNz+DcOp18oW6g70j0pLPTjSqmfj5BGxUXfmC41nzmn3cv7DLqxkriIPL+BzmoJLfYbnUr0eGxG5z39guYKMGJaa62HKzxhZhEUd4x27HMHnTg4Yz+L9eFN3qIE3oIOv2S1d/+o5SIzrfOqu9jQ/LTFj344eL7/AfsQcTXwr8FtvpKSnoG43LjI7KsmOS0myoTA3laxw26hlvRC38e+FBLjUUw6sRk+Q/2PwWj7nSJiuooWCWBeIK7rSjcO0/Zg==
Received: from BN0PR04CA0154.namprd04.prod.outlook.com (2603:10b6:408:eb::9)
 by BY5PR10MB4385.namprd10.prod.outlook.com (2603:10b6:a03:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 06:55:26 +0000
Received: from LV8PEPF0000006B.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::2c) by BN0PR04CA0154.outlook.office365.com
 (2603:10b6:408:eb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Fri,
 23 Oct 2026 06:55:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF0000006B.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:55:25 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 01:54:56 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 01:54:56 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 01:54:56 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69N6suk0152157;
	Fri, 23 Oct 2026 01:54:56 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 731362A61; Fri, 23 Oct 2026 01:54:55 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610221956
Date: Fri, 23 Oct 2026 01:54:55 -0500
Message-ID: <20261023065455.3580362-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006B:EE_|BY5PR10MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0ca129-8f9c-4dbd-1d81-08df30d29db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|260925021911599003|260925022911599003|260925021311599003|56012099006|261022075727099003|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: LTVGysYzaYEkUVBFnSYe/YXqsZQcU5V3dZkmOgyHPsfBDmo9BcurNZDYMLA4ps+hW2FUda5RclSPUBvE5VeqssjcEAqIZrKQlnR1cWXWvZULD3NIVLxWJmFiqJvPICiVQv3nlsadWawGAHlPqBs7pMyeNAudd5+2Vd1U+1AO1zhlaUd6/DEQfV6aIN8yw5lODY5rAo1GbC/p7MfHZjfCeRH/oaYFDMeLqJ57zZ5OT4NACkgb+iCWYYB+FrM1N34KAHEDzocLSOKVwqbt5rf6eQY7F7rF5liB+qDadX4MMCMRYolwiagKFDbmUQLKZXrUNkg4NgPP8YqGaGv6aPA8K38TYh4OIq7I7HuXhmhKgpdg5GdnLTkjjff76OI/9TqInslC2IQoA4AtCrmQaKjRC56prKVS3F+SGuRpA81OL82UrFKrQbhQuxvkHpzkS+dDOdfr030HrLax15zHosdnfuR5w0LgLZZTTqPfyUzgpoihpSsViFMZEz0hbBuHhEBl6MmufzCQxuJypGHr3wh12RODIfqXgtunLd9qTA4BJ0hb55dBSfc82MvmKjCixRoDIrMNV1lIIbDGviWq8DL15e/qFJKA8Yn7F8kp6l45B83f81fcGeo8EIErM7/TQhmy6sQ04B47D8FXFRSFZxLz7/emjEFdky5HYzwWpgGQDUxgtbhB72I94ENH0MyjXLs7wN7VoyJKwiJ04lAD5zGlkA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +P3MCZo35cx3AK4BTA6/6C+Qx2F0ELt+F719YSO/G18MUB6NsRHFljfFzpy9HkQaatozXLOzqHYp1nqo5uRX4jc65tVW5tlfWjo/kxqKrBj3lLLjXq82sV1hsbMkT2V58QUb4TaZuFlEiDhia/p1xm7qqwvKhvWf0WN1wk872t0MIiT2Nd4IOE2EG9t2r7xHtE5V4J9MsncjtKzRPdbEM2KYYMBOiPR6KOEUHo2ypnjc8dMJTETu0m1dDMJ060kE+OIca4SV4C+xFdsUomwWwpqx1XCFQlRenZzyoQe+r/BodaEB5I5S+3h5OHp+wRwxLOLuvgeAGZI8bI0ZAJEiaAj3k/Rd8ZFHPUKwBwQWD2DS0zPXFdwI43QH87MKdm1NK7CBr2v9UVQ0kc1qBTPF5unW1WbG5xunErPbKBHc6MJ08z3K7uQRVL+8ExUJ9yE+
X-Exchange-RoutingPolicyChecked: r2pxUL8+xHJDNGhgW1VyNjotYH72dWRtvhdRmpEJe/RQdL+ihizUB/uo4R8FeC8iRYJWDAaeybOsZJcM/vzxy3J0sEPnSsglofLl5xRBhfd5Ls8hiOKb90dipsRfMUKkggIlSgX1ht4Gd2RgHfivUSxijTYjhhl2eMjQ2DfvuRgZw1kInusp+4ooZ/D6pWKrtrQcGG5SHZ1XNLQoDfQ3VaJZaKZQJI+5COQNev3nwp7yFiIct8tZD7pZLpYP1uB8aKzSZtm2elbvoR+OBRfe2etyVFoZwJdhi4juMcf90PsR/kapO0CVAvzCmbU9j04c5fwOjiWyBEDQXO53Wk+5pQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:55:25.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0ca129-8f9c-4dbd-1d81-08df30d29db1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF0000006B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4385
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX0pgxJURXTitR
 LoxRftJHLfmw6Hc713QWlhTRfGhH1YNEdylgsRnx4b4+eN1paXVooNULwtEcB+otZnlYiVYpDp8
 sCXglvookNKVnMD/GR4KLIWLwOwef8mxIi7ATmQz8DDmVFeCFeqxfA9jrSbMWl5Sk8nmKBN+4+R
 Y2i30RnVA2tr1N4YdmSnAiKUMQ6OY3LE3VqS0sBniZnqQyv55bZU8+KzKclzhPoDPUmji3H+D0L
 AVhxbe3fbWSmgFqckZR+b6/5p1VBBA2Y3CiQ5RtiFS8HulggvR886Iwfk21U6l7cILfituXMPoQ
 iK4mDXJlubD81qi3z5CHk4xajJcHgXp4KkZSQ4qaAoH61Tz9lO5LQa0jeSlucjunVaJxGLL/zcD
 iSzP3nh7460cRZykVIvzC6kxVwhuaQJYn0z6gYfz+V7HT6WstQtpf1yzMnALzFhZEXhPKHs/15b
 iKTpWW5dQM/tNxVDuyg==
X-Authority-Analysis: v=2.4 cv=QIL91QLL c=1 sm=1 tr=0 ts=6adb04e3 cx=c_pps
 a=lBl9kuBVfjPHxW47UHPt6w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=pV7bPH2KdmW-boXa1XkA:9
X-Proofpoint-ORIG-GUID: vvFPB-CSXRWwq_XxINDfFGvXq9wu_aQQ
X-Proofpoint-GUID: vvFPB-CSXRWwq_XxINDfFGvXq9wu_aQQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX1Amu/g9uydiW
 Ss5zoeJEM6HSW5br6bLHr2r0xuuBvwgusdCi732iNq4G7nLzGrS1FfqS2LvnyJygxe7nm4w/hEH
 2LMGsuqtZbtEmf+ymmlzvifV/ivOIrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 23 Oct 2026 06:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20489
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e853cc767f4b5431ea10f8f986b455e14a60b282..1028826ea156cc6c1e9d231ec9ed871d53b91f6d
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=792d3f648d38cbdba769fab5a77cb2143026c035..a0c21f799732ae350ebc31da24297d12f3e945f4
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=d1be33790a0c6d9241b08a8bcf0b702729ac2b79..76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1b14f5313a97da1edd4e4d92036b727ea267ef5f..5c0e395a2f28422a330b6db6341460879fc78454
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=bdbdb414e41afd2a0ddf34143fd6404f14ba64bd..97becb13b81c314c1d17fcf2226aac9a32086f3d

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 6eb84cca..4e1e3d1d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.01.03"
+TI_SYSFW_VERSION = "12.02.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "e853cc767f4b5431ea10f8f986b455e14a60b282"
+TI_LINUX_FW_SRCREV ?= "1028826ea156cc6c1e9d231ec9ed871d53b91f6d"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 960fddee..5798316e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "792d3f648d38cbdba769fab5a77cb2143026c035"
+SRCREV_uboot = "a0c21f799732ae350ebc31da24297d12f3e945f4"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 53873476..cbd0f834 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "d1be33790a0c6d9241b08a8bcf0b702729ac2b79"
-PV_ARM32 = "6.18.51+git"
+SRCREV_ARM32 = "76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6"
+PV_ARM32 = "6.18.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 29dad030..9eb82385 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "1b14f5313a97da1edd4e4d92036b727ea267ef5f"
+SRCREV ?= "5c0e395a2f28422a330b6db6341460879fc78454"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index f9ef91b8..8f168a1c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "bdbdb414e41afd2a0ddf34143fd6404f14ba64bd"
-PV = "6.18.51+git"
+SRCREV ?= "97becb13b81c314c1d17fcf2226aac9a32086f3d"
+PV = "6.18.57+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
-- 
2.43.5

