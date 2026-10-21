Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11601.1792623760735298447
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 16:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eOXt4Pxp;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ApvvSIse;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: praneeth@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKcSrE2630046
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 18:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bqWD/YdeLrL5wdIFYThtKPr7n9Rn9wu2QfUteKtRg
	pE=; b=eOXt4Pxpvt780nmMyFC2SsKQwywB4V/+Onnru6GBLodvqMuj/DUNDM16E
	LxNWxSQzu7Vgc+KLMM2ZunXd8hJ8IrO2Y12olu0v/vmJdJj/VovdBEk1ODLElnf0
	FLk2sT5xqHGkMHsRccFYcKeYqFg2NUzzpWwV0wY2DvOYQpHix26e1xoH5lIDFxPM
	/n/GC9IcYCWGhcb4JOlx/R+wl2AP/v7JNV8hzuEkkvsMrnp1vfn1SNuZUUJHlHTT
	oqpvwsHJvlQtjJDApgfortshZ6nlJLwVzuJHsxjPNJjleh60dwDkQLdb5sct+fHl
	TXEmDN0e/yIhwYyj9j5+6dTJHUvmQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaansq9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 18:02:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz18e3EfJmb3R6hfHG8o/RKhXNKZHDGLchW+s8YbkRWHAY3Aj+/m8i1S+05NeQK0O4cCwWq/ST9jzuJSA72IlShIF584OTNcP47BevRvCIVyh3DiLiMol7aIAxOISm9y11rwLoDVqxB70/i1/zB9OcsmflexwtuB5HFNxB332gpYtPmkZkBB7Iy8u4sHxe/Eq46hF5El5lxFG1vOZ2NC4YVkhDHGWIVQDR+PiRAxfKLGEVpHGi3Q31gLTHuvStZ/ru7dWzZwpHaMLIkCXHlzMy0fUROXVTSMf8+ehL47Jwg3SoR2KFbYKRBwaY/kxoHU+lIdgHOIl6xLRjB+5OFXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqWD/YdeLrL5wdIFYThtKPr7n9Rn9wu2QfUteKtRgpE=;
 b=qnHRPd5wdqE0lX4PSoNrPXjLA6EW76/jsEPeF4PAU7NwaOB5FF+TP53aTuEl4g2IF7anF96LNIsbPegFPXPOTsoOnZeGzWDLhl6W/KXVPPlglRgNJ1sVo4Q6HHpDDdr8NcPYu8YtsQTpQ+VUug06CEG/G0F814mMpwqZG3ukuYjHUvuOcRr4eoLKDCWchZ6SGACWEyT0PmQLE02ZJXNqe0Og7bDe4aEPXBjR5l11/aJmjI1EO3hM98v/lAZEg6KqlOyyjZxdfJ8odGnpv5vJpiGWiHkskXFVHziFH+2M8BiMxS28uVq5QErKBCA+kygymTLUuILcZRFuTE5MehJHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqWD/YdeLrL5wdIFYThtKPr7n9Rn9wu2QfUteKtRgpE=;
 b=ApvvSIseoVHteftQPwTOjgMu3wNr6eajpoIUGf/D4+8roTV6mPLv95FnMZWx6RslXQgwshkDcJtgNlQo/7AWe+FF2Y+3KkgJwmqdUBJ6qXlR57F7HAvnwY5LjFVv/W31giaMCJRat9e4Tab2PSjkLzURFwT9PrjYbcz1m8eaXQM=
Received: from CY8PR19CA0033.namprd19.prod.outlook.com (2603:10b6:930:6::9) by
 DS7PR10MB7251.namprd10.prod.outlook.com (2603:10b6:8:da::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Wed, 21 Oct 2026 23:02:31 +0000
Received: from CY5PEPF00000E75.namprd02.prod.outlook.com
 (2603:10b6:930:6:cafe::54) by CY8PR19CA0033.outlook.office365.com
 (2603:10b6:930:6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 21
 Oct 2026 23:02:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY5PEPF00000E75.mail.protection.outlook.com (10.167.247.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 23:02:30 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 18:01:43 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 18:01:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 18:01:42 -0500
Received: from [10.60.39.56] (ltpw0eb5ja.dhcp.ti.com [10.60.39.56])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LN1gSe224349;
	Wed, 21 Oct 2026 18:01:42 -0500
Message-ID: <476a1d86-d6e6-4870-ae83-f07962315c64@ti.com>
Date: Wed, 21 Oct 2026 18:01:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
To: Kamlesh Gurudasani <kamlesh@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "SAHU, JEEVAN KUMAR" <j-sahu@ti.com>
References: <20261021-optee-411-v1-1-1f22b982bbfd@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20261021-optee-411-v1-1-1f22b982bbfd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E75:EE_|DS7PR10MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c275a9-785b-4199-1639-08df2fc76233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|22082099003|261021121427099003|18002099003|261021123027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: OjDxrs/zCczmpjTLs02eKMnG8EwVqJev+hTF6o201VVl/DPNgvlX5t0ll0lQhqjXNxkV1lvDXNuDwi+4igYIgm9VcesXU152A7sJvPjA5/RwtjaeyWpj/ulzOjNvyd9egThqwre7RANNorey9Xxz4t2F/dfvAu7lPheVy/oqUWbpVboibuRstGTiPolB7Mou6L2WCyGaoNN8uY1aeORXyH7RoZDK6bhgsAgdVjtrMeRxM4KT2kGPuvmmwfOSz6iGXWzyMir3s4+J7THk0eRPpbqI8oIeK6xL8D++3ODpLoAwBGJuaqbV7FmXYfJLTC0CKwuQ8UYmfjDwei/hshFw4DyrQRcBbuMYfsR/85M7A7LKpqTIWPukpHRTk74tpUrUXNFU0/xBq1sBR3NJ5PZjQnkif4aWcdK/l7c0znRTDcviaiAUlJ3oleMp7oCWRWd5HUrxeubYdCzi6WAf57N28yMAhQ3GIDylahXiZtHNpJeHtxxODEEv7hd7aqkDj23NGmJGKDJZD+aoj5qu8t3Lx33xP9CQp7xvoQRSAPxfMLRhfXn0US80OfC1uYYBMdolqjxYpkI4L45ORD5le/U6gVRU8WItL3mBN1fDkRpxAGs5oR8wZZ0QEdPgWK2dQxVNE0bl9eXuo62SyKNbHZDLqGgCV3W/P24TlAIFBRhVNO36tFru8eVJvpETqg7q90W6GoZ8ivFxAn4Zpv/VEQSoBQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(22082099003)(261021121427099003)(18002099003)(261021123027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 72JowckX3cp1YfHxn3Q7CCqEO4/4u6wadHVqsVJvj4r8itWSqD7wLyvPufevCNesB46o9VoDr1pSXe+8hAz5Xgw7F+aPb0S26T6rqOBxQ/GKoSTxwCSRpcnZhFAQCNLuCfMGUcB9P7QT+pC4MR3od5znGLrGIVI5KuCH5NAykepUnupi04NYYIUwavHG0RYD1d9GBdptt2PvkK9Eh/f6jl+AfWjUNTPRt2Pvs0hr1/kp6cb4kin0m4LhzpiEpFtgsBUkZMHbPZXvRvfsHU/Lz48ftQ+RFiiqjKHFfTiOT/yWCS+a6jfMQc/JXPSzIVAvLY0WdTh5T+X5ihPzfG7pqRqvM98dRztTjp5Ce6Oesh1xkiBZGfOO+dPQaeaGXi2m1b+1lxQ4fadBWQ73jSitAfZWr+BTAOtm5CJo7AWLEKD8i7/jOOIDGiWgZxarFP8A
X-Exchange-RoutingPolicyChecked: DyXToAUgCvkeiy8mJWIA5Z499JaJ52gGWH9jZ59Qcup8WZffEq/w9JeeAXyCEOFvktikG43/Z3Ys3w8tcnm5SlnsyTLHHEFVOWJJOoe2o7TA7i6zQmQX79t148gscEaqxO2BFTKMF2UTU0t556Tg6stTS3Rs8l1UcULsoXs9w15J68cZOu+ed22eWj2eOUZC3qXiBFpvECerNnkft2SvjBks4x4Q22WApv9qbBlNZ/QjhqgLexqOEYs1BHzLz2525bVo4GO1o7t1n8prhjEXjqP4BiqNGjNKAnJGfUdbc5VPaqgsr1ygHwch4ctX9hxCQZfvoI/zsL58j1cchNVAJg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 23:02:30.1493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c275a9-785b-4199-1639-08df2fc76233
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY5PEPF00000E75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7251
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MSBTYWx0ZWRfX8NADCP3EqvnE
 XyaLs4j2WoS76O6933bKoGd5N3H60wdmNclvA3I/0G3QZydPy3eofwYSqiODISQlnCqb5M/CRR8
 0oTCWl55oGhzHh4TrNkIi9VLAKsSKDM=
X-Proofpoint-ORIG-GUID: EFWxaVpK-yyof0SIM_8fDUd-nJJeP4BB
X-Proofpoint-GUID: EFWxaVpK-yyof0SIM_8fDUd-nJJeP4BB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MSBTYWx0ZWRfX43/iAp2MQzdT
 Pui8X1Q4Np4tytM4Xw++2uIiyfZsiaRRRj6omruy8PIa0To5dhIlnLqVT+4KLJpxGyv5eVJ4qty
 hT2aWiaY4HZanNK4HNO/7hjNMSK+YCQNh1bXQgv5o/cWc7Q2ePp1pXJZhFVQkj30VLipaoRQETc
 Eonz53M4jtOrS7AavLsZ5kmEKP5UdTQhR6hvTo8YiPUeZF7ZAQgpHD0JKIPri12MonDK2DiY2cd
 El4XeVn3e8yJRNnI+W3mBeKCX9NfbjQC2JgM7lFvta7/13t5xG+QEb6/RgTJdV5MwVaZyiSEe0G
 bA69oM/kgM8yMRf7z7De1IZIzdBhREibxmSY87dOHisP3I7L5AfFQ/Y8z6mz/VrgS8mUwrqcF7M
 knb7RmUDSM0n6bFlP5LRuwYtbu3pkAyv87yWL0OWT64hQtqTa5e/tcxMbP6pfsvWb02ea6BwiV9
 LjFd86J0hct4K3pw7fw==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad9448f cx=c_pps
 a=jJEkL6Umpl9hNhu6gfQ4Mg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=PWP-F8c5hfL3hGjWVSQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210091
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 23:02:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20479



On 10/21/2026 9:06 AM, Kamlesh Gurudasani wrote:
> Update optee_os, optee_test, optee_client, optee_examples and optee_ftpm to
> 4.11.0 tag.

why only master?
Is this expected to be picked on wrynose as well or you will send a 
seperate fix for that?

> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>   meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc   | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc     | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc       | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc     | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 7968f3fb..2418b6cb 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.10.0+git"
> -SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> +PV = "4.11.0+git"
> +SRCREV = "da81fb7b30781029bc9d4acfddc7c60b08deb1f3"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index eea7762f..10da279d 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.10.0+git"
> -SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
> +PV = "4.11.0+git"
> +SRCREV = "71e8f3f320eef46a9369700bf30b91d67427d535"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> index ea40ba27..1cba881c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> @@ -1,3 +1,3 @@
> -PV = "4.10.0+git"
> +PV = "4.11.0+git"
>   OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
> -SRCREV_optee-ta = "e3b1e426a605e0537a3c3c9c24228eb22e354b80"
> +SRCREV_optee-ta = "f09f4cdad21028289d4e8fc573893b75f7228dc7"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 473c5282..92fe85f2 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.10.0+git"
> -SRCREV = "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
> +PV = "4.11.0+git"
> +SRCREV = "f54190f22611dd5ad5d22546fd4209aa100f56bd"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 8a8e9ac8..60ca3bab 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,4 +1,4 @@
>   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
>   
> -PV = "4.10.0+git"
> -SRCREV = "88c93e87a5c172363ee986ded036a25cafcc9d2c"
> +PV = "4.11.0+git"
> +SRCREV = "179740b43809069ee567d58ebd8e0f85ef8168e2"
> 
> ---
> base-commit: bf41b0dcd77d0c0cb56d4e2cd92c0a7ef53ce62c
> change-id: 20261021-optee-411-292b373d1ce6
> 
> Best regards,
> --
> Kamlesh Gurudasani <kamlesh@ti.com>
> 
