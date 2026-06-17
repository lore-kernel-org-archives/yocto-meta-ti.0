Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDF0CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 14:31:04 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16783.1781706662192282467
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 07:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=ftJ1n6Ph;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IAhj53d3;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEIolL2189681;
	Wed, 17 Jun 2026 09:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oI+MQnsy0TmntSakTzzLZdF4OkfwybBjs7kDO8R++
	74=; b=ftJ1n6PhCUsFhEzJ6S6F3OeEgA5w+y5E/klCGhSjXXUavEtUO/sMver4D
	FtRAzCXgI0DApE9Yy0NJMHGeZ+A/UwV6gM4WyJAsLf1/tXxIUGpUk6nzFQwYoidB
	gDE/7IQefFqXzbkiRzV/Gawe9ou0ucgPIyr6p8D3oikLCvPzw97Hv5uvr7gGS7mg
	OBqDVicpzibhY1dDNlQnaOwaIjzynzoFdFnxcgIMSnGJTLclHxa1QrUNq/71Pdqi
	HdnxpZAEDDQu09W8Yjr2LvI2LzArEgWvd6AMW23Kk7z9rlnWOxqpp7IxvdRBkA25
	6yLjIX71uafLodqOmAEedpayZE5UQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eueeud8dh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 09:30:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD+wfm/0k6Lbd5huchemspwkwO9Oy6mn+2y2Z5RArAZGtzdckize9wM4ikS47COSGvgmPn2JpH1olPaSBVUa8uD3bYJySKZAm9F70111XtfR8WUFZNUpjJ3+j/t9HHfqju/dZuL251Rofhk2fdDLqwaoCU/v3JhXMERTVjUM/40YfZC+CqzgTFoiaNFCADum4CqsldJTCgClRvCtdQ+z59vRidTaCB7G7gMhS+iLCRJo+MqIZN2MjBy1FA5HqsIk7WRs73zd93Wr2icIXJH5kL6EjyVSFpiKLHuD9Muu0+cFeV/Qi8o5kVwM+K88GErDODwut6hXlmk1e/1OKoUj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI+MQnsy0TmntSakTzzLZdF4OkfwybBjs7kDO8R++74=;
 b=kFDtbC83jW1J0R5Jc6bZI+W3PDmjlRzTpYvLI9fbPiMh/h4NEC+ml0vp1ot7copvk66HXBZRWAAnWY+ESjzT4/aUhcxDX09X5Zy7YjHogbz14obBF3lllzziAUZ9RCx688Mn/H31cqUeA9cy3zrMg7DyOeX6SvJaT6rwNfqp8QR3CM/oRwgBk7RFuinEecbpi70/YVyoouZhIZGHN8wnTpMlZL3ijOvyWURvrOgS4QQB113Hg6Q2C/faPRBXrDXmQQ7ON68tNAY7at1kZu7Gh7kn/CGzjCgUKIiAOE4dYCbGnQSUmgFYMgUSTPr3hrzTslQq/de1El716o8MsxFzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI+MQnsy0TmntSakTzzLZdF4OkfwybBjs7kDO8R++74=;
 b=IAhj53d37N5MSRcKcHN2BxMh8FKg24eZI+Lxn36lenTLeAmrXQbLBpS4ZPy/WjmTyc1d2o4rXLOfA341nfG3mBKONtVaPzdldAL2iPmKg0lAl37iLwWzvGsErNx8Gf48jHFMG1i9eKE19eRbcTOM9P4kU5gv+q79M+Mqh/qCayA=
Received: from CH2PR11CA0012.namprd11.prod.outlook.com (2603:10b6:610:54::22)
 by SA1PR10MB6342.namprd10.prod.outlook.com (2603:10b6:806:255::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 14:30:55 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::14) by CH2PR11CA0012.outlook.office365.com
 (2603:10b6:610:54::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 14:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 14:30:54 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 09:30:46 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 09:30:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 09:30:46 -0500
Received: from [10.249.64.104] ([10.249.64.104])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65HEUkVK2503962;
	Wed, 17 Jun 2026 09:30:46 -0500
Message-ID: <4fe2d50e-c032-4e09-b912-e4c0a76aee6c@ti.com>
Date: Wed, 17 Jun 2026 09:30:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Antonios Christidis <a-christidis@ti.com>, Andrew Davis <afd@ti.com>,
        Denys Dmytriyenko <denis@denix.org>
CC: <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
 <20260611132320.GM23325@denix.org>
 <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
 <20260611165057.GR23325@denix.org>
 <d8d45aba-0b65-4ebe-ae7f-c9c0a1b7c5e4@ti.com>
 <6bc5bb1e-e2ff-4a2b-98d1-d03419520e55@ti.com>
 <93f56372-744c-4b38-a61b-5fc0d0655da0@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <93f56372-744c-4b38-a61b-5fc0d0655da0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SA1PR10MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b1c642-701c-4309-e475-08decc7d0a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|4022899009|82310400026|36860700016|376014|5023799004|4143699003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OYHna0+51Z8yamXmqGsR9dq1JBMBLD71z+eVtDU59xAshw8XrF0EyiUF+DbRcKXErAQyUyddbaERok6F5b7ktRS3iwU6N7B/yJkK90sKbGVzLVwRNQBD8lnz/8MOzxNzXWVxqe+kQnqPGssjm58w8GSqrHzx51aAMiM5Q32RjnYDaf0GMCJZkBerWNFyUOwxpItg/hdUark6Qk81uA9snT9i1PPuPD11EMaMJyRVijHTaq0raikTJ0maqE5xpdD/BLYaa4uBBPBSLk2fgTy2nN/2KS4+itoOE4zoI/F/8vOfHdetk0lCxj4n0tgk/aSTv9U9H5SDLH4SMty4MI7ns4J8IOOeu/Ep7rs1LiWCQHZ8hLUcbz9RhcQWACaTXoUoNRzOz/nsnqenX3t6mo/igHwCp2yGdAzZmPb4xdaSaqU3HqaXv709vFS4M/V3qhHXhm2g8YCS7ne3CTNUpDlStywtxDrWBxiidHNk927/XD3PjPU3ilhFObPcq/uGu49KMBPOuB34pM7sX5riyB1Y20VYX5jDNgfC5uGtEY0YHMJk5HIDiXMdMMkFhP3IuR3URgRgCMMcY0diaPagd5WKGMKsY5j9yaMmjFxze6b2UdU/C1ZkRBQZ5JIJxEffPSdOPwM5oEtTJFU/0YTojZkt7lCBcsU3JvP/abdcM07eSaurG84ntRTo3h4CmeUOfYoSYAT3yJSlLwQhOIvIofkPnc9ehS1u0ASEIcl76wcRgnE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(4022899009)(82310400026)(36860700016)(376014)(5023799004)(4143699003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6poV7VVngd/wBm/NXvrsN0kXyPqRsZXH+R6zQmG/VAwdmUTA4OYRzEglfyeOAgKARXE/iJxn9FwK48g2fGJK8ejk2fTucWdoyVBVCa9v9mp1XG7T/Gwaf6bUzMqNRL6hXpObWKoD+rT5yBAccVhJ781QDCXNwvdI9PD5LjVBLuKaO5Oj+qd+gcGVU0k96B6D1ZuAhh6fP7flul8JJRnlQJ/tM0/AKJoJtILBi5eoUEDKX2crGvejQxtcukaAN5MaSQkPdAT/MQZe9uMGxSQ5zddG+E4/cx2kJ6KIuFFm6m3y4WZWRtsECFiNO6ws4xs/XJv5W4Mtl46qVlEx+hFmVFdvGjmLjlbVCHOa0c9pDJzbk/ATXSUtYEYqreivgyDzBowLBld5bcbvMYCd0qXjAcpL7OvAejGGenjbQw+BFxAaiwDLqaykWS2YCovEYu/5
X-Exchange-RoutingPolicyChecked: 
	TlA23yKWKswEg3CWGatUxyPvyO+ViQ+nMtVUXdYgfKDwgHbxgIUJSJsGtgkoO3NgyiqvaClyvKlrVDIJYN7PY7xPqmwT5NR1mWJcVSEAnGypMAfC+6PHv8/RIeDbW0XDo7KszhuznyjtMummmBIMnJ+BApea5xKqjGWc8GQ/zb6qU2nUwqXuoA0OSUh7msRKNNZ55xYiEyx/b2rDIDPqTGyWev8flv/FvcuJE4+O3HJ/h+UjRppIo2xTyNjQlJO8UQncgdG9ErCH3Uk7gLuAv+nb7/mQApq9zlNt8vHipmXYDppG4BzLJDxbA5goU6DCC4tIAVTbnK23f02n7Q3Xsg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:30:54.4898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b1c642-701c-4309-e475-08decc7d0a1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6342
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzOSBTYWx0ZWRfX9zmqUfugegSh
 gNFLIPBiZ78mDv2yYnGLt7fc9di4VEXZ/4ZaUSbF3zDFOLAEGcgTzyHgtG3MEL/T80LU7FSieO3
 /1w48g1r006XdqjLOGFeB6ckmw1nJPA=
X-Proofpoint-ORIG-GUID: 8J_ibB56iwibcVRr6zu-Qp_oAWrCPQ5R
X-Proofpoint-GUID: 8J_ibB56iwibcVRr6zu-Qp_oAWrCPQ5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzOSBTYWx0ZWRfX4nJkmWG7kt1p
 GDA/Ouzz2BUI/1uCYQ63EHnjuQ34169YBe7QTFDdKRKWMDN9gJMuKrV0TB97tz/bwr+ZtYq/YsZ
 BNF44xTYULyEUM5JMrwdWViPwHRpJ2INfFI1qZ37gKuSzC136cY4TH6nVEjqRtMDxRA6pWcRSoa
 dULaVHypXALIqqEeaGi/4RyKGuU+C7uA4/ae1kIKt5AFaWSIOBquQokJ3d9iPsat8bqpSIo2Jq6
 wSNdXaoWojon/oEqTaANCPBclK+fFWeDORY4clYE6DvspDg9znAzvEOw5qTHmfe21fBjw1sQZba
 84DX54Hgt01wOiSOuT1bF4uvcvY4cPRQcbAzVGKdba4Xn0PUNTY0ygXeGxQoS2MYh5nOpF9Gx6/
 Rd82HI0IwE7UNyc+3FRbhXHfbyHLtRlwEg3ZhozAKy556rEQyhE/79sURpP1wMV/IEOthtFJKz7
 KmNcn2RYzmL9ig+WS6g==
X-Authority-Analysis: v=2.4 cv=KdvidwYD c=1 sm=1 tr=0 ts=6a32afa2 cx=c_pps
 a=Uzy17SEabGn9o4QNHCkmvA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=t9DHNod4pHn6NOEeg3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170139
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65HEIolL2189681
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 14:31:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20045



On 6/17/2026 9:07 AM, Antonios Christidis wrote:
>=20
> On 6/15/26 2:33 PM, Andrew Davis wrote:
>> On 6/11/26 1:29 PM, Antonios Christidis via lists.yoctoproject.org wro=
te:
>>>
>>> On 6/11/26 11:50 AM, Denys Dmytriyenko wrote:
>>>> On Thu, Jun 11, 2026 at 11:30:42AM -0500, Antonios Christidis via=20
>>>> lists.yoctoproject.org wrote:
>>>>> On 6/11/26 8:23 AM, Denys Dmytriyenko wrote:
>>>>>> On Wed, Jun 10, 2026 at 09:17:37PM -0500, Ryan Eatmon via=20
>>>>>> lists.yoctoproject.org wrote:
>>>>>>> On 6/10/2026 5:58 PM, Antonios Christidis wrote:
>>>>>>>> Dear Ryan Denys,
>>>>>>>>
>>>>>>>>
>>>>>>>> Let me know your thoughts on the overall patch. I am particularl=
y
>>>>>>>> interested on your opinions on the following change:
>>>>>>>>
>>>>>>>> On 6/10/26 5:51 PM, Antonios Christidis via=20
>>>>>>>> lists.yoctoproject.org wrote:
>>>>>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>>>>>>> So... I think what this does is establish the pattern for which
>>>>>>> version it will match to.=C2=A0 And then from that pattern it wil=
l pick
>>>>>>> the highest version.
>>>>>>>
>>>>>>> So for ALL 6_18 builds it will probably choose 25 and never 24.
>>>>>>> Which is not what you want.
>>>>>>>
>>>>>>> ... I think ...
>>>>>>>
>>>>>>> We have never tried to mix versions like this in the past, so I'm
>>>>>>> not 100% sure what the best course is.
>>>>>>>
>>>>>>> Likely a mixture of the override based on machine needs to be in
>>>>>>> there. And for that I'm thinking you might need an extra variable.
>>>>>>>
>>>>>>> BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
>>>>>>> BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
>>>>>>> BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
>>>>>>> etc...
>>>>>>>
>>>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18=
}"
>>>>>>>
>>>>>>>
>>>>>>> Something along those lines?=C2=A0 That would be the most clear f=
or
>>>>>>> people to follow as well.
>>>>>> It was done differently in this patch:
>>>>>>
>>>>>> mesa-pvr 24 was maked compatible only with SGX platforms, while=20
>>>>>> mesa-pvr 25
>>>>>> was marked compatible with the rest of the platforms. Also not=20
>>>>>> ideal though.
>>>>>>
>>>>> I think Ryan's idea is easier to follow, compared to the flow I hav=
e
>>>>> included in this series.
>>>>>
>>>>> Another way of going about this (I'm not saying this is easier
>>>>> and/or a better method) would be to create 2 MACHINEOVERIDES.=C2=A0=
On a
>>>>> per platform level (ex: am62pxx.inc) to add ```MACHINEOVERRIDES =3D.
>>>>> "rogue-core:"```, then within ti-bsp
>>>>> ```BSP_MESA_PVR_VERSION:bsp-ti-6_18:rogue-core =3D "25%"``` picking
>>>>> the right version when paired against a sgx-core override.
>>>>>
>>>>> An added benefit to this, the new overrides would cut down on the
>>>>> need for duplicate variables tracking Rogue vs SGX (examples:
>>>>> BSP_SGX_DRIVER_VERSION, BSP_ROGUE_DRIVER_VERSION).
>>>>>
>>>>> A downside to this flow, tracking what is currently included
>>>>> within=C2=A0MACHINEOVERRIDES , describing what architecture of GPU =
core
>>>>> doesn't really fit well with pre-existing overrides.
>>>>>
>>>>>
>>>>> Let me know what you think?
>>>> FWIW, we used to have separate "sgx" and "rogue" flags in=20
>>>> MACHINE_FEATURES
>>>> years ago. Not exactly MACHINEOVERRIDES, but still easy to do=20
>>>> conditionals.
>>>>
>>>> But complaints were that all this needs to be unified and, first,=20
>>>> both of
>>>> those flags were merged into "gpu" MACHINE_FEATURES and eventually=20
>>>> completely
>>>> removed.
>>>>
>>>> So, I'd argue if you do want to bump mesa-pvr version, it has to be=20
>>>> done for
>>>> all the platforms regardless of the graphics core, SGX or Rogue.=20
>>>> We've already
>>>> went through a lengthy period in kirkstone (2022 era) where SGX was=20
>>>> completely
>>>> broken and customers were sent back to use dunfell (2020 era) just=20
>>>> to get SGX
>>>> working at all...
>>>>
>>> I see, if the desired way is to migrate both cores=C2=A0 at the same =
time,=20
>>> then this would cause a big delay. Since migration for SGX cores from=
=20
>>> v24 to v26 is substantially more effort and can take weeks (as IMG=20
>>> provides no support). That being said, I have already planned for=20
>>> such effort, but that is later down the year when a legacy SDK=20
>>> release could happen.
>>>
>>> I think its still worth the effort to migrate for mesa only for=20
>>> Rogue, especially when mesa-pvr v24 is staying around and can be used=
=20
>>> by SGX devices. Also worth a note, SGX devices are legacy and have=20
>>> not received a official 12.x release - so if any customer wants to=20
>>> use the latest SDKs for such devices they would have to go back to=20
>>> Scarthgap 11.x SDKs. So if this series or some different revision=20
>>> does get merged, the latest official SDK for such devices will not be=
=20
>>> changed.
>>>
>>
>> If SGX isn't supported then what is wrong with updating Mesa to v25=20
>> anyway for
>> the SGX platforms and just letting it fallback to SW rendering? As you=
=20
>> say if
>> customers want functioning SGX they need to stick to 11.x or wait till=
=20
>> 12.1,
>> so nothing is lost here. (In theory HW accel might have still worked=20
>> with SGX
>> on a Mesa v24 + Wrynose combo but that isn't verified, in fact Wrynose=
=20
>> expects
>> Mesa v26 so even the current Rogue using Mesa v25 is a bit of an=20
>> unknown..)=20
>=20
> Yeah I agree with this. Some background info, mesa 25 was picked cause=20
> it is what IMG advertises as officially supported on DDK 26.1 (new DDK=20
> for SDK 12.1).
>=20
> Thoughts on this Ryan and Denys ?

I'm fine with falling back to software rendering when using this BSP.=20
It's not ideal and might annoy some of the users, but it might be the=20
best-worst choice.  The best choice would be to stop treating SGX like=20
an after thought and taking 6-12 months to get everything working.


>=20
>>
>> Andrew
>>
>>> Regarding the point of SGX and Rogue being unified, this might also=20
>>> be a good point to start making distinctions and branching the two=20
>>> cores, as the overall drivers and supporting software like Mesa are=20
>>> drastically different for the two stacks.
>>>
>>>>>>>> I wish there was a way to use syntax like
>>>>>>>> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
>>>>>>>> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this log=
ic ?
>>>>>>>>
>>>>>>>> Also already aware of the extra ":" post-pended to the variable,=
 I
>>>>>>>> can send a v3 if that's all the feedback.
>>>>>>>>
>>>>>>>>
>>>>>>>> Kind Regards,
>>>>>>>>
>>>>>>>> Antonios
>>>>>>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#20033):=20
>>> https://lists.yoctoproject.org/g/meta-ti/message/20033
>>> Mute This Topic: https://lists.yoctoproject.org/mt/119748763/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.c=
om]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

