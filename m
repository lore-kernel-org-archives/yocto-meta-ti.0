Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3778CDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:45:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5377.1782157510216933060
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JNXQncGb;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=kXVOmx7z;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65MJaNf22220784;
	Mon, 22 Jun 2026 14:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rzmeoaA1HWPapGJKwhOEx38rpR2p+NyEmHMGlcxbl
	jc=; b=JNXQncGbkFg0cZea936eI7Scp6Wu32X5nJUPqgo+ZkFqRn7lC7hQNU1iB
	hlryidYtSxBYUXE8hyWZUI2G0z1boA0pU5KXnjFX1+GvPyNG7hFpfAmd++fEWV4d
	EGQYem7Uvo0TcYrYIL8ZJ2P7rJUhrJGOzmMFHmBxNwAW2iItKw47AwHnGe+8ADRT
	hj+tk5Q2nfAwr1viEINckVdB04wEbAOB6J5XhbyDC0PMEj3ZUVnoegVgEVn2+t+l
	/UAFkEDvwAgarbywUmlQyU5XrmehRaZq7DolaT38ih+elpeYq/nTlEPdd3WI1ECU
	xGn39avAQNa/PbGQJOnZgpUWKAEgg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010047.outbound.protection.outlook.com [40.93.198.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ey42xttne-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:45:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N20/STsPhPnMdq0oDRe1QDc//U9+AcCIFN6tTbkvmqY7ZiwCcigFwKhlvwUqK7f8WcixO8F5Wf4XyQPmy/ZLz71AX3LJJPyuv7BUT+jcG7pt3cvuhVggkcZymtIwGXi0u3P0ibKprufDudd451UoGhKWs9RUDXsuDGwUqm+RHpAr9H3pPUffRrzEiRH8bxO8XWTrMlTcmRLuM57ATq1msXsRAnnMj2ZRtTLkgidRW3mZ+1/A/DgYmg8B/02TmgxWpKFUoj6lNxKVD8ZxufP4pU7ZDuJ4CLAuPSQ9hzGlkh8kw6adC71PSLiYf8J86Z+oE1/H/UdIYxzm+jrNe3LC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzmeoaA1HWPapGJKwhOEx38rpR2p+NyEmHMGlcxbljc=;
 b=ugpU81d1Z9GjNzzsDXBhL+sRi6jzaNdfRNJEML13YVkLyNJ+9+x0QHjroFg6O6rvmfaAQZT9+3N0TS+Augs1pVHCaCbygWUl7jVUl4uVPByLMjeTBSQ9Zj4cDyB72ToG/xKuTB7p7aogwKVVXwwgTy+CW5IxkPzbWtyDTGKPZpT1mFODSH/hC5bnnIEyFbbBXgjPVECbOqsU/BMSJC3S5N+A4vTMqFu/lt4Z5LrfNjhTXOcFFUX6p/M2EE3Uia5TV29l0paN8tLrS04ygMCnZU6vbTvbQ8+RVKbE6YpkcUBz0b5pcNSivPweLMdULiai/s8wE6lmb7nQCUgeQH8HAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzmeoaA1HWPapGJKwhOEx38rpR2p+NyEmHMGlcxbljc=;
 b=kXVOmx7zlQUMqogpsxgiv6NFMTWJ0zpz+l2pUuuZFqBcqzPnVWkoVE+CRS4OaL1s9fGMo6LlXd/EPxO2dZNU/iQBo2twRiyS0bI3QGYprEP0YMwevjPl1wfkyvstLdnRJDadXQAg0fpfvBMt2uwAuIPbK7mwVR//jfCAcdMJ8OY=
Received: from SA1P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::13)
 by PH0PR10MB5547.namprd10.prod.outlook.com (2603:10b6:510:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:45:03 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::24) by SA1P222CA0011.outlook.office365.com
 (2603:10b6:806:22c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 19:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:45:03 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:45:01 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:45:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:45:00 -0500
Received: from [10.249.65.70] ([10.249.65.70])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJj0IR619925;
	Mon, 22 Jun 2026 14:45:00 -0500
Message-ID: <c2d46c33-534f-45c9-bfd4-aa7f75a9fa44@ti.com>
Date: Mon, 22 Jun 2026 14:45:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/2] packagegroup-arago-base: Move to
 libpcre2
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <18BB7EC1FB8A90C2.1048178@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18BB7EC1FB8A90C2.1048178@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|PH0PR10MB5547:EE_
X-MS-Office365-Filtering-Correlation-Id: 04893235-d993-4f3d-d8f4-08ded096c0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|4022899009|376014|56012099006|3023799007|18002099003|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	z9A3Q64NBPy+8JsIyizS76Aihdyn7mqkfTFngpaXw1qcGtBiRNKJTIHdAKZqvHfsh0H5XgO8lG8w9tR9i/wSEJ7vYqJMJirFgemKvbp0J4yuFHn/zfXjOGNnZD96aQ5A6EAInvo04efNIYIFyojLGCowQQ5DSmpKy5RPAZLLt2RXIKWEepa6OtJgIuNuStIQVWDNN2n1FbHdeN3+tATx02tVvQF3RdptpLsLaRqUbGtnQBFJaD13h72yyoNy40qf3FuqdQGd33nrdiBdh/xVnwoyVQbYAGCaLrg+N/AepLANu0KzmvK/bpX+8g6I+zEDPMdBgB5TVTR9q3e8j7wx2w8FT3ZyfOcroKxmYnvGDPzxlKwOxXyM/cxKGHwBqcSLftCMHWDeHCtSJuVDeNCzbNagsh/4NN2VwO+dX4s5tp7qYjvayjV5kKi6K9/hO6n8VUgWjntD70vluLSOC32GMUJrhDDPoj+S67b4xdNEldX+2ZAsrWi+ysry21Zy63Gm5hjsgdqEvhxL6/RjCeSWMroIz3Na8I5+7jERq6fiX9FU5M8guHB24d93l2ZJ5LerexPPgdl1GtUmuCPyrHWASgQtkN74Sf7YrNjyhEvzAqOGb4zDS/iyCk9XUusVVW5BDrMGq4OU7Xe/CUcPWjZCdwlCfsHb/UkZtduDTVriOhTpP/nqrU+cjqUlXZEtk4AZM6Zp5AAmZrdgL6XBevoVHA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(4022899009)(376014)(56012099006)(3023799007)(18002099003)(13003099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N59guEHyvhHnOctkkK6oIzEIuqBJpwtXl/QHPQAG2MQAmDkLdYD4M7GAVneEhthUvz8kbg3HYTpCG2r1JnjRsC7hOEjhPTL/wk9acAgMKnCQ5rnQAYEMXu0YsEqX6imTCldJ/Ym3nrTGfS2k2reVLM3f0G0vCMt76rrshW/yWY1fSgtStB2cFhqvVRuE3fVD9sH4lkLzc4urcxDVpQsMNSkweCkQmuMOEz53RIQtp613/yzNAefkCmZcZKnOzsyAhFHPX/FhfsL2jrDQ1kIynI78jMm+/KJU8YmW49hA7eGugPJLXeFvMzbyu06GqCiwA1wlPo0bKYI3WOe88+Wd1dA0yDTA/JFYnovQtR0uQjCVbMWjEfyRdW5KftMPe5qkYYWHf398wWKF9CG078m0ZvJHc4VMYqD9Je2C9GNOBFm04GBk3rhyHnPAg8jR1XpS
X-Exchange-RoutingPolicyChecked: 
	nLhfyi+zxhWigP0UPn9AfRNUFKtn+TP90uh5IRjjQoMxtY4cqKGYkYZmhuO2jv6dDGx5ZxhuUpNwCRxT2N9F9RuCCoYA/T/AtLEaOePDFSHWIrlWdpyFgfa77lgIDOVXUtkQDurO0TcofiDoAX0uXR5RmDwNN91cPrSNRoo8aIAiFzt9UMPe2htZ+JaqzlHEuerooW7FzouAy090Abxsn49V9gboLhSKaqkD0kJwpMZ8xTo7Yz3iKxUhwTDdM4N98cvMDWOoNyIai5Cf9YNbHjtyLlNbTcDxjkCtX6nHEV802eNV/4wyE3K5Fzxx5GB1caNERoyYAtfHdjpAj80k5g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:45:03.1874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04893235-d993-4f3d-d8f4-08ded096c0dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5547
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfXwb5S7dU+lvJE
 WVnLh5/rNsoneemGx/0dF6v7ZfuP96ba5nxM+C9LS50dMqvDWUz4Tb8MjeyUVDT10XLI9HzAOJT
 eAHl8qdwLRMlaAMBgvLpqR5B38MJsGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX3NRIehRvlUfN
 y/cUljoBAuOBbsCoGMY72q/ip1ckmNje0fvMUWKTR+LVvp2ygdxTEI8t3hld7kjv+ThO9lJINTt
 yT6Ua1YaxLmRtl9Bh7R5LZnMAexwZ6gBJ5ZaViEQwkctYo66MuQfU9lrkYAFEddgwASMSW3EIkz
 L9x37msXnY28ZCs+P5mnHtnbtxWULnHqiV71i0UfO7UdtlEFmVzuO5mQcetVaDxwGLLzmfD7bvZ
 SnVDr7k435zu9eYNVKPUsr4cIyz+BxtA/ubno/nkCzbVg0urLV6BYHbiXIFDOihZ8mihHdu6FW8
 h8CimtdR9WN632HOanOkpnJj+2L24YUBktmIl8oR09WpKAPqTCIc+e7uN6gFSXNfw5DhoR0sH7I
 LtY/9MHkMiClZT4tBInhww/SsjMb1KhYQt3LPY1P+RUBWcovRnwgN8dL6Wdfl32n6sk+x2d2Xo1
 9a+tuQFMb1zitXCROzg==
X-Proofpoint-GUID: SRKoSKJJlG1N-IMWUxP44XkMxDFtlNyR
X-Authority-Analysis: v=2.4 cv=INgyzAvG c=1 sm=1 tr=0 ts=6a3990c4 cx=c_pps
 a=NlF6qXdsITzFGNsd7EO88Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=U4YeKSY67fWLmiuHV5oA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: SRKoSKJJlG1N-IMWUxP44XkMxDFtlNyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220190
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:45:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20050


Yes, I know.  wrong list.  Copy and paste error.


On 6/22/2026 2:44 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in oe-core [1] has removed the libprce recipe in favor
> of libpcre2.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=057cccd9576e1dd0f947fbfc390bc06b210f71cb
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index d36b4397..34e95926 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -38,7 +38,7 @@ ARAGO_EXTRA = "\
>       expat \
>       glib-2.0 \
>       libxml2 \
> -    libpcre \
> +    libpcre2 \
>       iptables \
>       iperf3 \
>       netperf \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20048): https://lists.yoctoproject.org/g/meta-ti/message/20048
> Mute This Topic: https://lists.yoctoproject.org/mt/119930402/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

