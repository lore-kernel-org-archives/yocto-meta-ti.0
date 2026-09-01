Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28BBC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:23:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2365.1788247423322429386
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 00:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=oOwm+J4K;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aMiQeEJ0;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6817AQsH1852550;
	Tue, 1 Sep 2026 02:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=U7LlSW3mLAA9y9Pfu9PxXMihUVB2pD5hiJ5N+8EbD
	Bc=; b=oOwm+J4K3w/P+6WywwjNCy2dvpLJyMxrtGfgTYhtpvvLLdRXPB3+faYoQ
	1ooVcwaz8lOJ4hEVa/5Xm1oAQPi5PnXOlmWFkS5ICPZahbWoq0iSZCwzN4VWd0ld
	/K5K2lm7NFYsa1ckepSua5bV1VXxYZkcfuclp6vGFqSc5K0I91052J6N54Jtl36x
	4oNOfueXfyKFP4+r/NXKS8QN9AnoOSaTYxvqzd8of32BHQMf7uo5m6TWLKtv2giP
	HuHS2Zj2JAKdnhDWWzrbfH0iWqS1QmauE3cfMzfKVktwxbUiqGPsQtwaPEIbOFet
	6RJmaSaBXW+SX473KMZXLuodrKQoQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gdmp2hxt3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 02:23:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGQ3SRTWVUQxgwhRJ8cRupoLNHHeq5k3KOZMiSg2PtI3jBMu1y23eYDU7rpfzj5If12uPh1sKATtFJqn5cPrOMe3CdSZCfFG738zizUC8O8zPIGEtFj1SfjLBfDQLZ1g593u86NJTpFog5L1W7YP4e4Jc1/JvCQn4NHIzZoAYEsmhHEa8d2sT+JDCXcQip3DKLvPz57yYzdQd7YRL6+erwR8qESc6GIRIuYQNzw2puNjwgigVH1WNbFOcv94rPI7Kl47BZUgPPx124m4E6a/wf4MgBQWTDML5X+aaS6spxifcNcubNMoVLlRa7ot9pRV1O+YamITLlupTcoduPjiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7LlSW3mLAA9y9Pfu9PxXMihUVB2pD5hiJ5N+8EbDBc=;
 b=vBITK89hjms6pBoJxzwxRuW8pdGZBaKgvOT4Gj+xmYt+Bt6RZ0suLskk/d6SbkZUoQ5cLFW31rMl4MlhNeRdz5dRIlWP6vG69UhIEvxglN5o310Xk7xy1qbxE0BUst9LPB9BB/pN9smvO4gcKBr2wN33obycQPQYCABWtVf8ObKEFv/4xQgMvCLWNX6+3VK7XA4GujB4A47e5dTQDgCmbMviEux38DaIuVKdTwBcX9h06C2KswUgJVm7yNFykEeq00+3T877WP4eIDI0WeWqQSZCF4oEyPplwIKEcp1La0i0dHmBjNyKBzNzr8N/vM6THw32L4OgAz/shWqgQ58k0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7LlSW3mLAA9y9Pfu9PxXMihUVB2pD5hiJ5N+8EbDBc=;
 b=aMiQeEJ0nsURtq4gn2GS0wWuTObaRPNwSN2cPiUk+gMJ//d6amebv1HHmjLCx2G35itxvFRFUU8iQdCNgTjFcQSkNqDkgCQIA5cXSlZzMuzkA43DZSzDTcqYZbP7qEtULFmhhkAlo5eFCUL2hsL68gOsRJHIM4+eT3Kc5uuHFqg=
Received: from DM6PR07CA0129.namprd07.prod.outlook.com (2603:10b6:5:330::23)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 07:23:36 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::2e) by DM6PR07CA0129.outlook.office365.com
 (2603:10b6:5:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 07:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 07:23:34 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 02:23:24 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 02:23:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 1 Sep 2026 02:23:24 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6817NLQW1329310;
	Tue, 1 Sep 2026 02:23:21 -0500
Message-ID: <8deb45d2-9908-4091-a543-12fa5c1bf24b@ti.com>
Date: Tue, 1 Sep 2026 12:53:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI
 DSP firmware as default for am62dxx
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <afd@ti.com>, <v-singh1@ti.com>,
        <p-deshmukh@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <y-hegde@ti.com>
References: <20260831094438.2986368-1-p-bhagat@ti.com>
 <2d5c5795-f4c9-42d1-ac69-7b97384fd1c4@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <2d5c5795-f4c9-42d1-ac69-7b97384fd1c4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|MN2PR10MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: a68e7cee-a388-4516-e115-08df07f9ef26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	g1LgBILgK/w/tBbgZhQJ5UTimqo7Ga/QTgho63nFh6Td7D60HV0ki5MJ0zA2oKni1WVjLIq1WznibGScWEQoJZeXAQ5mOW4dV7+CnnomKtPN4g+mZDDTShFFfuLAYmCT14pHwHM4+zATzpORVI3MTNcW5jTjAR89OApT/csxryQZ5Gk+cQ59kEcB2jx21ICgzMuCdW7lgFRyKcb0Y7NdbGBzM94x+gy6UUYiKICM2zPxMxIrM+jwsSMypqMyxiAoq1cYPzF2dT0BmEwtr9unOsXbX/CKRFEzhlh3+fxcKh8V8hMwDolUfGknZ+S3eOwb/gxCYOisBPg126iJI1EkDx8YzQD4HEUkihjz6wiTfTczPVH04OyodulxpodI/JfPBx6ExNiI9Igkno81midlbAWnvwR1vLxLwM7BAO6YZxjYYtnKw2t7SlCFFy3TFLU+5cEYJZpVWLKXYfg7SdnrS7lx+Wx5Vwy13iV+Z0TzBxmwTWntAk84V0F6mhZuxd/75CC30VxHz4UC3Epbrr0UR4lc3YKg1ZILg8viORjqeD3VQcCwY+W6/ZMkWv1QauOIgRJt8o2U1DglI8yj39qxDpgxnP7sD6Movh3N8ajHh6qAuKP3GkHY3SHcUMJ4wk8/YYIqV/iC5ZDLWMikb6Kc1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8MYstqFDulHnuR+blFLpyBJ0RJT1UMRgLySxTDkTT06X6x7MiRLRS6BWxzRmyQL9we+D15d9A8Ld4+2MQPsPmYdjGNv9/PkbFYx5i0Pkjms5Wph+2PLtPqf+w/2MajYNvFyhnIcKAT7rlnAdn8GFfBSmbJrInLDgMhmgKaIdpieLHIli7cC94ilcen12pQAjYfKOS/hZP+trv8LRSS6vlF9Rcu5UAu8msXkdyNGB+6QypEyXclO0PvZGZdz04khtOxlwxqgXMC5Q/gminnkx8EJ1phW2pbwlHIRXJKlTakL9kj3n19Vj+wKjPWyJeOWtVT3C6bqegliowAkqHXyGj8+U/nXbuLHW35aQkz2gtFaQj15PuEAJduwVDAJqcZBFaPXwihWgFv6x/gC0aOvv0ITtDwRClRgCHuTjpeTYl2/Nv4mcdDO0mpr1Wx56nGhv
X-Exchange-RoutingPolicyChecked: 
	OjIY6UPwyBpiX87F6iZaoiOOWMX9BUjrSHO0aA72zhO7o07shqw/f5lh4cV1nHuuN/nXNhae0XxgeulyxvTR7XN9u9FJwWEpy6ms+iW7xT65ASt34O6/16XY7v5ILb16LqnSVZ3VyrnZY9nuMgSH9Xq/JcJ/ST/gC0hYCBhMKpJ0JBH73w+rZjvMNKd/SrSgJV0KAxWsv5EpGxwOGcaCSQzOGu7CtBmxfGJBA4yMFmJAvQfB0g3bZG+lwrwSuqKioeidMa1bhonOOccW901Wna9WjIskilWTan7nEuEaCihTAJKnRVLy0cceO4/HMTK+l+fj2rRy1IJorlePOyflXw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 07:23:34.9473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a68e7cee-a388-4516-e115-08df07f9ef26
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-GUID: QjUoFEfS4js1OWC4_bVseTwHgtTfii_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NCBTYWx0ZWRfX0LhujB063ULm
 IOvawd21Kn6WiioDNOS+cXuicCqewSWB0Iactk8AtSa4A+HseNtnbQ+b7zeXtYWQEop8p50fkx6
 ts6eGwn9U998+FjGuEPoY2G6q8xXquwfyFxeq0TO2dLfx6w1ipvT9XdqAyKV74Oau1oSVOuQ7hk
 FrOtyFgVwUptoUL8BbscAJI5Lr0nhCVdkxTZRSrEnH23S0o9YI0FoWILVC0Kf9OM3unCEaG/3fm
 Wm8yH2O7dbrex2iWDZKXE9ld1bX3bQAENGfuUZR5ZKAq4XwNZv6i1jM6m9I3Hzp1mU8I/psb7pE
 R3IRGiBY2Wa3ump6aPJTTgfie8+u4j7S36XFnmfRQgs6zuhcaEOlgdXpsQyXUiDR0wf2jYI1nUF
 SoY74YbwoPhZtEkEjS4ViPCvOJRgsqU5+Re9CoBiewr27EYsip+2i829701LLTfp71zbndQxqCa
 kl19BrfSVoL+VlLAelg==
X-Proofpoint-ORIG-GUID: QjUoFEfS4js1OWC4_bVseTwHgtTfii_J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NCBTYWx0ZWRfX8wCF7T1ODqcD
 hcILxMSDe2jHy0gEl564jqh+uuxTYg65wguTnmAmFNvyw7RF4vLSbbAa2FMHKizPNGVur0dacdW
 vEQN8dvsKKZZ8I3sgpM7mNYNhtT+Oz8=
X-Authority-Analysis: v=2.4 cv=QuVuG1yd c=1 sm=1 tr=0 ts=6a967d7b cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=3LWhyIlZ6Zq2whILOSEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 6817AQsH1852550
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20318

Hi Ryan,


On 31/08/26 23:04, Ryan Eatmon wrote:
> Please drop the meta-ti-bsp: from the subject.=C2=A0 It makes the summa=
ry=20
> longer than it needs to be.


Sure will drop it in next version.


>
>
> On 8/31/2026 4:44 AM, Paresh Bhagat wrote:
>> Set dsp_edgeai_c7x_1_release_strip.out as the default C7x firmware for
>> AM62d to support EdgeAI and DSP based audio pipeline.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> This patch requires the corresponding firmware patch in
>> ti-linux-firmware to be merged first.
>>
>> Change log:
>> v1->v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0- Updated name of firmware.
>>
>> v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_wrynose_patch=
/120772787=20
>>
>>
>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 2 =
+-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> index 20c6b531..aad5ea06 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> @@ -47,6 +47,7 @@ C66_1_FW =3D=20
>> "ipc_echo_test_c66xdsp_1_release_strip.xe66"
>> =C2=A0 C66_2_FW =3D "ipc_echo_test_c66xdsp_2_release_strip.xe66"
>> =C2=A0 C7X_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_1_release_strip.xe71"
>> =C2=A0 C7X_1_FW:am62axx =3D "dsp_edgeai_c7x_1_release_strip.out"
>> +C7X_1_FW:am62dxx =3D "dsp_edgeai_c7x_1_release_strip.out"
>> =C2=A0 C7X_2_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_2_release_strip.xe71"
>> =C2=A0 C7X_3_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_3_release_strip.xe71"
>> =C2=A0 C7X_4_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_4_release_strip.xe71"
>> @@ -101,7 +102,6 @@ do_install:prepend:am62axx() {
>> =C2=A0 do_install:prepend:am62dxx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( cd ${S}/${IPC=
_FW_DIR}; \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf ipc_rpmsg_echo.mcu-r5f0_0.release.s=
trip.out=20
>> ${MCU_2_0_FW}; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ln -sf ipc_rpmsg_echo.c75ss0-0.release.strip.out=20
>> ${C7X_1_FW}; \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> =C2=A0 }
>

