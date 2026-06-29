Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFF7C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:50:50 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39250.1782744642132244707
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=AWuypbNX;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QGWvGUrn;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TBFd0A1944994;
	Mon, 29 Jun 2026 09:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=q7S7+VnXJfITUS6NyygLmCvAz6VTNvkwGC9bpu6YU
	3o=; b=AWuypbNX/AzD+XGI6h8BkHSNAn0xww3OZbXQyvvKmzbvjNDaQH+43hQAx
	i0oJ/VdqhcoG1NUrQYvnb79ieEynlR77jxWCZl8kK5kn2rI+Uy2zkV2xjmVIlkXK
	c4MQFGVFJQdpq/kRObjsGo0a5VFdImnIL4vb6JPs8MJN6t9Y3AGAEokoEy2cevSe
	yogFFMbyBHOYpAsCqq1wMWOBdERC1pvq6EwyBHvO49IFlTi/R7F9QIurmR76LTxI
	qiJ7usfbMzW7cTUwrr8TtoX2dbydjJJR/MsNhBCht+xlcUqjDQefKzbw35h1tO+r
	Z5KJP8SrpYz9IbIsoiPZlttoIafXg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qp59mf6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 09:50:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAJeMOKhBxGzEKaXeNHI1KY4bXAYbgB7eRKfvwFtcUEODCp4lTJqmorR8Ep6zFfkR0R2ZTKDmBVqQQRZZr6qG8OTZuEkSzPvGgxHbwC/SY8D2PYJwJenJOHMbyX7zAEcKxF+EmDqcDKT3AcgtrKx5ESvCyJPTTd9xnhVwrxZ+swMNDGIM4wIVVC07+LfB4/SZ2k2AccxBvd7+rCK1ppQQYBR4LiaD2+y4wfpkkEKOO+WauJJw6kWYQaOBynnIZypeCiQTuHKXxViCOUofLNE9SpPBNPaJr1iVtgUEWW+/2Y/iSsihapDxBrqx/KUhJDLyHX0SVHdc4t1+zkEroUDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7S7+VnXJfITUS6NyygLmCvAz6VTNvkwGC9bpu6YU3o=;
 b=Sb3G6/NC/KvkgKURgJpd5MVeNqEunle5vANM/cGs+SfN7Z6BPqcTv4iUZYuQp3+5kyOMijcaD9vss4kELrVIqBT6VAox29fbGdMIs2gc46eZP+kaJMnzTU1ngQVO6ENS94xl3dsMYOi28CT0vQ+aQzyGRlycKzBrcRX5sFXesdK9QMWAetld51P2pO8THZ94LT7jNUKlBzy4ymcWnrymbmDxFT9TJlaPIUDnxNgk41ssrta24IkCM75UtraDNgBrtLynendLEckuu5eIh2IhMBUEu717D6GX7VDJnruhw99YIZBIO/V49jyYP/X7fy1uOApRvZKqle4EqcunGbWesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7S7+VnXJfITUS6NyygLmCvAz6VTNvkwGC9bpu6YU3o=;
 b=QGWvGUrnsLvsG2CspIJFfRbcUjPPXItMJse5pqs9Dlk+iFtsJfClwafIn3TC4D/Rrfd0WC1UIGq2uRVIYJF3YkLzv5N0WqpL3VlddmsyCiHIlZ2sAAImTAok9QBNqlh//8oQX9F1y/HCK7nLuIXuhofYl7sOGZUGHT+2w+UdHJo=
Received: from MN2PR05CA0055.namprd05.prod.outlook.com (2603:10b6:208:236::24)
 by SA1PR10MB7635.namprd10.prod.outlook.com (2603:10b6:806:379::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:50:36 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::84) by MN2PR05CA0055.outlook.office365.com
 (2603:10b6:208:236::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 14:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 14:50:35 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 09:50:27 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 09:50:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 09:50:26 -0500
Received: from [128.247.75.243] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TEoQtc743702;
	Mon, 29 Jun 2026 09:50:26 -0500
Message-ID: <d6d816be-491e-4bdd-b81c-1b31b1e4d51d@ti.com>
Date: Mon, 29 Jun 2026 09:50:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency
 for SDL2 tests
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260625200942.1370480-1-a-christidis@ti.com>
 <fbbb7452-b179-4382-870a-5e38cd9b8584@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <fbbb7452-b179-4382-870a-5e38cd9b8584@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA1PR10MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: e848919e-94e1-4be0-be6d-08ded5edc6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|36860700016|82310400026|23010399003|18002099003|22082099003|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	bvmYeR7+GP/GF+ukSpAQLkWXSNrvyWEK91oKQdrXDl3gmA/L9EMnS33D+51/hYlQ2GWzM6lqkECF0FB+4sd8WbbN7TfbDZizIWsdajIFBWTZqunYFHVd1iV/eoap/eKJ1IXSgqeecatkdVoMXL4leudrTIEi/7OU0go9Dzn1AZKr2bLGJYWXQoKEeMd5d1U7IcRgUxJBNS7uhcMsgslc+FkyGYemCJcK6FlUfAWoVgJFdq2dNuXcYQudIqhvELZkjLLu8p0IQyDclwfq2p4mQqGPXQzNTDNNymcQc9/8m/09Kv0oiSXXZMmtiJZhNREKU5y0YX+lDIJI0FB1zmCLFu6I9B22ir7DsJHXNk47cOp1afWHiOJp5btz4jhI2fenZ7UaFZFCFVU4PZ3/gUMkEkdG77oF1swyYapReT1pnXxBCFJths585cPma635HOfy3qxxqxA2Xldq5d1ECaAbSbI9pBn/POQIRjR1a24rZvpF7KNZDZMEWdEKmS8Qdbis9BxLrdBinKougAiKG4jdtqlNmI5E3KNS6s62DT8QIPSPozmYCDzFNcdTjBKx242FaG75YnJkHozluK2PJOUqhLqkBhhNMRWi9FmMN8BjO3KZTbC8DnDrQkE0dEH0MC0TzMZ77+VmDFjriDE2uBJRJw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0WCWmbGsqDN6ggFh859kf2QfdbuMFqoH/HgvuuWzKepODtk2OagmGQqh+/IkPWA8UJRIWb9zm6h/87Hnz18M5L5J6VcLElO0vGuzdHx6Cazwn2ayLj0Pu8RJf7LkG64b98zIltufzh2NFTpgP3maIE3nv/fAUrdpPY06QSIWkXPI2Ehh52BXRzX+f7yJyLfOUsImrPEQrnlL3LcmRi4Evy624pCxTIsoFAeie4eLImwZo1X/4jOjWoIAS0RF+DxpyokTTL1m06AKkkina/nQT9EfhPIL/PlRd6pjvl27uzNfWCmRVIV8lHZcR2v2sEjXe8p8E8R35ZdUp+ybY6Qg/BVrOvNptL3lP/U8W9JRgUO9IL8bO5wldh6xEF5dYApyHMKw5FVQYhSZJCQLPuqBCl0BTM8wXhPqya4eQzgu+hHnF4+xFaKlCke0p6RLj/50
X-Exchange-RoutingPolicyChecked: 
	FT8mhivOZZmkbitKyK+mwHm2FBrNOEagJuts69frV0jhhz15+o7JTCUmbrR7RSQBwWHztdDv/ukhC/VAA8vwM0YmJ4qJcIKoCoeIxaLw3UobqSOwIsfytAeU3LZ49ywu6M0vk3ddOSfrKEVqR4XE2RKEkt60CGnt2idExCigpDX8P73d2zzfWMzsD5NYS01iOsc2TN8xMDwp0zjozjeMrlKqD81Jp3xNaUpmBMeinyH0aUZARJKXABgaJEbeZ/37pNRluMXbtbsTz3ELljZbcJ+MjLtQNHs3dhIjY80vOCnR4q0Fvv3mqmy+ipy4yd6DvEK18Nrych3qMny1ZuUzsQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:50:35.2194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e848919e-94e1-4be0-be6d-08ded5edc6da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7635
X-Proofpoint-GUID: FFrJvV3lOqfmPjk27f8t3bAXXsVqRFPk
X-Authority-Analysis: v=2.4 cv=ObOoyBTY c=1 sm=1 tr=0 ts=6a428640 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=dVarReUtePQpVz9RJDwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: FFrJvV3lOqfmPjk27f8t3bAXXsVqRFPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXx44fubh7peuD
 qXRGCbUmMEovwVgU7mWkWnEahIgxgCoFVso+iQrCoLY6NdnylHy7ur5swG84yJiqd6UyN0K8B8K
 ej6nK3+Ze6d9KHpboxpEzIQNH6ioCdOC1/ADNgnw6qOYChVX0+zzABRUf06fAyWVh9n1bYjJ6ro
 Q8uDyWpk4WHLBtYic+QkhCyAcKl06KR52DQJHppUOvnXuABW15gsMREp7g7bICvqWoqEXzFUpTU
 QoGjMyO1rN/o5hY/dQKvm7zt3vfGsDpC6oLXXIv/xkSDFbQgD4h4QF+lT+W00lGLCqtgiNBuqnD
 QuHIPQTkJV1la2HVfXCXq/aalTiBxQzROGVu9mAnPZ5lZQL7Tf5aiFVbyrD/0unExuXMy34940T
 b3Sv446zmDH1fS8LW2x6z2iFZysyB17PoZF9AwxHDAX7IJapaNmz8TlkIlyvG0WMxd3XF8y03CP
 TyMTfU/QEir4JFmZxtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX+6Zhufen8nTh
 q8umZ74nOBqBBIRkpLvHagSOmkQWvU0075cvirPsrvBIE+3c9xx0a9S73us9Rp93ILoOC/TJlWb
 /FCZqK3NLmD2NhG2fPs/0G1AftLdrWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290123
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65TBFd0A1944994
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20102


On 6/25/26 5:38 PM, Andrew Davis wrote:
> On 6/25/26 3:09 PM, Antonios Christidis via lists.yoctoproject.org wrot=
e:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Set a runtime dependency on libsdl2 for the libsdl2-tests package.
>>
>
> Any clue on why this isn't automatic? Do the application in the test
> package not link to libsdl2?
>
This isn't automatic because a custom package is created using the=20
PACKAGE_BEFORE_PN
variable, so I need to explicitly set its dependencies.

Currently, when SDL_TESTS is enabled, the test binaries have SDL2 libs=20
statically
compiled in. However, I'm sending a revision to add support for dynamic=20
linking instead.
This is needed because customers using the sysroots to cross-compile=20
their applications
have the SDL2 libraries available in their build environment, but the=20
binaries can't run
since those libraries don't exist in the target filesystem.

|

|

> Andrew
>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> =C2=A0 meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc=20
>> b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> index 33ff0632..750a5603 100644
>> --- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> @@ -3,3 +3,4 @@ EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 PACKAGE_BEFORE_PN =3D "${PN}-tests"
>> =C2=A0 FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-test=
s/SDL2"
>> +RDEPENDS:${PN}-tests +=3D "${PN}"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#20098):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/20098
>> Mute This Topic: https://lists.yoctoproject.org/mt/119980196/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

