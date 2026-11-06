Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12525.1793933511239779563
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 18:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Agg/tvcI;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NhPyrH/Z;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NhV9d2368010;
	Thu, 5 Nov 2026 20:51:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=r52ZV69/Ipr7mQtGc+hwHKBXDhnUY5mFXVYGIFgLs
	k4=; b=Agg/tvcI0f6tyLewZXVr2/6FswYrAJglP1TVqBZscGa7gDyiKZBTOGLu4
	krOZ9vilaPNtGBXLjfH8xFpyFwra46a9PQhxRFzuZ9X6tsc64ZoisOHcb0Jn3/WW
	iAdDPAMNt9cUivXhYihO4OJ6Ht9QF1O1IDIVjvdCufZ0ck0sxQgZmq2Ggkp9I443
	hDCV8No/DVqTszhntPVIOt/GNV8/0qOh3XIXJvHParex0GNc4iMYkNnQwddCJonU
	OJSIatBvVX7E7B16HHrXn3B5NcXEFcuEfKorjbmxizn9EdBUGwPdiXEmq4oGp7tF
	jCeXzJHBK3UWnNqW5Jk7Q1aj1ekfQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hs3qm8ws8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 20:51:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAY6u4t8j2X7in3K6F28Ezj7em+juyujF4E/s9qQkstsXMCxpEZq+PAX1n7YbnbWKPFSgcZlaslWSYrnKBryPa3AZNB6Hl2JPv5jO4Fzs4F7gYhy5DV/1Cd8YuQCFGMDQ1sHPpFr87nNu5P8XinzPYsBN+WxFZW3QBZldJzO6Jm6tij6Gx6xbIYNfNk5xCA8NRH76xF/hKotagqTR6bIcdXjFcyFWkNwWVNudFLbqjfMToQQvqCsQutgZ6WH1HdS/wVOWjPK1QHiH1dvrHnzoTc5OTTGxCIhoxWClcO3OahOcanvtWUVsJcD+CpdFG974+yWyhxsLPCD3ppEYq0YOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r52ZV69/Ipr7mQtGc+hwHKBXDhnUY5mFXVYGIFgLsk4=;
 b=OnnawTDlotSHJhosQl3Kw8AT3PhpB3KrCXRlt4X0qzxqqs6T1oEdXTXQljMRHg+M5QNgJ4e134Hf39RTomjXRAvyqRK6Xlr8srSWhXpEsnPGaICXtZ0yOCF//cv0XHil51VBZ0qo5Ywlezq0eGbXv4r880Z4FNNpVFBxxGoVCCSrStElQU7k53FBYmlRJginEWVXHkvfD+3nyeTk2Ym3pJMzWzDdOjYqkCMzOC5NaAtLI4a8lDswpXiQG1/Q7YCHxmYvMQWXm1n95xVNqOXs333gg4eXeqak52KrcNTHdsIRWQrEqe1+EcwnCTyEhGs8oSak7CjyWW3XZ0uXOW5+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r52ZV69/Ipr7mQtGc+hwHKBXDhnUY5mFXVYGIFgLsk4=;
 b=NhPyrH/Z/W7PRYZOVds9rWI8JBWnCcTqzTD1Dk0GvG6HAWssGYvgJtIcWl1d9kMHaTWqis6V0QRTMHxNQ8euX3kPXoy5e0uijvuNToVOb3vjPyMlh7agTbETfj9cy6K1RbDT6WVWiJHWujo7X7ayenLxsDWYT7a3Z7NoXAMs51wt9+IYiiYSiRLjcpRuoRVmlskgo6BFWNNu8goJMUDa2nkV8t+n7Vhty5aOjbPhoAr83hIxp6sEqEAZj8VucI1lfT0xvz+dwCniGyxq5uvTKwnJI3HZBSrZ0IaZCMjgrD7f3N34flgqAJMRuSssdCPQs/PJjtH5EkSNzIHaUR/U6g==
Received: from MW4PR03CA0094.namprd03.prod.outlook.com (2603:10b6:303:b7::9)
 by PH0PR10MB997979.namprd10.prod.outlook.com (2603:10b6:510:3be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 02:51:47 +0000
Received: from MWH0EPF000D8951.namprd05.prod.outlook.com (2603:10b6:303:b7::4)
 by MW4PR03CA0094.outlook.office365.com (2603:10b6:303:b7::9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10
 via Frontend Transport; Fri, 6 Nov 2026 02:51:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000D8951.mail.protection.outlook.com (10.167.249.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 02:51:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:51:42 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:51:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 20:51:42 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A62pfEU1378614;
	Thu, 5 Nov 2026 20:51:41 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4BF6C9A9C2; Thu,  5 Nov 2026 20:51:41 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611051452
Date: Thu, 5 Nov 2026 20:51:41 -0600
Message-ID: <20261106025141.1994381-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261106024441.262042-1-lcpdbld@list.ti.com>
References: <20261106024441.262042-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8951:EE_|PH0PR10MB997979:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b53a57-eaf5-44db-beb6-08df3bb0e5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|22082099003|18002099003|10067099003|56012099006|261028144727099003|261009223027099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: voqhCRkxRWVjtY6z2Gv4Mjs8MHKad8tY0LH/arQX0Ng1YgCEh5qCTJJsGZpcY2Ibk7bQIDMqGKS/+rPET+js+bYaZMQxde4IMTTyXR93TS+AJ+KVXDU0Bm3As5UYrYWneC78DCB6UD2GaCLkwKLQs7/x9noToD7AJVu8rueUU/hQJ2DsJapo9FMe+USuM0qaQ35pqEoDbyaZVB01URgCSDKLDNzlNb1PmmPUcFmJp5OBnpxwXKDoo5YJKbpBj8s0sjeK6t3Pnt9i/7JXT3gMnGmY2kZpMsuJa84kd7pPGiMT8s3UmtMYCdCkOgOS7AYDmX9nWqKD4R6NSw7BOyy8KFIJZfmWxFABjgCWizGVPSdpxxyqS+1JcvQBygnBgEsMXie2XtbhfGZ8VYhwTfxZcuQo3U7S71s4eNqF1uewGEucMiw4Kaaf8JQ37D9FeyUNhRmSUYiolLiY6XLxVbo688809c8P+QKb/svx5Yx7wcIcN538IOJWyehsUQx5qutidzpp+fu1yKs9BGqFKCsUKk44W06zqLxCJ9BhxDkDJeGZREaSCREUaqO9qPECtI8ux+CcdNr7htA1/mnwjBmySimdnSgyyyQpEaMAeG74s0HfvE3ctVdZs/Pcgg/AFH4oAPuFNMQxNBftxgVwqJpXlXbRvtBvNrigcgk9krY9UXc/dpHzlf4d/ENtlF+uDlcIbujTFceroGq7nnAYmeIhBA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(261028144727099003)(261009223027099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mARXYiGaNKzaFnc7YOe9Dvfly1USb+Zd8VQC7P+nKqUkAkAo+Bl78J8fEIRKf381kVUcMnIa+ZI9iKq8zwjfBONyXepXqIdOHg270gVcWK6lYYk0V+3kcwX3tDZzgPlH14yH51V2Rkwlj6hpLc6DLywhwRrw9/bw6bUKBlDZFn8BkF9SZNtNW11Y2j/usvemAJBvyFuA3ZhuI5PJt/1wFew17BGFyYW7rF/6icuZ6BbNOtmYnlsTfGr+xZdgvNzVuZLgNdBu9qrzYBM1m6EWuURfGsitSt0Belsj8zG+GLkoE3gEcv8SslaJWJMFOUwgikPfDufo4LAMETPzJ5YZaaPgx+RNiXVwf3cEe334XTx/3O/GRqnHAQVtVGqkeoQu75fJ+UlxIHZKl0ndyWp/vfpE28JRfRME6uWoLp5Cg6Wysmn8+lBXb5E6m8yNELQs
X-Exchange-RoutingPolicyChecked: rb6bqzyDmN/OJROvhe7rt8OtErFLPm3Sgf8bgBfP8Rz0nYu8lbYesQ3sJnkhhRZi1llBjWgPrKHSouHhD2qr5fHuT8sP8BUZsM+4z+iFbrkfXBYQr9fFAv0/2PRJNqJdqsWJ3mUh2cvFZnjpQkdRyOBKYtMAOQ9UWfiw11/Rz1AdCAaJ5SSLkrL3kHP/mUaybgtmGCaziKRaVcbx2TLiIDqAM+RkhdIzkMeISytSSTyjVS3WinCvXl9cvXtTjt32Scv9aTvZBv6DYzIKY86waFnN0/e58ClYUZbYYrm2BzkEhJ4/6puQDtOfNaSeioyyUCMFDsTom0CvPP+GNy+FnA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 02:51:46.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b53a57-eaf5-44db-beb6-08df3bb0e5db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000D8951.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997979
X-Authority-Analysis: v=2.4 cv=IJ2XmQvG c=1 sm=1 tr=0 ts=6aed40c5 cx=c_pps
 a=yf4wneJBeBA4fm5+j3KMTA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=4ZY68HAGLeiKGXEF_NYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX1wZjKb9u16pN
 mhh2jvEp5fRzjbVCR/w4fzXiluqpZK9rFz+/0PZM9QFP/3iCvJtv/ZRjHVv+chMfcnitSljsAZq
 4+Qoi1tXxGVeLBuP9maHgSh+eWUh6KvmDk1x2aDGsXb1tnyBrrU1e60+y1NQFEXk818Y89FMIUs
 Cj02bcbNZQNHOB/ePDNg5LnELgNBDcJ5LqcWHpCKTN3oD05mGue7baler2O9r1o8/4MYjJx/mB0
 5c4U5iSmPibennNjqJykxt4f0poaRPgPoWqNa7MTuLPb2yULGEAD8yqiZCZTZMjWwF7nBVGyNSy
 fybZ2MJnyLHD/Ua+htMs+45x1eGC9zxoHoBd5APM4dfGgGg6h0EdWyxBMLD3JDZktArDB0R6Jym
 g2tqYTWKX6D3PvoCDwdXlCIZki3C8KxuCsVL9auL33L6X4z3xxKNg0O/e7PKL7MPSNIxXJLIG7r
 Gxx48NFYJ7ZezHE563Q==
X-Proofpoint-ORIG-GUID: 02ydkO9_76sxb2kkVxHqe9vD8zkJlV5H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX3eH1ipV7Hkym
 wCkJ8trDcEMz6aRPqP9SRG/W07T95zil3cO0ahnlQgG30yILPkgRgqDq/8tcpFuOQTmL0HqKW3/
 OerGPEA7PbfuuvA/Tz58lmflk4oVn4E=
X-Proofpoint-GUID: 02ydkO9_76sxb2kkVxHqe9vD8zkJlV5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060010
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 06 Nov 2026 02:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20511
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261106024441.262042-1-lcpdbld

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
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611051452
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 5 Nov 2026 20:44:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 50682e689d5ef3d639b1a3d92235dcd822c89965

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202611051452
- Commit SHA: 1e80335cb1f082e67f11f342e7dd8de5b4b84d98

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



