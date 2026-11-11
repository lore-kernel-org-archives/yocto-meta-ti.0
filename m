Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6332.1794392216566254373
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 02:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SrmLYxXB;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Qaii+ifA;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB7HrgY941816;
	Wed, 11 Nov 2026 04:16:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3crbIsm17BbW9YHOVFlrpGTFY436twItAhwHG8ara
	Rw=; b=SrmLYxXBV2WDK3BflMFQcCEdRcMWGejM96twYJbYvzT8MRKJl4q7ElQfr
	UQLZIcsA7H2oFn6phC7VT3EsYFizQ9MiZPwjwKoWzCrklJL7TGu3VMiHNmEPHUez
	VYqPsp/13RtFj8/p0KOTqXUnSvlEnTXQXvxQsd9yfYYh1AAGLbc8XxK2xod41i9k
	9yJuo+PNR6JTKM6t1akKkDi5kQZ8b5DuFZhKi+Dy2iwzRIjZpk7XrNnqzyAQwbk2
	EIx029wS0jDvuMj3nIByekOIM+r0odXSTy2v8mbdTZxWiZLiCrm9MsnWmA2CGGb1
	gHTflw3/4+ldTMm6SeVLc3VOvPhZg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygtddn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:16:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIDNAY3tAKeFbzmmEm6KckTyHVIMNF5xEsNu76EWoe/6AazLYTibjEp0SXtG7SILD/flNdjUtLbzuYV7Yul0NZ9GjjDPqbV5jLC1HahB+772WR6bj3QkBDSbQdgif2yX8e/2h64bRsRcDBMOMReKjqCo9meP7dcGTjNg5kbQ52ZR/Rm6Ugb+pegnP2VtmaIxMP7oWfiEzguW029ogInilpp9vFdOZTXI4GQ7Y7D0NOsLZUatQG0MytxcXRkGAoMQWDti79O3kyQA5wfz+b91kUn5sf8XPDoVbDr2S2B0WT8AqiINRto1Y7dHes5Xwf4/qNezU9Z9Mgu0geYJnmpZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3crbIsm17BbW9YHOVFlrpGTFY436twItAhwHG8araRw=;
 b=pic0ekaw9tOQQQZnTPL7Pb4lEQEe35f4AYtHpYIu++lhAp4CiuHvpZLQMSsjqsCMLyXxPR10eyKweiq9XQDsCdF4Ktfy9u+mQEG1kYsAYjxiIz884fRcMGUJ6DetH2XnEcdiEa/gDBBVRakck5/n24M1Nz6u3X5vwzn8YBsb5eQa/vvZpKZhRv//6YuHgOHC2VfVtOBSJDNThGdH9Ibguh/m6F6gRjZi70jWEt1vJVvG73ezXYaW1mWleqLmf6ZY2rehcqtiCXEpSVlZX8Z8jkzLPM00zf6IofAXVQcqWDyulowk/7tiRcNJ9S5YFfVAMS8XHATM6u7ZZIXo4UlfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3crbIsm17BbW9YHOVFlrpGTFY436twItAhwHG8araRw=;
 b=Qaii+ifAW6x/Vy6OqRhU+x1YsLB5SgLsCQxk25o1U5Hj1XVjGM16OQtNSWv6dp89dUNRWHm8E41ltbc1+zk3NomIyfv95YuwM0psFFj3Wotps4KE2crAYMGI6wk/QtVFbwkv2zhbxh7aX67nvPmzU4SraxrOLETdrurQ31NgJKTF8Nbn53PN02oJ6sn0c9PfveXMud6GhlFYbSCquPVPC8nOyqwaoZJPMQsC1xoOwTOGsyI2SNEgomuBP6db4WKkE1ZtpY4C4ZGFk4DfkHdonlFB5TtzYjw6miE5W3mVPxYtxJ+z1jDMPKcjUuGSVbCxApC2/qSRDtLD8llCbzjkIQ==
Received: from SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15)
 by CH2PR10MB4390.namprd10.prod.outlook.com (2603:10b6:610:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 10:16:48 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::2e) by SJ0PR05CA0160.outlook.office365.com
 (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 10:16:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:16:46 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:16:07 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:16:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 04:16:06 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABAG6aA2706210;
	Wed, 11 Nov 2026 04:16:06 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0E7352C8E; Wed, 11 Nov 2026 04:16:06 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv configuration for display support
Date: Wed, 11 Nov 2026 04:16:05 -0600
Message-ID: <20261111101606.2443290-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261111101358.3203148-1-r-sharma3@ti.com>
References: <20261111101358.3203148-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|CH2PR10MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c182fc-266c-49f8-5b69-08df3fdce47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|261026121527099003|261102123227099003|261021121427099003|261009223027099003|56012099006|261022075727099003|261022105027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: yk2DxD0nE221Cpz7uGuuhAVTvVMEOiBUckjJ9N2QkzG+PrctXNAp1G6dAOFqinaL+BowNkvL0Zuq3QICpU2HvkFVwYXgkdxkYCJbIfrZCM7o65dTdHXSg2O9sR9RvCAOUXw/Wddsij53DqLKVPGWh1fMOp0IKPNBciEDf4jr4CxqFvihyRk+Jd+FlilZYGs0gnHrpeK3u9tRXxIV3CBwzF7zvHt6MtkplzSHEgBDHibDk5fCh8G1hCbhzV2NVfQUBCpi26rYLRpqrfIBKAgAv/AFZ4P881J6bqvJ+L5Wgk0ltiGYG0Y6dFgwx2ZnA8tGC06z7/wItZ3V48u2WvS5KxV3/6qS/PhWnTdCBQGIElsBHOCGh+Y8/dmrIcMJYbFYk+wN2rOchc082sE65zWM/YVFyuu8Ee0iq6+tPVi0nrll6Zg5FU2YWbQ0NtXeGaoVmKyM7ys5N4t65D6Gu8sk+FOUitikzi7kXUHMS1LIvbajm663fZCAuDflaMAp9Ta0COg2qX5+LIRVR+qNlF9ZRuxeuO9bFHLmof6v9WnMWQvkxbW0iUvM4qmphJZkUn+rbTMzr8yVvyrKGP6H7ZzkulfoEGAPVPXiwbOUN5jafvPDKdDs4rn0BwyWatVoqFOUdk5dNo9izMloOQVb9+FAV3c3GuzTRwPZE9VPvql/k44=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(261026121527099003)(261102123227099003)(261021121427099003)(261009223027099003)(56012099006)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G53Sqwi9idEjiM9G2DIofY37lUabZEbTgQAgXjvCQZDrKsC5SYwcjNfqsU+JSXmK5n+vPFVQa8LAlD7Y4CV4cfTyeYMVeMaQNHWG2iOqWfHjTI/2EesixEJPIvCkxFkVXnILNladBsVhUB9xXkFKZ/+FN7/67+3X3C4A8vl+Byy1UAIrxy5DehFMhfceuduSW4I7kxlKKZZWDCNt0bfLsjgWeP11Mn4y8tMshDgDUHoAlsoAemIc0a0dcp7kncfKD1vNllukcj1om7kS0zqU87bywUb/Z9uqe+Wl03evDTKHWO2vyiX1md/GUDzYIY4MkLIn+jbAtaMhGh24+D/cMFxyEyfYIHcnfBV43HmVil36tK8Uc0nuGsZQJDIYJqMaVenxLOqaUTM55CyqxiZIsmve1B+KFEgfaiXr3yF4FHPESEchZnIdjg1juKVN0/2Y
X-Exchange-RoutingPolicyChecked: cQSu0pYq8qRV5VY8dZXqcjLe2nBD4fCAjG2ksOq0zKGrNbn7VtA0+znDqxOsbCcVhKac0buETYySmwbsDFNM3DX3ziPcO1FdSH+CxPK3SJqdhtNB+fvJr+mwfefFjTGPo3cyPSMECJW3FZ4OJIlGGxrQMEjVo0x9ed3eG51ir/NHcmwAzCnUtvr9SxwIbKtACHCQZZ+BjmAB1nVbYUcvZl/N7dRGkhRytg4VaIo5/pPhZI49uxqENwt7qYE5TzYoDob6d8oKerPhdEmDgi+RIXaX27RtwJKm4wQ1ZGoJnjopn4sd4szVF3wQ/24LP1NgY6s3LO7Yd64b0GccrvxULw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:16:46.7215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c182fc-266c-49f8-5b69-08df3fdce47b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4390
X-Proofpoint-GUID: _y1iUDjTUrWmGi1Z-EIoWBy2LIq_faFA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfXxMfpS0qg1AWu
 r8HGpltSDLxeN6N7rjh0sJVdINW4RdPycyDva353QApjDWng+Jeqk9M3Xyc0aYBBTuN0i/97oUV
 kKN6XNz0OqjUA+/qlS2lI/d0hJQ8rC0=
X-Proofpoint-ORIG-GUID: _y1iUDjTUrWmGi1Z-EIoWBy2LIq_faFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX52dtbJizeY4L
 XTNekm6ZjqBkPu5XsT//1kyhagtbpxL+QpHp8wKSd1rD+VQqw0+gEKIlDq5qgVM75HDW/uNnvsr
 lnMyLFUjp0W2v7kdaCrI1g+d4n5Fvi/ewKqqqTxuYaj2ucyczk5fqsrJ4E4nSiCVw7LWv1Uhg08
 dCvRfF9bxnZDMqhN6awxrcPQh4j+v9Z6ks3hW1N93AvIeHLQ9cVWuISh/I6+Zla+LsxUQWolAZb
 Ln64uwnjiJDuj4lbJUqCgxLu7pn5m7x1xtI6p6R9mg64CIarzrZGCnim2NKZCd/1DPW252nc00I
 VLvArjuDyzd/5e16NxCBQmcHCJKaezEWNmkhsIvF6y+GJbR1pL+wa0cEd7GHJ3M7f1d1U7X4jWQ
 8z/R/cwVKriPaG8V9nASmu+GqeCHYCiF+r0WML/8M/RyyKuzIrwLy75L4SPEjOrfnODdPELM52l
 XX5ucZplQ6mMuo79iDQ==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af44096 cx=c_pps
 a=E7iPWXAsOYqR18yzHj3E3w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=T87pTOIYAl7zpa_LeAwA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110040
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 10:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20519
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261111101358.3203148-1-r-sharma3

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv configuration for display support
    WARN: Commit message does not include file/recipe name: am62pxx-evm: Add tisdk-uenv configuration for display support. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: am62pxx-evm: Add tisdk-uenv configuration for display support.
              am62pxx-evm (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv configuration for display support
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Wed, 11 Nov 2026 15:43:58 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 56275f2b2ea875e77d1bf0be8d391eec93a5af6f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Rahul Sharma <r-sharma3@ti.com>
- Commit Subject: am62lxx-evm: Add DSI config fragments for display support
- Commit SHA: ce7e8077fa980d8e634db3340f6f9e8d81a12123

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



