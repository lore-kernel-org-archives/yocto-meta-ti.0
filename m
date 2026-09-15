Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4ACC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:56:36 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17019.1789451791785949013
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 22:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OK+sL5dL;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=WNG1xBLx;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2m8LA2989378;
	Tue, 15 Sep 2026 00:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3lmFB9QBDdwQsYwu1RRL3YvAyQwNrme1yq1ZxKUD1
	jo=; b=OK+sL5dLVN8DCJMuDwANHxDM6KtJ8Fw1T2ikVy7dwo75apK2iWJYR6lFn
	8Jwaad/w8xbuY574Csptp2sWxx3kCx2mkQcLT56jaYSKiujBS17Qwyp9y0OXLG/k
	Yo0iY/G+TnMIQBlfmiCOobL0+r1rBzAWrlhlbI0Bbe2XUWjPaN+dJDsIy5Xt2VDx
	+ueAlEylNeHH7Yx99Kzl+qaYCUvzR19jUN1GOXoMdy7PLdH8vt4l56rSoqrrl3XC
	Ux/X1+I2e8fSnRVGXKWJwGZ6EV5W3CzA2MK5bp/v4s3WeaL++F3R8RSIDhK39sa2
	ITfkbC5ivr2/01OVgx//Ye7VwcsKw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpm40v4gt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 00:56:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7ffAh/LCIWm+POinzNSdmnKwwm/kGsKkNUIi3FWn84HWHvefd/REWhHCdVtowhgJkSJ2PmsqUCdBkDpCYVYXcukPmPBTX4wfefutRIsljhIi9zP4XmbDoXf65Or6uzL6Ah21tMhM2nllb5ViNLrpU93Z/Ve8k0ptTuW8Ehw1+1ocGgME9zbsgiUyzWMX03rc3hSxLli5PR13cqb2QpKCayJEdDi93AO7CrENBj8jTc3FcUBsuXVP0+/uTiZLIe6gJRFc0trh7mzQjSU9cbceQ82ErdNEGDGX+nl4kmuKBtDOiJu2yMduifwZ9OII0Wr7vnqAxmGCDInUbcAfSFRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lmFB9QBDdwQsYwu1RRL3YvAyQwNrme1yq1ZxKUD1jo=;
 b=ozTIpoEw4QCojI7O/q2f5W/cnCYMTfXkE7ZCBrV/I+9bHv6d1Qi37xFIx9DMWXrhKr+OWVsw9GztN/EzlbvsWh7b6ZyCQM9iKJDFJw6YTYP2yHpAxJ/LvCpR/duqTtpoYxQvET3PM4RelAzup1tAKuzoiaLh1RwgY6Mjo43MySkTVFPkJgTH5roEVwkkYj64F3gieO9oNCrYPFzhq7oOfq3vKiYlRcahfdC2vZxNirx5ibIpVS/ELMOZaCYEzJaQqyTaIxUAWAwNkV7pXDcjNDYbox9RTs8XMqCLQIdb/9YG4uNryvMZjaTXTo0lSxflKGltt5Nn6ZQuKw23mY7ZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lmFB9QBDdwQsYwu1RRL3YvAyQwNrme1yq1ZxKUD1jo=;
 b=WNG1xBLxlWrfu9JZRpwsqNYvYeV0tY3z15No5O7uGyXLRWe92b/5Nrd6NNyJhkqhm86ccc6OXppXqWmLMpE0cxboy+FvKloYF7SFqbutFBo/h/0GGYdawqY6o1wLSc0dU4g1vQ/M2vdM9XDZe2/OTSNCNTbXYoRVkYdsOsZLH8sG7xM9NY0A0aWrVs+QMO3ROIP8frFNEf0mLlmnZULOA+Wh7AuNBEPxNxytl8Zd2Rl5HxwCzVWaI1NOpT7LGnRKFKCeAWsczlbfkLn8BppNY96jzdtuC6tV30HtrXDbPHFdbphxchAvomErEFwIWAjK1VRtGx6j9bH2xDLF2YD7Lw==
Received: from YQBP288CA0045.CANP288.PROD.OUTLOOK.COM (2603:10b6:c01:9d::7) by
 PH3PPF05D8D9487.namprd10.prod.outlook.com (2603:10b6:518:1::784) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 05:56:26 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:c01:9d:cafe::30) by YQBP288CA0045.outlook.office365.com
 (2603:10b6:c01:9d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 05:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 05:56:24 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 00:55:44 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 00:55:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 00:55:44 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F5tixx3603246;
	Tue, 15 Sep 2026 00:55:44 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9C0A09A9C2; Tue, 15 Sep 2026 00:55:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609142200
Date: Tue, 15 Sep 2026 00:55:43 -0500
Message-ID: <20260915055543.3457012-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260915055324.1142908-1-lcpdbld@list.ti.com>
References: <20260915055324.1142908-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|PH3PPF05D8D9487:EE_
X-MS-Office365-Filtering-Correlation-Id: bf626439-4123-4f60-5115-08df12ee1380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XPCbTLylRnkqGjpXmx8Attt5HBzpjYnAelCDz/Zo+OZ22VxMDl72wNuoyAuaXJsmALatJrRnbd0ZTwKvrXnNcthIVd1shEzy2ExRS/+c8jzZSR/wfrG2LDSl/fs6cHJp7zcdX279vtqglhymD0reyBrfTfMy3MXWvE37PRyvpkI1RzzEGedewNVtU05mJnQzwdb8bzdrqZ7C4n9aPae/y6+nMHb40g2g7e7aOO3wlicrLfgO/kEppIyfx6LN8DulADSw9SCkXKCC4Ufjlb/8PkST2CuubmYfdrjE/1k/CVZZN2dfpYprmxURbeZ5hebkoN+vzlivnnwp8DQLuP6aM2i+Q+avNz+InDwOoR5rUcn56n3XzvrR1TswTKpSdzFqTZS7EMMKRkrH0z/kl50LffwT07HzdlObb4zy/HXvCoimtRSOj4snumknYBVd9qEwy+1a+jjU3PIRevloelRk1euMA0iNHxbOVjn4WUmzJPmtk5cVXCkN+n6Oh6lsnTdpi+fFedAixkjbozJDjr9vXYY0Z8vJcfGOOBdfGs6UJerp5TUlA+U9qF3f8/U0wVJsA6Ii9ZeYri25ji/btLzxv0NHG2pkpTzYihtdljMqshkPifMGLz1LKvqKBw1VXUqEYpVE7xY5H4FRARWLMKOwpw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mw/rQGSSblJSH0CTCzmbghpv2ocf45+GqpUALon+UiuxYa9kpoZ/9NatmallMerLnLz8bswWAO6ZBHQhXbVIcul75T8bCH09+8LXBHtdZj+yfPwXxxIJa0CXIgxsFRIhUkarG5h4zU/yu/ATYwpFsIDPk9AhPw/Un4YylTHt2OAlMKTW1u76LwJFuYX79j8KLGG6O6Ia0vzcPtwTFQgXn6sFUpC3ZK7Hb/wP19Rm9Z71PjasKr6MA3h1OZ+UgHcciqLLj2HAtQIfoTTGesf7xrTI+THisRlfQ/rawS3pFqw0YSntmHcrbF0xoJbBn41DcUgJoSsyMaQ2sLGS3E2l24TjPvGhHXKHKtoZryBLKcSl6H6J+sARxZa8+9zqmbJLHi9lckIvMftw1Gcz84WeonLk5fkzrVVXOU7UE69TOQP/AnE0tFM5WsVeYkOHEs17
X-Exchange-RoutingPolicyChecked: 
	gnTOJxhb8JrQ88HpgviVj/x8bW9OLU8JUKN22RL7mcrdKxyVXdjPpkKbosx8R2/3JFvkaLwI+TS7jm2gLfJ9I3RkmECxc9lJvHTVsKT/IATtWMmOodPTGKnmL1VRYgcDjNFTODtbqaxvf84l8YAHQakMNduHdNome9CCF1W5h+nrN5R745nQX8Srjcyy+Eg/70aNj8KSRm0S8W0Yw0H8GKiAyx/BgSyujukQvxpQV1a8PncK47APYCuy8NR/JJE4O1X+jLD4efNnzo+ahKLOwgxMJYNDWKxQilFQCNiOwuieX6hdjybsDH3eg1MOsB7NKI7j60Kx2Q29R0ojlzkDTg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 05:56:24.7343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf626439-4123-4f60-5115-08df12ee1380
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF05D8D9487
X-Proofpoint-GUID: l1hDY6S5NVBh9u1Drq4hlbDOVIixEe2I
X-Proofpoint-ORIG-GUID: l1hDY6S5NVBh9u1Drq4hlbDOVIixEe2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4MyBTYWx0ZWRfX4CHWsDM9vO+B
 SaKOxwpG38DUeS7VLi8sb4cRCQCDWpq+iN4dsJx5YlhNSDNrIY41fqG9Q5frqW4GY5TZNHFHdpF
 B8Wq0pZYE+PccHpMO1OmhX/RQ+SEfHEzlZaaoOaasige2xRLdTfW73ESapa1el9hO+iBqkoBJ5L
 zDlD2ztPu1/qFdv7hnTbfE36U3aQM5a6ecbnceeyzSd2wJJJ8Y8zSJTldUaVSB4W4T29R7RKqs9
 LJvYWjOFyStkrm4EiAsJ+Gd6FRLWVRBzS6w86gBFa1N/9FYZQsFAPAd5fh2e/0kPbtD2uIC1t2o
 iDYUbA3Ya5oWLqJg0XTB1YVWVriJKi7+aha443pFm2v3K9REA6lFgYSf+ec39+8u9Lj07hgb8Rv
 YhhnJCaUszQiDpQ8ODXMBS0gVJaJnqN3YyVXHARafCo7cj8Lusp/qM9st1QIl4asAmUX9kBJnu/
 upSsGTSCs6f6Y+WGbPw==
X-Authority-Analysis: v=2.4 cv=JIyuIMKb c=1 sm=1 tr=0 ts=6aa8de0d cx=c_pps
 a=+KlkUUL6BOGgxGViHu3/Fg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4MyBTYWx0ZWRfX0JdNBn6faUoJ
 zF3FdMpIENkWopk0SvXB+YNWoZGihWfoOgfYbzC3pAuO2G5tUvz90hFhNZ54Scz1mRBke5ChYvK
 OERCBcpOnUPr0unFzQzicntfA378B3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150083
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 05:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20375

meta-ti / na / 20260915055324.1142908-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609142200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 15 Sep 2026 00:53:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f06eec267b3595a6cbeb471ee2e22adfe9ccd457

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: d3d487e2d9cabfc387bbf0c7c6fde966a288de0c

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




