Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7207.1794395175183163130
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 03:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=G+Avay2a;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=oS/RvtmI;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7MBUM088531;
	Wed, 11 Nov 2026 05:06:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cUGmdTJI/Vpi7i984EnKh/gtdip4bpWUuPxUK3JN6
	jA=; b=G+Avay2aaTugiQeTLL2RLAbFoceMzkpRA1LGeYIijypskGS4ZKzfJ5Jqp
	wIUbiBQ7I69uefBXbWDRddQa7HZH0NcyjUZ98rgHQTDqsjY0At3kD1KEJc0MFNi1
	N/ddrHVs0UhpN/NgZ4s3CIw3HdmZjx71Uguh23fEYKSqMgMRAH/UY9SXKB5plnhA
	ZVa5M4bKT2RbFQzbLD6Ri2YIuWY5VSo0OuyG/C972M6OPv1yPTXBHHo+M6YmSYHK
	S57LhA9Z1ZznR2aPdKCdwQBhUPbQd17BTz15kktRUGbmoD80LuI/T4JzqxNOcwUR
	yV8WYxOPIVEYUpLlp05ejb6Uh+Iuw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjvb36-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 05:06:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO2ONtA2EENs9jRllWjMGFmWqIuvEaRtFqMxlYssuX0wWl5ldWaIGsbQ5ww6qopcVhWlYQ1h+CoFLwE3P03QglDmE3K06H+XWvauIpbNtnxxxRmN4jZu+X0RQjFhKfG4/Ba67Z1o07wYxhSqdN+kK6385wiPPSGX0PEw7IkJcLptD+F8tG07gSSs3hibjZDu3SJuRlgzDz70juaISa4Hr9eefF09a66ShYjIOaidaR45+t52WwzpbATHO1hTTt+EaGkJoF+M4elFhDNT8Ha8Bj3hrNC2I1xL1o3GS4ZyNGsOFH3N4Hgbv8JwDgIM4qIYtTw7iCCnUf5HYY9pis/1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUGmdTJI/Vpi7i984EnKh/gtdip4bpWUuPxUK3JN6jA=;
 b=pNWzCyQHieriDtR9pvhP9ebXtEFViz8CD1G0Ha2/qXRm05bOsCI04N9Ymg/oLkcdx5mtgj6a0viHz2/n8MgRnveMMLA1/YisDT/GvXlY5Cg6rB8xEE5rRE6SenJQ1eZ76Zq1crki8eac2kQHqHwesqoxZ0qSs73PofzrSR97NB7bkW7GhVAtVsmqe6FmBMeSUr6BtnKMVcHtCb6k5ngOHJ56R60YsXpfqAablFxIdlpMMB5RsszFD1xoJX4rHnZWOxWGOGEikluW3pCiTZdMJWXlpuRvndtY4ENfvtcBFsiN1yc1UfpqPuKe/liCm5NFxyNxlNEuUCa8mFAnVW5cHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUGmdTJI/Vpi7i984EnKh/gtdip4bpWUuPxUK3JN6jA=;
 b=oS/RvtmIQIvLl73cnCZwN62wSgI1Vhf77v2EC4MMR3CGJDIEMaNh6W1Bh6aGbFRqlb8TTMszHyfo8+rPLzwP36eFwdMPdvJC1GyGYsN5O4Yto/FTO735vAIDmqJSdUzx/L1B3SAf5nn9ioc21k0/D0lTurUfKq4qky1UeGE5LPOUAuaN/paRSDqq6k/Sl3ufB6bcJu2jjO5sN+cVxi/1iLtlx7xsQgyCOIkfSMaLzcEJhhjBTSOHzMh0V8D8uTOE9SOy8fNkTmJCrAEDIHQ9tsNN67omsZspoVUqT1xh0PwL+XkYXYfKtzUr2sZyDuNZ9c335pIf3Z3suWLkhA87WQ==
Received: from BN0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:408:e5::30)
 by SA1PR10MB998109.namprd10.prod.outlook.com (2603:10b6:806:4f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:06:10 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:e5:cafe::33) by BN0PR02CA0055.outlook.office365.com
 (2603:10b6:408:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 11:06:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 11:06:08 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 05:05:30 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 05:05:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 05:05:30 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABB5Uxu2782219;
	Wed, 11 Nov 2026 05:05:30 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 113A22C86; Wed, 11 Nov 2026 05:05:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [wrynose][PATCH] Revert "am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel"
Date: Wed, 11 Nov 2026 05:05:30 -0600
Message-ID: <20261111110530.2485377-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261111105934.3239366-1-r-sharma3@ti.com>
References: <20261111105934.3239366-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|SA1PR10MB998109:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2b98f8-196e-4877-1e8f-08df3fe3ca14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|56012099006|22082099003|18002099003|10067099003|261009223027099003|261026140227099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: TifXqy5gssFCESQ7OjrHgXMAk76oYe5DcdFlFzcPMkVfZLwpb2K+jFH6wwiSmKvLjDcjH1qXVIHNuQHyquRJw+YOqL4iB7NLZdXelXrXvbANy6qjW91gkKE7Wzp9FQUjwt23bSWrX369ITfMarFzzBPGgptV6LLRAC14spuC9+iAhFffvGoHxlzfq02vn4Uva8N7x5uM9rN5SYyaGHFh4gc9jUBYy8SCGuqSAWtMyBk3zFWSN4bNs/mWsn0udybH3y5Ad6Gvk15S7us150jyZHAS1+Etg8zKBSGSLinzE+0KAuELYQmyZJ6yuHORiP/yy8gsgsoJKcC5Wp5DYsp6rFIX7UK+0RaPBDMusCAwKhYAnFI7YxRsvtSTpQC71kYrCx4XOKKNPYFx6IhE13u/VmdO127dWv4Sk6c744p/3etHUaVi3SQeaFLup2LXLWxcR/mnpqAP5K21A//Y3c/EhCSvB5AyLY/DIgT/j+eASc6eZQAWs1obCOS6N6Jm5F0w8UUvWReMm9668256qTpOd4u5HkYTb/HJWvue2+3Q7Y1iHgWJpODK3IK7un+/nT8EW8Wp/oWKMbso0q9yQpxI9v5NUaDxQG5F7EkOX5T5zalo7M2R3hW1HE+XMvabL1RhN1WwgxCvcDVaIjpgU4Xpy2q0YdVzOoEh1GBloOtW1YIBgO+RaAASZe2dVkdmAQhYghWdHtW5wyloTqZsv9VhMw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(56012099006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YkYZRupri7jZi7OgyWFltAq2v1YpD2xtBzrl0+PL8CIK5dT/9GNFID2EvcPAgapk14cR5UUv2LWzwKemPydS4UfkOYdEsf406qE18gwVi7OMtrv37jdq+xrUnILxnJVilDGi1csfhOqVLoY7HFBEWSIJpRMMO0KAFQ1QYzs503ZiWaHASbmCL2B8HIcmrlr3/I7uLGShEEWPfaN7c5jeMkRIyE09J84SreEN4Mvr5nYfkLbZBye+LFeJ+EJq8XwiC0evC9rT3dvxkpj3aDtWPnw3kRQzx241C/cpOWGEINHu6VDTPptjK7b6LzJNl+8bMb6XObJBTGwaJongV2/aL5lTx4OC4d7pHjqaF2MsQ9rQ+dDH2nnWIyO16ZWDg1hRK1bOO+tXc/paxifZtChsVR5gtbJVEn5IoZTyaQNSwFKuWIN5K9qT+22rzW7C+BMP
X-Exchange-RoutingPolicyChecked: N1yHT5bneHF3cpsKU/Ckqt7oDC+qCajrZ+WkWzevS2+ngLt7oPPAOU4w7sF3tUhNeBfBj72bQSayzMO1cOGErZGUrRGWJwW+gUVxmaEP3Ytl2XFmvScH1cA5BQ7MJS6vxklVjPLx2QvPFz+Haz95nx4/Acew93xp1oWHJKNPQJ1xQL02lWmPmtpjp0jpwW8F393tBYjXIHO/WRkQKkhuLgaR4DxP0OH0z0aTpzogdG69fc2cp50mY2ispWgIbdjdC6uYS/hQC1wQogeQMIXcGRzfHf1cFo95pl0X9h54apl7s2KTTTAJg3HAs9XCNH8HT9LEfHe7Tg4qusD29WgcsA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:06:08.9119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2b98f8-196e-4877-1e8f-08df3fe3ca14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB998109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX2Rwk2HcungPX
 N1c7I5mi6DWLTGKtFrla7GVmyS80ek7+N/+1ebtp/O3sFC/lcMeNpbpIXTRLaKQp9zVgx7iBwl3
 Jru227drJJQvIaovQPWDbKxlp1/eLwSdycfwCRdkgaq8AbyAebEGHslXhSpwBtQWxIYLf2zP4Z4
 4H/sVBbnJP7lZEfBz9oYmquTM+j08ELYjUvwn8PruXYMMf0Vax/rsHJzk6g0rKbqNed1ls7UiVD
 u5BG7LrJTGUWa0bM7iOgx78AsVL4YQVMiQ3j+hOIb0k874pI1pibCttTmn87CksOaF30I7RTYD0
 cWRQrEOiW/YBuf0F/JH4DNimrMNd4XBkrYqpSERai/rbLvsVFpoIJU5SoTWwBFs4CA2ym8LsrNn
 4MqxrdGToyiz7tiWVUbWrlSvmCPJo8f59jsengBglv0AD7yz3O91Szzm0i16ie1kgZKTbt1p/FL
 NAPCMuFHGq79bran5/w==
X-Proofpoint-GUID: F4VmUP8Ei0K0CVKLfWWK1Ni61_KMvn1l
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af44c25 cx=c_pps
 a=Pvk2fBMKoGc+EtVHRePnOw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=sdhLoWiRsgxQ4D3n58AA:9
X-Proofpoint-ORIG-GUID: F4VmUP8Ei0K0CVKLfWWK1Ni61_KMvn1l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX6QJa6KNtzv5p
 DqU795OODFm5hKqb5UL+jmi4jXEdeZyXheYhQEYELRkYANhTUNA6L88bOwqvBEKzEbrKg3uBb9g
 X2yrb0iFSaC/Pmyvp5PpCr7VK060Dsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 11:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20523
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261111105934.3239366-1-r-sharma3

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
- Patch Series: [wrynose][PATCH] Revert "am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel"
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Wed, 11 Nov 2026 16:29:34 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d208c0d1cca44079fe54f50ee958ac701d97ffd5

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



