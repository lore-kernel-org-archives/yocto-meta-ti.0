Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12372.1793368970653837181
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 07:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=GTCuGjPx;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=uSy8OxjI;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69UDraqi3501133;
	Fri, 30 Oct 2026 09:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CSvP33UEYIcsJN2e8Rm33WsHkZcgaGrI6/JQKhhhY
	jU=; b=GTCuGjPx08pxszidedofK2ZPr3fhS+ESiLtDY5rIuvwm1a9ezxADCAo7j
	VMTs7mSFYbsxiJBknKa92YuHF4Zfdi6XHT2aLBypRA57L9u9nzn26RF6LoL9sQQQ
	tI0ObJCEJoAoXab5yO8/gFUV/ghXLCeRr44kbnRXkv6iauIlbbhbS5tt8oRGXJNi
	KpT61s0FcwBmNqcUrKQOoaGo9gIhm4mfeovMEgorjXrH4FcYyCcx/AlZve8yLApH
	XhV3R19fYDEZhnxO0KlPUMOIXRu44IOMz/8ZkeyyJ6qnUBgMripUfrB1v3VPYN84
	m7kLtUw/zEUSGGerEHpAZWC6zx5pQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hme5n4jtr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 09:02:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1GHxNrvuc2PjEoVYZYK4izajjnKxw9a6sA4LHXsQbYPuWDHlRJ5VnWAFu+4yhn5/XE5BHK2+SSXTGrTNNbsIuWa6EQuwr0RSmimgXzTzySa6zSc1RBDTmOMKPgYFobJgJOx/NFt/nskbFv0mWZSuY06qihsOMhccwR8musq08DpQmdZ5IyYwcvhJuKzNpOe+fZmRmwzGoY0d4ocegXMNId0C/ZDCkPpeav6+rV0Q8uiezLByQzr2bFWiD/CX3J1XES5SCGdZLIUVxdve5FbDWOk8dNrKOYbRtk4R6uKyOfpz/YRrZwTbKyGpZejXYJ3p+qXF/HHtvzc1PWdIaVCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSvP33UEYIcsJN2e8Rm33WsHkZcgaGrI6/JQKhhhYjU=;
 b=U+6zpAt13p6f17PEphOCyvNTtO5MlG4KVezEjgh0Hq6ErOvM8B8KdWpuGQLpzOFvuUU8bAmGRbe2/81zS9eOBi3c76+03elf2m46EoV9W1897Ro2Gxmpyzg3n92iMhFDiE3H9DAF3ViCv24y3yGrNDo0YqXUSdA+7lV5mvQ+AUbJ7spgUrgUlNndx8fuyBH0gAXlSMz16O/Qnn6yZ+a74w63Pn+b66vl5lCkIgwge2kw1wve3k9qZBE4y1I3j3AbCVx1/mvYAS8+D6m2jZ1PMwy089BPbKrpyVAa+iGc4xurTihYFpLJUkKHbpiSQhrIkfLGZ4AavW7yzSlMDqq8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSvP33UEYIcsJN2e8Rm33WsHkZcgaGrI6/JQKhhhYjU=;
 b=uSy8OxjIwW7edq1XdONfWBPXtk9bF9wzh49WtZ6SIvZGfWrvqKA2oG8OKxJLbzCA/I+i2S61PohTNRB5Szt7o5ZSZ7HrrR6mMJaaPTpH9u6DAsX/BKMy6hv2isTKXT8Gw3m55ZD2f+2DgKGXXn05vRQMcZfY0ebNrkarz2Ykpb+GPaZnZjb5uBSSYh9pXMQ2c5GqlvPbJWHDFKr47LMb/IYKD0BPJy1FVGbV7CoGEg0y9CwCelMp5g3ddfqeTekQrGBkhga+x+UEzaKQCWidLjiFsz2dE6xihpMjIaXxQsTlGDjM+hvu0gHn3WILHupXNyUQdpW0WiLt65jSoONS+Q==
Received: from CH2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:5a::13)
 by SA2PR10MB4747.namprd10.prod.outlook.com (2603:10b6:806:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 14:02:47 +0000
Received: from DM3PEPF000265C0.namprd03.prod.outlook.com
 (2603:10b6:610:5a:cafe::1) by CH2PR08CA0003.outlook.office365.com
 (2603:10b6:610:5a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Fri, 30
 Oct 2026 14:02:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM3PEPF000265C0.mail.protection.outlook.com (10.167.23.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 14:02:45 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 09:01:56 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 09:01:55 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 30 Oct 2026 09:01:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69UE1tWN354942;
	Fri, 30 Oct 2026 09:01:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1FAC59ACF4; Fri, 30 Oct 2026 09:01:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610292122
Date: Fri, 30 Oct 2026 09:01:55 -0500
Message-ID: <20261030140155.1977128-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261030135514.1078936-1-lcpdbld@list.ti.com>
References: <20261030135514.1078936-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C0:EE_|SA2PR10MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 8248a197-1252-485d-fd54-08df368e78f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|22082099003|18002099003|56012099006|261028144727099003|261026140227099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ro+aZYMLQxY1dfmBTkFryfVz01A6C/ONPvmvc4ZavlROpVDMjr+OvSWUozJEOEh5XT4yg+JSNaY86AYvQv8oyWxfY2ww+z0ml2k34Z1yuBLY9TjRAudTtc+jf+uM27O2f0+K17WdqETalfUQ+DcIFdeGfKBL3JWbPtllcSq7fb+Jkck/75b27Mbuq4PkSDUlcZCDe+6yEek5ZGzeq2RuvtkdpGG4Z/9cZNoCxN1eFfOp7EiQnAUSoYx7nKxIauabLFIQr2kJA9alWdYROiC6yEm/72mct9sWH/d/yaLiJLLUiHTUgdcq92w5rW8Jz5jHQpEJHI+SoOAZeFn+NGo4aUYOwPcDwiWGjZPmsgQUj5EX1aQ1mQKe315xRTFKiU8R9m74z7ShScPAwx5KOhYZnuCCrujPlSzMzYiHL5QcYf0m8D9DmQryP7Cb7LEbk4XW86dhcgd9bGxOq+K6fknnQ/3thFZ62+WyCLjuxR1c7jGYwpI6tkXrCRO7koS6d1ASKX5EZpHeY8XGpGudBuWnKAR9zlBeQvtuM4sEN0QV1XHgco5NCMsOGKW4yIDP0upByyEGdHs5rYpyL6RlfprRtJU2PZJ1+S2E9j1QCfogE5ZFBRQR5e+l209ZkCJafnH3ELbybUr22O0H9bYTO8suVzrOJHihJQ36X1fLgCXYN4pNCNZ2QXpQXqvYwDyOa86pc/6BQLxqmbTuA//42r1BNQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CLInpvJvZOT1QzRne3Gm1KaG9Ht+q/ROftXKS9SXjm124PzAAlYPTNAzvEGldwukznwrZZOyA1St+g7Uwu/fsdg5Xr5XLh80XAAXGRoUGg36EYOSK8qQPPZkoR5fAVZbp3rImFh/cVCj47khV2d4VskIb+jnFxhql3+I7e+icnh7lnlqlUrL7PxI0T6CEtxTo4rEdIanB2IVlH8ZpFWrQjXnbgxQfvGgn8fdrNPSgjLg2grBUXx2uoFEr0uLZxwoX32XO3cT98Gfas9OyoybC927KV5pdZo3SbhgWS9fzMcue88ML3CjHqhyXm1hUW7i5/7vVdg++JD1uogZtvn/lbtXbSbbSMBZ1nzMTWbBuAbY0DQNVk2/6SC9fxb777bQbICsPQBlHHNG/Fgot88obDgiE5TrLpZrTcpcoubyJoy7W/9eC9tG5OD0KjWknfpN
X-Exchange-RoutingPolicyChecked: hcixUDJ0lJ1+BtK44+vMDquQTqEHBXSMoNF3GHuaJCEA0K+PQGCSqo7/kA+DqIufnDS0LHPyEY4rtyZILqtagNbru0j/T7KW0ihJPsb5YvjVATGTU3Sfa+26/7rNo1f3JKTOqUXGl2NzWckaC1AeEXHlHGgaJI+hBf+TtzZvqwnGGtxHGML0mC8xvfWNyKjHlHwcGqJGklHJo0OOBYjG5bAnW71YHa9rQYI2AwSF9Os06LWoru3p6Yyd5Mf9FaYIaJ2Dj6qIvD4gfknoTrY+GsGmeWFGBbpKgzKjIfvkT61S2EsRlVKpW0aZmt85RGVBanOuskbmni3jTBrZMBzyOQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 14:02:45.1687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8248a197-1252-485d-fd54-08df368e78f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265C0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4747
X-Proofpoint-GUID: LayvlmzjHmgffrL_1yqbFco0VSXlX3C8
X-Proofpoint-ORIG-GUID: LayvlmzjHmgffrL_1yqbFco0VSXlX3C8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NSBTYWx0ZWRfXymvQcVy9tP97
 m2A6yFa0VCaSD2ULmLsJVdCkfZSfVYxiSNM7uy3bWGeIsVP5HSNEoqP2WFuCDKRXF6ER26FAYLG
 voBfg+k+eIpQtMFZEaW5Eosd2kseGk8=
X-Authority-Analysis: v=2.4 cv=B5EsQ+tM c=1 sm=1 tr=0 ts=6ae4a389 cx=c_pps
 a=1g1g+NiJF5nyOkqFb40SOQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=uSzeeo6Yro2AOjwyUJkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NSBTYWx0ZWRfX6oB5qlHRGOFT
 3yI4cqTIQ6MjJJSRAPFA3ErnOkA3e1w4Nfub53pAOVkK0zt2KI0rdhtweTO8IBNJMG+8SKLNZsk
 flMYMLBwdi1cKUBelXNyrL5skvJkFHEaWOJ6igZLBN8o4F7GSfk4uWbg8J0MvUS7yEjyaeTGFmy
 BWGVQvgXuTjFUHshnSQtirYZOgfwm8cDzDkgCnjLL1xpn2lZUlvTXg2Vrcwe52E6Zran5UyNIqv
 CZ8UjCTdgNxLuDkG7Ihk71v5xqM3Ia8QWtnkQKRvne5/OEWuhU8fIn3oKQaCDABS1kQFEgbrvjp
 dCbJlWSJyJtu3y0S+vIZ/oX2EaBVTjb8np7oNRlWrwI78vS8AOAzDbCclEPpTSHFGZFy2V4AeSG
 euUnAGOLsd1aW+9LYnmpcBa//+GTO5MPsvso4YgCDYpUsOToHJ9OZAB4pZSNID2cGtKPIaxzk2z
 PQSNbFLq4iLTtH6bqSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 30 Oct 2026 14:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20504
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261030135514.1078936-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610292122
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 30 Oct 2026 08:55:14 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f32c2cdcc21322477c01d0ae37786b60208576d4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Mahammed Sadik Shaik <s-sadik@ti.com>
- Commit Subject: conf: am335x-evm : Bump up max_leb_cnt
- Commit SHA: a1da274329b381a53350a65d5cf4426f404f1ca3

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



