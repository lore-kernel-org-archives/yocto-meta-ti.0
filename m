Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE888C61DD9
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 16:26:26 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10442.1788020782186836643
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 29 Aug 2026 09:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=gVC1Q1OT;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=OY7QDW7I;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TDxoMQ269983;
	Sat, 29 Aug 2026 11:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NX+/J2czuz8PUONPLI7MEyR4r7HpsGzURQXH998HC
	Sg=; b=gVC1Q1OT9vgh3VjwI8Ag2HF4PsKcxbP2CwI4MLk3fhZnjnk4qq5MzKwra
	Oq92B1iTX0VCrt3y3CTiOAqCT/VI0U/dNcqH7wgH8KlH0p5+bdxdcSwYRQp44ojh
	+Y/p4D8utyefu1i+J/VfCWoa1DWqiNZAXB+G3gxXYrRO3C+i+dMDxeTIf0liRrlr
	krTXLmJzGyiZ/cWdO6xPUrimvDWosQiE/cFX/Q2YiGZ9KOOn/ubYqjQ4tJVRyQu1
	4qHvk7OFrme0TfkXNTGwh9YlVSLBj1iu8Rp1cxEu+mbsKvRSpuN1vAtz7PBGrJlE
	gp84sJ6OukE+XWrKnJDV4TagEAVjA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011045.outbound.protection.outlook.com [52.101.57.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gbqn1j4q1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 11:26:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6wRQHYlJYG2I+XyLUEVzLfZtZMeDXJx776u5ciyF0cOr6uS0F+3vxydEpa+IM/HiZCdz4sI5vGhWk6hZCCIH5CH/jEgQC8dzdiN5RDOYkIPONM0qjCtcwQVjbhsuLJVTKYaDrJRuzpfJ80OHN6L/KhuNi22wdoKKJ+vTUKmzpWDdkrcfxYxpN/tjtOtXXYb3sJLBZUb9YnsuPpRg0Bi2nmsy5mgd8GRAPxoky33LlJx+n7oT5svvSDTDd5c0Zw40qCZ/Ya1f1BsBaQb0//6PLmemUuMsZ/5T6zdLDqsKWJdATpAl2QPbtb3EcDo8Ycgg7NQWXxgnzKR19jMCLDRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX+/J2czuz8PUONPLI7MEyR4r7HpsGzURQXH998HCSg=;
 b=t3DG6X4TSkMtpnYjT78Pv2KJ/npMFmLQI0wtPYlmYh32u22m0llu6xglJ+R4W6nvrIxrjpKi1/XTi+yuNRUFWlBokhJIvDijaFpORpH1V8DlIRfCSm+TyhjT+NncktQd6ZUivjU6YlsmZaxc8TtC+bHsPCyRpWTFNIJ/smy95I0FeYzaYDlqk7wWzzXUWmwZBsiBzF8JlutbGjXbAZNcNWjGUhS9EU+BXnbz2KGiudodUapd1zc9zT8Nnb7e9/X7V3TJxjI8la10MmflgGTZvD10GHNwhYgTF/AqZGEgMNm0kHL0OaseJ6J4JniLH+tBeUwu2oTPfKN1kSRTG75eYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX+/J2czuz8PUONPLI7MEyR4r7HpsGzURQXH998HCSg=;
 b=OY7QDW7IDx6ouXapEZzBEhq+g7ZMQ8KHiUEuXtFcMD8LbCTBEXPR9E+obDW3R9uFo7ehYcneEJxFVnjpYk6QTedTElWiRy0K+rUT+NOQ5t6YLnFu7+Mbq54JVv6Tt9e5hyxkYiluBIaUZSgWV2ftCIpdAn1HjbVyMrSfVnSnC+IHfdvyZDAKUoLSekKGu0XNyZhvVCPqwmoumRLX6YzThrKdL3COFuIW+H4E1ipgqWC7aG5gscKhEB5YK9JBguE16r2sPuWTojy1CiESvQt7mOJb4Nj9LUAMtBrOtn6ZuPMGs2oH7DK8Vy1kT3UTXMD9D2hVgfiflUe/1htHH6m4uw==
Received: from CH0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:32::33)
 by PH7PR10MB6059.namprd10.prod.outlook.com (2603:10b6:510:1fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 16:26:16 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::4f) by CH0PR07CA0028.outlook.office365.com
 (2603:10b6:610:32::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sat,
 29 Aug 2026 16:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 29 Aug 2026 16:26:14 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 29 Aug
 2026 11:25:48 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 29 Aug
 2026 11:25:48 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 29 Aug 2026 11:25:48 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67TGPmbn2354455;
	Sat, 29 Aug 2026 11:25:48 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 653EA9ACF4; Sat, 29 Aug 2026 11:25:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202608280716
Date: Sat, 29 Aug 2026 11:25:48 -0500
Message-ID: <20260829162548.1272294-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260829162228.2725880-1-lcpdbld@list.ti.com>
References: <20260829162228.2725880-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|PH7PR10MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: a81805e3-dde6-4074-b430-08df05ea3f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	B+D/+3kCxt7rTjsQwomlNWyMUQP0hgWxUbG0J6u6ntfusKZKCUGlx0lPoHBl0qsdnAA+W4h0teR0qtP2E0fwQSZAh2LX+4rgayFHsdNwTM0kmhFxYePa4af74Q/XEZQpCB2OzzlRuElhND6wlzm0HxE3WZXx5bhZCYyYmkf6UHAZWwFmk/HZXcF2TNVhq2Db8acOQwg0JbI1LxMFqnBD7dNRab7kubDoqSjUmZlEihai5ScrF3UD867itmJxP12YnKD6jf1/WFpO3RSCZX0fmmkrdKGtcMV9aYwPtUJZ3VpAMqdODj/7XeLNH4GTw/1ZDTATGTCSAGa+4Kcn440nnOYam1oW43iVtQseitjlFKEfDZuuJSNNS75S0mRCnIrlGesDwDgrEc4lNwEwNeVEtgeLd9+lVOz3V7KF5qPMvc/nM5MescPmZO13Fh/JNMs2ku7NpcElX7IDA9Dz0N/3ympBReLsTBkTqt0hwh7QpICSeN8jOXw84BezY/D/EdYrKKXtS7GY0afuQJn0sB4H1AslxBx4e+Mq5YBxTpG5p8BZ1loZi4UPIjtk6EkPQl2J5fHFnFOBhLsdo3WgM9ZWPDMpKB+lLLUN98r11Yry/RhpQgTenLgMF3SI7BCKNpxDcwHMgbduGqb1Q3EKUFyNpbmON4QmDLw7Vm1sYiZOwkuL9pM1sQDsauy665Ke+RkVRaugNgA/XfIdKJjjJNAroQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mo3vJ/W/Qxyz4G5NBV6zTK1ctLG3IzNNyDYiSBHhRNsr3ubXMgDDa59gburvC8XzuUBLTNmGM3a09aovBFB0GQa3jd2nDGXbNjwz9F0aGMMMc5gHLqDpsrw5orpgLjVjqXdM9FuKlluyBQ4sHrVzDfv1l2ycshX1xgX+9eDnpngnpcOyGm1n+L17cfCAU91r8K5IBsJxVbFrcR62mr5xMdqcADgeE74RMfIxYBLactNpQYqQ5CxGdnvp+36mV3dHehmm4/ppr8LS0U6Ka+Tgten7Wklgwdf7oKe+6OZiKLL7O20XtB/FMwhn0Q9X+szSRcNZoMtVYvK4HCvYpoHghi6iRTNp4b271rukFYwoS9ryE8KdskoiVydcPMOiplvfToX7X5lq3X9LSbE70V+BK1WfW7ywL9Lyrm2QLcy+zGoBNMXo69MA9Aw86tKYjC8D
X-Exchange-RoutingPolicyChecked: 
	ydzrKCjcLi99uLKsyUbp+tmIUlvcjtW6cW+6h+6wcBBf70xTgbHtptKl7MiEA4cLZaSCzfbSFmfS8K2s6+1DqIL2gZej5lx+DqeilrT9KkzsEi+i5hQgldEMtKLZaINxeXSIVRKI6nlsxO6SSXvrkVKAEs5nh8V9jEEVkBCYDbHMtBb8zl/bhdI7LWrEflx8PkhlEw8jyOSEGGmIuh/t6hF2zssBsBhrj1o3eqO91kaLhvtipNywLSIE1uI6eE/U4ma5JVmub4KjuiWlW7vo7L3/64BSQw+f4aXtH94lne8I29NVdsgDLea19H6AvvxlzLoipGCDHYpXM1oPONZr3A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 16:26:14.8922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a81805e3-dde6-4074-b430-08df05ea3f2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6059
X-Authority-Analysis: v=2.4 cv=E9j9Y6dl c=1 sm=1 tr=0 ts=6a93082c cx=c_pps
 a=n4nuXP1CjkzMzYAVBY1Wsg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=BYE3KnA7iJJdVB7a4rsA:9
X-Proofpoint-GUID: dXwxCBkuA5oOCCuiXo7tav7oYUpmnFCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0MiBTYWx0ZWRfX1SFWFmDdUoJa
 wSv5Q76iq7+k5cmWbklQcBMhQVKiwzgiwjh7FnOldo4CqnoqzTg2ZWdn5iNXhr7CFjBWfRuqp5I
 9XKzQMYTumvy3jBcwNeBUu4jr/s4Z6mqSzmtjh+wlm52ReVSqjAFi4gXualj2z/VrJZxw/aDk5R
 bOR2YDg4sn5VTLwOtDmFl6xqTCRHzZvz0BJdx1kypi+6cThBf3LsiJoF5y6ElA7U0ae+nPybdaW
 i/mV5BHjow5uwegQZ4KqjuCe93F3CjcxYvPvGXBiSMmHZ8L0Sj3nGEjKMazYG3JIWYIbtxsxeKd
 hPs9TxberlhW5jYbfPVUQ0hNoQ/ilqYWCAPoQdTtHpDf86XG0WibTehvh3KGGssFc8/mmGtH+ir
 Wf2MdsEgXPukWPSNIf0aBwjhixxD91HABuwIk5LNQR/ScCsp8rG5mR7IOJy3Tfu4IwjXGv74HKF
 iy7ImJW2hJ5vXSe18cA==
X-Proofpoint-ORIG-GUID: dXwxCBkuA5oOCCuiXo7tav7oYUpmnFCq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0MiBTYWx0ZWRfX66YyuMl8D42F
 HVCgM0MPSQJ42EOS3sKHKoTThEHoormbk05Wkd6vxhBrz8Qyy8nsDpz3rHJv/KdOc5tlBJSN9IK
 /TvR6jhAgUac80iuWcx99+Wl2iCcj4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 29 Aug 2026 16:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20311

meta-ti / na / 20260829162228.2725880-1-lcpdbld

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
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202608280716
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Sat, 29 Aug 2026 11:22:28 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: aa97553dd16fb92b5afa73e322f42967db8f9292

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Commit SHA: d6f9a95ac6ae5b95c96294bb04e722f0d19ac960

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




