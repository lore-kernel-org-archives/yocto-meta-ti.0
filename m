Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5368.1792605979582212656
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 11:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HCC1jQ4s;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=iYH5NM4W;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHrFlA2319474;
	Wed, 21 Oct 2026 13:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=k7PZKAu1CYjgF
	5ykLQUVlv/8/Q7mXolE+mDIbULI+hI=; b=HCC1jQ4sw856UxH+O4bmfaBHNwlJE
	wmuAvMbNhOT9UNojLaoioU6abWEV0arCDD6rQizZsjV44hASakY1PnWomVVm/S6h
	rsd/KE5h7SpmXU+AZoR291OfJEj8UPn/BEYBB1jbjJ7cBYe32VSualKg79YSNDan
	rSlqzYZ0Za5+C0a7GqUi0H7DEovG805OCYUomEUpG12rn28xlXam8dBdt+44JzWg
	kwfL27F6QyJH1D9AEm4GEanyGc0mtihT0Y8NlRvVVWdNAkgZ2+VCYlE4AJTwdoe0
	3z8eHI6NAIrx0MwVjE0RXntY5cYqu/eejcQw6CsHs8jNFDfFUpRBWn2HA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaamcr8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 13:06:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLI7V0VPacjmmVb8cCn42jM/CGLvheF8JVs/Ji0RtNIZ53vafxto6+4wChUQ5Z570v+TXLBUeheDrpKU6PSyccJEuUyFyL+l6VYUdbEWOU3DRyI9yQtvZE2sM17o8R5iRD7EuPubKl7vSCs+H21wFlun3Crz2MYtaCWyBjna9b1bvpmrxvhPEQD8pL/Vb8DIT3sJgl2hRYYsC+kg79Ne1fW5T5kkQyKnVz5oebxpNU6OR0+tP12OuuLWLg3R9CO8N4q8E8YCiOPzREMntWQTwxxGrSWFpzJ2fLITUMyRKV5u2wU6AZDLfJdWAvzKdbSuS1A+RNlelBpeyAVXpNPIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7PZKAu1CYjgF5ykLQUVlv/8/Q7mXolE+mDIbULI+hI=;
 b=rscCXlhCRj7qUnZykfD7x4DPBtHMxi4U3uAG+nQ5IaPf0cAGC1KZl0KCgRTcrG1YTWefyacLKsjQUXkOrrHQm/iLTrWtzAQ9KEVirQeDmzMxuXERrBR0nO8ckWvPkqh3oxwdSXbxMHT8RDtySLiop10bz8cY5pLxEGL+LNjR1KVKUKaqf2j4ixjcNTPaB6hyOAB//yE4yH4J0LunB4Jp+2XkRf/vX2y5kgRpA2k9GJDyF80KNx/5w9xILvraCKWsJ1efLKoFnyAfFvMCr9vTvwjj/wWhrkaQOOeuRpk9X/cyEh9K5CBEGAJmarhfj7EbVtTsgklFPpkwGai9ZrvmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7PZKAu1CYjgF5ykLQUVlv/8/Q7mXolE+mDIbULI+hI=;
 b=iYH5NM4WQORE+SZJ02DokJ4beyKKiSHKmxId75+CowwhSp4l6EqqzPNA5JYpvUzADBbS7G3xsmZ0f5vEl6zma96zm4lIy+iskIa/GcrOz6x+IXfGmXwhRTH81TXaxgr0PFGQn1f12QpYdcRr1LvmpellfFRnRjOfQ1TqQrQiYj0zHcwqZdLoR2HybZRsluPY75yKfdVYzG5WRwdZMEaU2VOv2bNrXwsdja5PbTTx8HbOvj/mu/gwGYkr45pID6LbOX36a5X2Dtiu8UD3K2aIgH1YGGaoQI8td81DeVQQOe6bH7cp/VkOtsKnzfr1d/7FjiiVjmnZC9hguhYAZgs9kA==
Received: from CH0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:610:32::16)
 by PH7PR10MB6985.namprd10.prod.outlook.com (2603:10b6:510:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 18:06:14 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::37) by CH0PR07CA0011.outlook.office365.com
 (2603:10b6:610:32::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 18:06:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 18:06:12 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 13:05:18 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 13:05:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 13:05:18 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LI5I8Q2524038;
	Wed, 21 Oct 2026 13:05:18 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id B8BDD2A61; Wed, 21 Oct 2026 13:05:17 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202610210100
Date: Wed, 21 Oct 2026 13:05:17 -0500
Message-ID: <20261021180517.1538175-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|PH7PR10MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c585411-87e6-40d2-e914-08df2f9dfdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|261021123027099003|56012099006|260925021311599003|260925021911599003|260925022911599003|261009223027099003|10067099003|18002099003|6133799003|261021121427099003;
X-Microsoft-Antispam-Message-Info: hoTet7GFZ6hYKYd7wrFjQSMl6CnFvuB74qHuwI5JK6rlXKFMEdswuXj2qTHEEYHbGabmE1gKAkrrwF5n1TMREjkxUApQXwJqZZETONKBrvBIgGLiYJlL3kpPWrlwzpQLgKiEPO4+CZcSmL0f4OF8tWuAfLff35S6o6wbFVdId9lhnbTp9ArfHW+Du6ZxglYqxZa9hfHi97Elx9/XWU3HdvHjRTjqlchKMPK2bWC6G9hJMzJACQBf4vdRzspRYQBVkikTUxG6kgbga+c052d711KFRCUGr+WHsMmdHtWoUbHHP2hqU1MFzsQkGUp7H8c1Hj+68hoQt03yqBYzu/7LNLNSNxU7ZMMnscCrqzDBgjP8vOYg8+qNBQzUmiUCC+RvLdf6akYGtmMYxuw83nbcqWRI+sGBc0+JfcQTWemJGj6UJ3u2+TR8tSxMGxFIuoEFnw+gsXStYn3gtgdXcOTbTySD5m1a+Q7lUukGeyK/r3K2IdqvJh8V9rL4JvFp7c7OpwKfrOlDsX47f7z8g0FjX4XIq0xiiAomPzC3X1p+EmPT3AuwzbblIQJLysFTJItSCb+g3u0jVN5vNfGyD79anVjd8ZOe+riXXpLh3ZI9/7NvNMjuSjpb4ap/6kFHHerH8qK1JCLQEhnTq7CAiWOMMjbJVr2i8UbvIZDklb44jYTi9Z4p1Nuep7vQG4xK11duIPpt7D4KBfCcJFWn8aKTqg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(261021123027099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(10067099003)(18002099003)(6133799003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Djjt71TeRlhqz/PAZ2dhmxV+0DgdOMPYeQrR0tUFkfneCabieaNhTq2vGEEqjPLrG+PlhhSOlO1QhzmBHJODLW5URgahwQU1a+Mf0YI1J06I/TZ9ibI1shBRZ+S1Z6bQQJxpyV1hBrgINMgCunVdsc7rD80n2rGuItHtJFR+/ilkOHLx4NRG20ADtii7Bd6rAN1Gk7LeongSKEzhSVEhTKdnuFlAqpujL1Xes05UNWvu4wnT7FvY+Vapq9ugYExdkTjHuXd7ShF5jpYe2N0FN54NIGM3o2k/JBWfCbkLC9QA81cfmHO8jtRYO/4UrTJl5VbLHLRXRvxHU9XFz9rLGaDx2KyUpU1yzIiZl+6EDelUkXFqgzvHoZ8KdiVmYJTF3e0FADds6EtRlSUfOnmwlpNfcS415o+7HEDyhaKcsRjH6X8FAf/Z+54xKxI7PL76
X-Exchange-RoutingPolicyChecked: pVI8P3Yl6Eo5GZ5ClJnvM88L2ugoAyMEtEItDGg4wlYXvgdALso7qkh50rmgRS2WPXPYI4Hh7nZueDtMHTAc9JCp6AQGKeIljKntaVHmKvsTV3tDuLkzQR0yPG8AYjlGWdrmWcWV7yD41A4KaDUaRXXPqpuLG2brVjUMsUW4LAdtn8GmEoeG4AqWoW3LFrcjZc9Ih6EJJhx868YvIZLxAc3DuC0zH/wstrbpNRqaTqueCZeyQGwNmSX9vvqckQotnxn9scs8hivBWsPAv1NGGeNQqJK52Ar7sLStIoQbWpQr2v1IjnR1eZ9Rig3LBvNNKgPQA42dtitUbLPsAjmoVw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 18:06:12.3184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c585411-87e6-40d2-e914-08df2f9dfdc9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6985
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MSBTYWx0ZWRfXzrs/B61T6FbO
 WZjrz+5rIkUfV54W5ieJ6sGLilSG1/ISa0QcOSR+JAw751pAHvFi6e6rtsTWQvAwoCDXarU8nC+
 zwYwHGee59PxVKOdA4X4bJ5qQge0T+c=
X-Proofpoint-ORIG-GUID: hJBlzd-1Relbs_9lqQOrhj0Wh1obpdZZ
X-Proofpoint-GUID: hJBlzd-1Relbs_9lqQOrhj0Wh1obpdZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MSBTYWx0ZWRfX7Sc/a7KyeHy3
 hCHEgsQEOCcs9gwS1w0kS1L0fQLkBQqwxqb84BxHmWZo556WdAyyiD93T+CGwzTRIYHZzsxDmJc
 pIbnuUxKpOnJzU26JUu758xeqr7SyVp+f60SoCyugPwedaXief5HCyCJbDbH68g3uKYiUB79Rfu
 FKT2+L2SZgZa6LZnAIt3FEuzriJJ473XG2tDWgIyRkfW4VdqOptK8Abmvnx3hesl2lcLvRm/1Gu
 CGq+sXooR1x0xz2WdEpviBQGNCkii5vm8o8Tt7jnUNw+AMQyIYhsAKez4DtyIW2/WVait0aHhJ4
 0UwuDH0Ql3cS2ZFuHVibzQxIX5Tz4nQUk13ABL+53il1DMjg7udvVoCrlBp4iG4XZYFZMzCpmvr
 TZhdYKmLEYh7HWMtY13NNPAJwoX+5lZEEhxEfkhWo/k7iloymq4wBQrlI5UL4gBCVLPZR2uuzoa
 8ubyz9V4lYWP1O1IYFw==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad8ff19 cx=c_pps
 a=VZSJMqPseUw/+4g/T0Awdw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=b1XpvO65Q2qoUaGQSecA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210071
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 18:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20475
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  linux-ti-staging_6.12: SRCREV

Changelogs:
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1b14f5313a97da1edd4e4d92036b727ea267ef5f..5c0e395a2f28422a330b6db6341460879fc78454

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 755d4ceb..2c837417 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "1b14f5313a97da1edd4e4d92036b727ea267ef5f"
+SRCREV ?= "5c0e395a2f28422a330b6db6341460879fc78454"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5

