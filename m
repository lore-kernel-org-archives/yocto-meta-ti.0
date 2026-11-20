Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2018.1795134360592298595
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 16:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=G2PuDwf2;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=g1Np31b7;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0FNNk2265802;
	Thu, 19 Nov 2026 18:25:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=pPH+i94veErJD
	crUnH3gbB2cMbYj9hAwChq3lkln5iI=; b=G2PuDwf2ibB122lnCY6n3nGAz+LlL
	Tc5hF+W0UfyN7HtDae7KhrKrvTn4z8m6Z8AnGutEVlImXFv4qcF8T9E8LYDIxs9K
	kezBmlsuoAESMW1LGdIjJDZwcJAX37jXdbw7sUbuoWW7Gtksibd1pu8Gt7zEkOE1
	4oLAK6UPocrFhStKZ+VU2/Qg2DHdFgf/imNm+U5Nsb2dFXkhc9gpF2Hfd8xUL7OH
	02vLSFVJORzO840GzYppZji2WTKjLC975uLJecfK+xXEVY5251p42Oy99zxFkly/
	INOSOK9s8kkl1JiVohOt5WsTGj1PEw/XhTnNxEp/1kOUaTzPXFbffH8Og==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j281nh1sq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 18:25:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh2tvwRCzMKAKeSR1gfL8JpWO0TzaI/M0BSyOyx0Jc+7GuDclVPvGkYLKyZVCGmqW/msxtoBq8A9uY3ehb4SV9bpwY5SDKGPb9wYAyd3vVDJgpipBnP0WmmdST4eLOx5D20G9EcZzMAyvnIPsSa99/I1VjNTHJ3jC0JJW3Ap9Pwa2UFwdIC78hPOaFeNWI/DX+25xC8P4bBPKYsFeOBI4BYkLYA9MmZpsET+GViH8eNBp/BBFaySCc0Eynnlyna0N0bJ4n9DUZtUTWDT7q9ih08KOjYzL7UI0zlg9pdBeJHWlS6psCUKDw9jsLQOhvrWOiAhBkDzSwU7+ex59BOCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPH+i94veErJDcrUnH3gbB2cMbYj9hAwChq3lkln5iI=;
 b=sED2uaVaFSbCmc62W6ohl3J+6+PxTQjxPf7YTqVvWze4DQegIOGtIo0HO4yLN6yvb5ul4hmEiITfnXtwW6mLKRL6nTpaXgPRscLQxqKZdajUl70J6cbfrVS4h7vbVVTjDZEFsMFz1gfLd2zcEPJFi91jlJdONjoEzuYWk+CLBnn14Fdqgn3UIuKHnBTzxruQzcuRXQ2QmpwiD2pyoy2lU5F0HaaKfnpY/7wr2KXh6kJCTP3GfIW/NDxOZRuUzV3U0MeExUI8CoCLtLsqmLbWv5WSjrugwzPlSiIhH8HtxxTDpg8EE/LZmprAaub/xqyHh97YCjtAtGwN7P0u42ib3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPH+i94veErJDcrUnH3gbB2cMbYj9hAwChq3lkln5iI=;
 b=g1Np31b7j04k+o1uvVqIIAkJc60QxMdkbsLZpIj4fO6h2GFlL+kYs+EQpqMuktyQYVXg92dQngiVS4iJdNYQMD+khOC6R674AYvN7WgTiJ+3RfCINyghamLAypWAaWYzkxlG3eqwK98ve5iDa5+lXm1kxE5n3cpHM0d8ksACVfLQ8eYxphzhJTW5bdWOOILtKCe2Mca0WxGebtDCy5fe5lZ5c25gKfkgD5EToWP0tbhK5CPdj5aafRdwTPWvis7cLhIJqG/IXK9z5/C4P4OJZrptsQFNNE0cKrf6asOKeZ88eS8qdTYiT6+dqBQ5S5tcLI1bBetfqMCgK+VpMxlE/g==
Received: from MN2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:208:23e::35)
 by CH3PR10MB6834.namprd10.prod.outlook.com (2603:10b6:610:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 00:25:55 +0000
Received: from BL2PEPF000352CA.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::77) by MN2PR14CA0030.outlook.office365.com
 (2603:10b6:208:23e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Fri,
 20 Nov 2026 00:25:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL2PEPF000352CA.mail.protection.outlook.com (10.167.249.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 00:25:53 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 18:25:10 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 18:25:10 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 19 Nov 2026 18:25:10 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AK0PAD91867547;
	Thu, 19 Nov 2026 18:25:10 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id A07132A67; Thu, 19 Nov 2026 18:25:09 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611191800
Date: Thu, 19 Nov 2026 18:25:09 -0600
Message-ID: <20261120002509.3502611-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CA:EE_|CH3PR10MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fd2730-f68a-4104-1fc9-08df469cd68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|6133799003|18002099003|261009223027099003|261009221227099003|3023799007|13003099007|261021121427099003|56012099006|261022075727099003|261021123027099003|10067099003|260925021311599003|260925021911599003|260925022911599003|261102123227099003;
X-Microsoft-Antispam-Message-Info: eXziGQMP+IObRbMTHqaowRnkxEpPPV3RfGA0H2tNpw69yG2JAxFHNvy6wuGJjHr7mAsDsOlYVR78pNUEaTxqKzDOgXpaINKsk64iNtZfVYfU5bEHT1hk4QguaOp2xrvIj9XZltOy48em43UFKHdkMZq1FmjrUq5nfdeMaI4B8g2KBM97T1XbKYjFGiOZ20Nz4R8O8nUi6ub/pzJZkZ8Uj+ZkMn6GYnFGVf1G1NSGkQb1NtWulwe0kch4FTj4Vw2wdJe67JfQyxA5jabZssspqiM1LvzMgoyelFyqe0+JofemmlZXfM4JiP1khiPEGEB42BFP6382eOx+fQ7NTn/fF5jys8exCNnt2giQmPWUw9G5WHmRuPTP0kQx/CdbUjI0zjGn9dTbWkz08YyGVIuJmgJ1wCvyls1SBN2rHYJDoAqjx/U07wLxCWxi1YJ3J8amD3uIvKWtJ/dx1HICPzB+YnbY6jsqTZffVaIivMmfhgyYr59sDI/Pi3IWeb0SBNy64q/iJX8guNksg3gPr0LNEImOUMlxMLWhecMTlHgZqeG62XLor5xOKxcLlCcM7sk0/5Qgmo+3zcMFonI6qKC2qBPG9SKQKf2N1iJvZyYdbhbLfm5Ha36UFqGtKi1MRkgEy9HPBI8Dy71s62h69xA+XaoOwTJqkAu1at8dfK4Kiet5Rks1pZ1++5ghDsbi694uDExEIGzXFn02M98C7z29WA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(6133799003)(18002099003)(261009223027099003)(261009221227099003)(3023799007)(13003099007)(261021121427099003)(56012099006)(261022075727099003)(261021123027099003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2T+tllJLNGb06naRaczfDmyEHUqcuqEp1awqkitJ81THt10F+9Es9A8/8XiR9xqax4p7d5VFZmsiu7fFs4gFm3hYRNCd9E30vFg2h0p9PvUefTrggfRWd/phRpRdVnYj3cZjsi+ZmiMdSXExKfFkuRst4TbkBhSMQFd8ti3EZBzKwhXLRHINXUti/m7G07qNImL7VMlqzHeWu57XEJYCTHmsRVZCYeRcFG/Td1wJb7mU0xqPlOx/f+V0T1zXKaw8SvIalh4+1dqYQD4Wv1/xAJOfZJwXDpgdgWwVvIQkTV7KjoU0cnsC8vmclp6w46K+55OsXGC9kYg8NFwvWUhG8IzRWaD09x9EogkQ/MGyN2SYpx3WxiugMEUQXH6N2W2UcPwcp9upXWsD6tRAkXRRXM/n8C708xCewXn9BN/YnB4ZGLCgfnuQhTWWy3u6bIzj
X-Exchange-RoutingPolicyChecked: micT7lXcSA/FsbwWcw95wliPaAl2VicwmNtlLDq/FUzB/JHYHFR4rj7eTVejOE5J9TIO4hhBAMO6P2+unw+8/nIm/rh/Lwwk8eLoz1ZVdCgFjCE58cfV9IT5xIkPrv4dXN7eKxlwEdx+W+SpKTh+MMUq46JVjJqVfxD+0NQazAHBtp1F/NSxVCBiuqpPyvoAA5N++Yjz5N/85BGOGEpw1YoKcgdEJiqaWgGFRiDPOf07PMviiJEYm41i2D1qTenEHmBWbwyFf7ITyaI3Bm4UIKJCBttzRTGzgl3oxzqKwtzldfbI5KBfF/wfX+1Goae99B61cmPftD/baw85U1ax3A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 00:25:53.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fd2730-f68a-4104-1fc9-08df469cd68d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352CA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6834
X-Authority-Analysis: v=2.4 cv=aIZlOr9m c=1 sm=1 tr=0 ts=6aff9396 cx=c_pps
 a=To5YXH8t/p3KPg3XNsFgJw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=wTmLqqBW2-5Esj_E198A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwMSBTYWx0ZWRfX4cqwR+7rXT4u
 i/fdg5aFAQZNI1fih34JUgFJ0AO6FchMF1p5Z14qYbH0tjHOxLGHRz1aiXEx1oKx4bLMXWzgQ7W
 mENkXwt2Xg6RRQ9iGKn4oQc6KJ5lzVE=
X-Proofpoint-ORIG-GUID: 6cFyRmpLugrcTi4CVEmIK7zwL9xpLXvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwMSBTYWx0ZWRfX1VigABjkjrGH
 ok1YV4ytyIWs79YUzPj1TTBM+a04k/l0AP0dqZuC18itBd9vTQv0hOEyksl6OLXyR2yFvH9tGMU
 9AgSF0mH+Ghfgmd3LQQhyRR/jotKd356Dbv53fjEa6i6U0Jw6Poemt8Qfu3iG9zcaP7b8hUchcs
 rkMyxIgOFI3TbROlqiK7Nf/QvrjJIZ7CCIqfa/C3XNpGtc7fVRZbrCfOOZhBJY2FgBRdL5Z6l8r
 R+iE4NBPXUpdoq7vd2ZV8Wd9Xais8Pq/lPRRDbI9VUVMfzfg5oBfJPz6EieRiHTvpTa7eQSfGIv
 1YM+XPv43Wfni2IRosOrtkHWiCb/hRIkePPeuqldcOjrlImpX76EfiHIH6SqZxNwQb2AJxMzM2Q
 FcJsJr78mHHXOQKgBfXPLJszRxjXntQIj8d1XYtvC1/6BXA2N/migcMwoEGgyBwAszALm+170bR
 wtIZ0qsnowITjkvwJ8w==
X-Proofpoint-GUID: 6cFyRmpLugrcTi4CVEmIK7zwL9xpLXvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200001
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 00:26:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20559
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=3bb6367dd98310c1651974402f23ad03fb408ab4..17e4757f59260e07e3af17387a5dc0fca3ca05df
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=e548aa37d51312e4dd4f383eb99820e6e0e64d22..2fc9dea3ac3b6d8a29fe899f1e30edb361908866
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=29eb9539475463231b91007066aecd333f170a7c..14023e509923ad141453ba75bbe081aa9a7b8915
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=fe51a7637cfb7c37e90778949da9338daac552f7..63ef7e2f5df9b37eb96b346335c01a11d90f7b7d
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=eabafcdfc283007d86b1dba7f22c5e13b02a98a3..464588b87d136040042ab7b4d5d8a1bae8b354f0

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 831c9db7..b52ecc78 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "3bb6367dd98310c1651974402f23ad03fb408ab4"
+SRCREV_uboot = "17e4757f59260e07e3af17387a5dc0fca3ca05df"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index a2613d9c..5c34f40f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "e548aa37d51312e4dd4f383eb99820e6e0e64d22"
+SRCREV_ARM32 = "2fc9dea3ac3b6d8a29fe899f1e30edb361908866"
 PV_ARM32 = "6.18.63+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index ab99b306..5e6f5438 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "29eb9539475463231b91007066aecd333f170a7c"
+SRCREV ?= "14023e509923ad141453ba75bbe081aa9a7b8915"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 718f1574..3597110c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "fe51a7637cfb7c37e90778949da9338daac552f7"
+SRCREV ?= "63ef7e2f5df9b37eb96b346335c01a11d90f7b7d"
 PV = "6.18.63+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 14737586..136651af 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "eabafcdfc283007d86b1dba7f22c5e13b02a98a3"
+SRCREV = "464588b87d136040042ab7b4d5d8a1bae8b354f0"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5

