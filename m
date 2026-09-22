Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AADEC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:45:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3359.1790102716096091798
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XqG5BDy5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=H7y8viVe;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MI5pWm3010710;
	Tue, 22 Sep 2026 13:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=J70pjt/4a29CJw3Wi872WsKRQXd5sGsS/1cAmotZy
	as=; b=XqG5BDy5FB2m9UdWWOV3m6BEyyo8xtVevwgBRvwi9Xwm5JT43KujlqHlL
	6VANHbZZPKgEU+DEqZ6kiMfX8bixTqlwWheLxKzEqxtIKXmA6M9s7sjkGsnD5ldj
	G9p7VRsmSH/Ziq7lIQQQw0ig7dRC4j8C0lknES1C39d50v/XFJQHaA4AUCiibu3b
	gl03uRGWSfd0olvhWsupWCvPHbVDvjdDerq8aWgBaqRk/LAumM2afXWLs5p1rCrZ
	2XXeAGusR15JgwDU1UwVQnJKrgbwKA1hHHuqRkPJ5GFdEr2wMsOIeZ7Aw285ecYI
	XViKKvSczh9s4g0Vvv8oN/Tn6LyYQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x625u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 13:45:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f40vFQrf1ZXDkTjswcW78aTnq1gEvYg7HK36vcNoC8Mw5jWYvoFRYoeLan4e4ChcNrzkGa74qDJpv4v5WFizSnEwet5j3MoB/4sWvHrcRsA8cjD0JJMfBIV2aOR4XX58rfWouvao+EfKjbtG800L1M/eUOhuRSBXJU1QW7ZC+MRWYxmdcEGQ2hcFhckyzcw9Ah63ERyJVP8rNhvWQnTcXfCEG6sOm0e9afIBiu/+QwV3Z+VsJG1TMyntE2t3EC9J1e6nUr3PZ+bBM8B/eoXbgOYLHK3ReNKJk0PtRKsPDfLbPMleLwL33et4amLX0aBN/7lVJmne9+EX/q4rEG1gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J70pjt/4a29CJw3Wi872WsKRQXd5sGsS/1cAmotZyas=;
 b=WEnAtoas/bhRYopHk1rKONpGM4tPv2A+lz+fD821xQDCuPrMr0G0vGEcRB0z9SxOevryqBUquKXFVjC/D+H9GOKiwFYiJNxI3pspa6ETCizq0pZhvgPv0UwVPTG4k68Q6N/VCAG8Q3Jxu1be4vkaZV0lna3rTzP7nxzR513XpyndAVREpa1Vm3yKTZ+8PooNOyysO+lIZy/xLB09WfMcA4CsL9zojd/Kgml4XYhrzM3UzyNCye5/lPg4FVBkxCDhB89U842T2h/2iFcEoMdEZBQa3QYgFpP7cb2n+vu4Ld+5ZMpBM5v04po0CpO+w8gXLW9OoZSc/shF02JJnl1AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J70pjt/4a29CJw3Wi872WsKRQXd5sGsS/1cAmotZyas=;
 b=H7y8viVeUw+MUH/PvK9D0kXfLmZIonU6AgFrSdGtJ5UdSBN6nlVnQT4b87Kw5SV0nez7irHUwx02HIbVz8qrL/8BDAqa4lgkYMiSAS1o4QOtnD84PXnWwTTX5MoI9+JXYZfW+40NtV+e0U/OQelbKwE0EGr3rj/Yx3P65TiLxQA=
Received: from PH7PR02CA0025.namprd02.prod.outlook.com (2603:10b6:510:33d::14)
 by PH5PR10MB997759.namprd10.prod.outlook.com (2603:10b6:510:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 18:45:10 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::60) by PH7PR02CA0025.outlook.office365.com
 (2603:10b6:510:33d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 18:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 18:45:08 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 13:44:17 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 13:44:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 13:44:16 -0500
Received: from [10.249.33.88] ([10.249.33.88])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MIiGNw517299;
	Tue, 22 Sep 2026 13:44:16 -0500
Message-ID: <cd12b7db-e3aa-49bd-bf16-465002cc0a85@ti.com>
Date: Tue, 22 Sep 2026 13:44:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend
 for config files
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260922103002.3723697-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|PH5PR10MB997759:EE_
X-MS-Office365-Filtering-Correlation-Id: 3820dc48-1353-4bd5-cfe0-08df18d9a027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	/2wBE2yvuQmHJJg2oE1fei7oWzU47F9hwxMQMqCVWk+z1/9h+JjOeJPRhjfb2Ssbx8yMdG+5jOBs4HCto35WsY3CjNOOMUK9PHhT61VL+oCpFye2k95I3/zBi3cdTHCisnZjU7P+u5up19cIckOm4/MyjmByTc5k97Ct95kc35vHfLI16Qw9vnBsTLkxBs5OOX5n1tD6Td6Mcp+VsteA69ebDqTp7Najiq77UgY+RCsC+3CB4BxuCrDZT0g7+hTMGf1ZoaXoznK9DrZCyNLfDcyotr5jru9xfZ/4q7gmWOzquHGouCWsdDtoGY9h4bGoFG7bH6DSx58cTxwJM28hlwfC1QxMz36iSFULtouFo0e9q/XZ5SpIJjEEPnIhcQ8jVCHnLTquj3kuW58jGAvdl3qvTpffjqHHHOrsBulwO0Jr7rXEVNbJ3KVU2t1tqf/z1whwu9leNmCTc+3maoYlademfuH6oscozzdwdebkvWHOQAscWpL8WYbPfoX+Gn52ATlSijYtZxfSKosLbUm2DACitgl6h5LtpYnm2bJDRGLbYSIkOj7kTr0DYSPTCXthHLRBh3YEQbe0H6IQm93R8usFSiVJ0LW+MEtzSvzJopGFwV2nyv3Co+HhXuy8u1c2LkIICN3ci2wAtV9glDOeWxZ9ccB0eYYiBoB0ryLrMSekhssxiBsWmy8+2MvL6RKgHhH0UY6fi1wUTVSPuL14bg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gFdPft864e0EbYODgmbcLM89KcDYWW1VpT8Q+JP6jnQlrhdTE3KUlIVLyLNfoJNYDfz8E4tE6RAF8X4z7iPeU9428LX2R+R8E/Jv/QDB+6DUWcFh/5hqM/qgxBpn+gE/9ixX+7xWUv/rDA/oH4qbX1I04DgzvoGl7gfZ3zPJS5GjvREP1KyM72W7+s4AYB8dfNqAgkoXK26tMIdpRUg4koU5LLjVK//EHeTDMxRqBE0k28rkwz2QAbxi+zvGIipPhuCn7hl2wkTo4uzTDG1gjdtRQLRmv+bjB+Jg3/b8hAfp0pq07aIx1fbxZXcs1IUpz3mbvZg5zJdOvPH3WVZw4zbud9ZC2uq5o46HFXr4UfhnKCJT5M2BRllJo8l2z5hEVoam3ZrnpJpxbLcH5zCKeDcVB1oBtLaqdeeggf97ieU9rIfMTuFtLRyXmLZ4IB/M
X-Exchange-RoutingPolicyChecked: 
	Hw19x//8IaxrmbU18nS5+8BbcbBZd2EXWhZ+nzJqxzOe7aTREyIi9A79YlxOFgD4sG83CXjFBuhil7Y3ISg27yV3r8sd0zkXEtM/WeRL/bUOjBpwK3NLxFIXycD+w6+p4dSUiqZkb2SlfNhc8D2BD+3XN0HPVfLn09Wlsp54iTLDaszoO3a059qYF1cKO5VUOLqLYFgj8Ypg5dyIl4UvotfTWhfPtKvvlfCHlq7QcJYstPzmJgYm2IBH6TfctVqt2ZEZp4qRiSvR7ysjDJMwtJDwGfIivDT0BG6aB4xkJ4K4y+EjOBk/xBQboUPScXzOe80sVZL3RwrtmKIkhSUB/A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:45:08.3141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3820dc48-1353-4bd5-cfe0-08df18d9a027
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997759
X-Proofpoint-ORIG-GUID: zCBoNfs-bgTXgdZFui6mW8bhEfLC3_pW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX+zOBa58qO1S8
 9q8DT2CvgK+X7N2AOxp03bmYRmusTLgnp7kMSKJlXiaDVhDM6D3lBSg62fpjlmSWTRDarGKaLpC
 BeFeTC25F97SAA84eZ80e9yZAyHam8USiTRI1mVQTsiDKvAi79ySTeugpscr6bxGxJ+cxrphYC6
 Y8D23pAlSADAIsXKAXtlDvbQKlHFXyVehuZcAZo6qRGwYCpdOHfvbzvEbjwVL+X2sA/dOZPFPAA
 3Z1dkE0J70B5opdr5LQa2RKJEs4Pfxp9V3Z5+UH7T0QtWDooMfoj82CVuGF37QKg9q1ikFjPDu+
 5mO7Q7c4lSiThFtRdme7ywIDDUWB60gk/kHg4J9fENY46JOPtkoE1eCQxfsGCpXG/KimNdcC7nN
 LxX07SEWmBrCdctm4HG6u/phAxDTwQXJZlFUtt9eRixSqFGk0GerkZkb5gsmZGy8gvGqjW+XCIM
 z0nfYnmpiFYjdOUrx0A==
X-Proofpoint-GUID: zCBoNfs-bgTXgdZFui6mW8bhEfLC3_pW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX2PrFKuKGsUNh
 rwKysNBa9xWJDXP9f60cV4AY1uyVNkuIsUbPQFLDaseYkiQN4yirYKBrVy6sPgUJJiOaWsaUdGf
 gECwjQ93m/Ik5tYMk/nq6l5U3rr4f1c=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab2ccb8 cx=c_pps
 a=uej8S9duoQdrJ4czObxKNw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=Nm9cMq3_g25jxr1EOdYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:45:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20395


With this patch in here we will need to add a layer dependency between 
meta-ti-extras and meta-openembedded.  In 
meta-ti/meta-ti-extras/conf/layer.conf you need to add a second patch 
that make this change:

LAYERDEPENDS_meta-ti-extras = " \
     meta-ti-bsp \
     openembedded-layer \
"

Otherwise we will get errors when running the check layer script and 
running afoul of the Yocto Project Compatible requirement.  That's what 
the error in the PRC response is telling us.

Can you send a v2 with a second patch that does this?  Make that patch 
the first patch in the series with this one the second.


On 9/22/2026 5:30 AM, Paresh Bhagat wrote:
> Extend the PipeWire recipe to add platform-specific ALSA configuration.
> Add sink and source configuration for 8-channel audio playback and
> capture on the AM62D2EVM as the default configuration is 2-channel.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
>   .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
>   .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
>   .../pipewire/pipewire_%.bbappend              |  4 ++++
>   4 files changed, 58 insertions(+)
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> new file mode 100644
> index 00000000..65a82671
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> @@ -0,0 +1,20 @@
> +PR:append = ".ti0"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
> +
> +# AM62D-specific config files
> +SRC_URI:append:am62dxx-evm = " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"
> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN}:append:am62dxx-evm = " \
> +    ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
> +    ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
> +"
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..857c344e
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> @@ -0,0 +1,17 @@
> +# PipeWire sink configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.sink
> +            node.name              = "alsa_audio_sink"
> +            node.description       = "Audio Output"
> +            media.class            = "Audio/Sink"
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> new file mode 100644
> index 00000000..ac7635de
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> @@ -0,0 +1,17 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.source
> +            node.name              = "alsa_audio_source"
> +            node.description       = "Audio Input"
> +            media.class            = "Audio/Source"
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> new file mode 100644
> index 00000000..f806d28f
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> @@ -0,0 +1,4 @@
> +PIPEWIRE_TI = ""
> +PIPEWIRE_TI:ti-soc = "pipewire-ti.inc"
> +
> +require ${PIPEWIRE_TI}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

