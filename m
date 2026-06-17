Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AE2CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 14:07:54 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16270.1781705267066277367
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 07:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=BjzSTs+D;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Lh3uTVex;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HBE8Yc1874019;
	Wed, 17 Jun 2026 09:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gaI8IlaMCCJzH+k/9qADN0DsgRN2Pp8Lb/ehckM+k
	ac=; b=BjzSTs+D9l21b/oiSthbGWrs8rCRkHSqi2KKVXqlbwqaI2gMPc0TdBiK2
	YUHVeEi50+LW0pOvhvMRCYi1MF3t0dvJbwuq2E5NqWCYk3Ias0ukeAWYDVkjuB7e
	FwR0fmDIx2/8vV8c0v/q2TUUSKlBaCfn4EBZ5F02c4Y1mP3gA9bZvqevhgUw4TXC
	AUOkYgi5NAVoyKVbYQ6O6Q5mtW40nwPNF9Jw0FQHXL6o+7DDe7om2rDHzJvI3Evo
	mk+6lfkx3AeIGDEW533IvZH9KKaW/G4usMO3Ou2aEVDkvUhtRCkPkaO5ds37SKHM
	wQFD+luIv7ftiUUPfEOB+tvf1RiDQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eutherygv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 09:07:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5s0h2CNQUOmMdtpTqN+72fK0SLOxxrdItRlg4XL7+Oe8QFMzTEEYaDdruoNuTb4TDjOfwwn+2mSbq68ca0Uj2K4pZjhjasQyuayp+AaEKqnDxWC5tPdcjCvk+45yvSOo/RadCNxG3KaF8oBpQZbqYgTMcWOt0OSVWpb5xG4asot/twaETEhRFMy+bUeCcU3Y3BOpV4IjwipNI9oTdxy9p35Z4Ir7nzBiymhtyBhnbQGN3EGNO9cNUMQuLMS1OlVQUCgshrS8x2H5UKVoqyzR3rqfJXqYO99UMSESUA6ksoTj81YgXDN8kCZWWbybBcEMlpGkVBnk7TacJ0Mgcr2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaI8IlaMCCJzH+k/9qADN0DsgRN2Pp8Lb/ehckM+kac=;
 b=GJEtJppOZoYy9cC+fE7jamFvssXiTTa5oadK117z5P69jM08rciZmNub0yoNg6hHIG687LGxDUAppZa1ZZ0/PN0yPRKhGXWSQvownPO8ndLFkzNWrUy/VoaBn/UJxwvXm68oNlMr5/oPR/NgpHQlvRycQIVKkTt5VX6I40CDpcrdf34g4px/L3mUFosjFmAONCli4bC3aYd62u4jz3o4fTvGsYFoCFgDWUUMe3i9izSxOmC6X/WvP2xRthAg4+nyzjoe93TxBbQty0fs1oeJltxSiCikGUNPB4nYKAMbNgFNw9EOWnWNxsBF9smVCX99V1jv8+XGApiz4IHhfZyR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaI8IlaMCCJzH+k/9qADN0DsgRN2Pp8Lb/ehckM+kac=;
 b=Lh3uTVexy9tgvAeDo/XpkUL6xR8qA7TDgitiWw+AwtYDOZnHlP8Gtw2DqklAj9mAkubTR+0ifi6Po1fL+P1e08T/0sOQsmZnCaBVRrpPGICkEwjBAGQFalLycawro8yJY/yKX+xxucJ0QdchN6s4pWfcqq+z/vtYF9FMClOc+ik=
Received: from BY3PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:39a::29)
 by IA1PR10MB6169.namprd10.prod.outlook.com (2603:10b6:208:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:07:38 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::93) by BY3PR03CA0024.outlook.office365.com
 (2603:10b6:a03:39a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 14:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 14:07:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 09:07:08 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 09:07:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 09:07:08 -0500
Received: from [128.247.75.243] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65HE78lb2465171;
	Wed, 17 Jun 2026 09:07:08 -0500
Message-ID: <93f56372-744c-4b38-a61b-5fc0d0655da0@ti.com>
Date: Wed, 17 Jun 2026 09:07:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
 <20260611132320.GM23325@denix.org>
 <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
 <20260611165057.GR23325@denix.org>
 <d8d45aba-0b65-4ebe-ae7f-c9c0a1b7c5e4@ti.com>
 <6bc5bb1e-e2ff-4a2b-98d1-d03419520e55@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <6bc5bb1e-e2ff-4a2b-98d1-d03419520e55@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|IA1PR10MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: a18d8382-ae1f-4881-7d00-08decc79c910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|4022899009|82310400026|23010399003|1800799024|376014|5023799004|4143699003|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	85xkRw+sXaJIDdOqtbaJBAK1yMSZuo5QZmJHR4yoIxEmZ6gpwpJzUgOd4cjkT1rX9/vOPrAunOj2olJnW3dHYlmg5NJ0xxCp1Zct+9CZalwCA73yJfpQgEdwDA2RbbMfzKheXwiuB+jCdQ2uRB/McThWtLUJdXpvo5qFYvUDXAGftRmptwJm0lokSur8Wb/S1ZEDpVIwA8QdTxnC/LwlAxX8sscYDPuP4l7LmSGk+ChxFjGE+gWb8xuGHS3osTc1Vx3yTaZxKLSpspw7fHunUp4x3daV97RO0bj8MVo7O6n3647EfgcqO4BmJk5qO6m55pwLTnh2CvITuSd4k+fBgC8URKFQnFQW6ix2lghLgTssFqtkiQnuzZ+y3c7iI0iy8eRjMlJeV5diqevNrYDMj9KvhDr4DOofcqqft6cjbMoMWe5q+1lBiS1IGrQ469WJ6yaoAE4rUd02b2bezZfbFLTuhwk2Cd2yiFRk3qFf4DuhfSKcRRnbeVOMFqhuf4W6hAlL0aVwi88XF3PKUN8gIeRdftH4tsVcj5DSGJy0WZ6wHWuk+verXltbPGSLIwstcTUmQa3GjKL2w5nv4eIZ/htOOs7ImMNlc3zUFSJ6WJKWywDKnG1/ModFDb2X9b0hbLQxGvOYt4NFsg5jGIrdqw8gHL2h1s0hwnlcs3ICjsd9xxER1UMdgg3Sb4WxlR9fQfYDyMo2QPpoweDvKwTx+vk5czyYEiuuSrzwFS6HUp8=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(4022899009)(82310400026)(23010399003)(1800799024)(376014)(5023799004)(4143699003)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tetOj+6iRW6xW7RR7pzdKyhq7NTlQfA/5YUjoB9U3WRwj93lXJCvs4S+QW+7TazvOJ2laJPgMvkyLe6LQUo2NmJPS/Zlrv/+GJV2ryZ2IfcoHGHlMuSLN3joR5CoclLbfx00MFVzOxSPTSQxkWhfS193GjCpiBIadEW3k2nhYXvhUwL+QZsw9YhXu8yczCjVJDESqK8a+lMDxWPaYCKDQKWamgjjNSZqYIzN2lOcIYyXE/X9ABZZAe7Yl9UxLr8MK98bUaS118YHYMTAl8GX6W5qhBYkOUqTJDV5QRct67qeoH4zr24OZvZaTkRHHsdKHPr8xUDaMO6QT+fTdLPckG0ZtWyz5bpXCBps6zgC+1mDSm7PjO0F7vHMQsyH2DDBkkE//QpQFtZ9q2KZ4iLn3RjlsB3q23hsdCw79cX7et+CJjRBX18HtsMQQF3RZCoT
X-Exchange-RoutingPolicyChecked: 
	KHUlXZ/lM5t2/05bruyyEC/wWKRwY6ZTTGpFHNbdJy9UWB67FJsaMa1q0MgdNyjYbWTwMOEg8oJ3yLa12ZBVmRI2brodbYmzolB50xPwXY9CqAl5aXewpJ8fdVtcirtfOqJp0h9pZAt8XAljG5+dA8NRizVots8A8fcovpvYLLMhshjC2KEhccY3wDkSpxO9sGDY6fCaAKuA5RZF6O47LThtm3MKptCyRtiYl6yiJP/m/8RUutGWPj1fUiNC+Lxh+TWFG1XNdGcl2L9djPtVWME5k5TjzGZb8e0QsXDU7F8BGmeKWOPIbFg0w9NgvQk/YN09DKUxvWI3PVeVPd2ZWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:07:36.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18d8382-ae1f-4881-7d00-08decc79c910
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzNCBTYWx0ZWRfXxaibKdY26bbc
 ImH/iWcphtfqbWnJkMd78L3xoo0vfyfixi8z7KTe3wKwK1rHztokP8ijWVyCgmOpaeBE1C3pwXi
 wh0hnfp6cZa++bnO4VGAw7KK9osu+W+BPtSvh1tOJWq8urTNOifW0WS6grgxgdLnfrF9dV3Z6Et
 EQGu2Q8wOo5yAcIXyP4jcAgDcsgPVhRC6+UwGGCwp2oUgIo+UohOMQSeb+W5AeyK+MqENjzwtcx
 1uPS9UjRF4RrmoPLHU5neHyMQKcwYKz1+OCQfJim09MZj3rOtXyfkVavo66MysUk8DN5eCxM4AZ
 BtbZkP/KYSnuuTNvW/SX6kcP0m2yFKdEY6NKh1IhL2ZHtjHkUf3s86Iqb87cidXCFcrca+CGuOv
 TDUVeVTIVlStWboASroDRAK2YkmK1Q4gk4hTK88A9ZwgJPuzH3vr6lLPbjEhi5cT2xYqnrW1DI5
 MSx8dkl4zjKDRtbM1Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzNCBTYWx0ZWRfXxAcSJgWHtS38
 yh3BfKyngMffIEpE29V3+hvMj7lOITJGQB/blzXEQr5qqVMyqpthu1ghUWW9Py4a+o/UA+kcSzX
 NbDBl0T+dt/cvf+qsAmw4Mw5NLXyuVA=
X-Authority-Analysis: v=2.4 cv=AK4+T1yy c=1 sm=1 tr=0 ts=6a32aa2f cx=c_pps
 a=C5fyF0bn1LKt8LWMWUNbGg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Rt0CaT5MlIi-SRaLqTsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: xnOssocm8V1pBr6ORa6aCe6PteXuuCAE
X-Proofpoint-ORIG-GUID: xnOssocm8V1pBr6ORa6aCe6PteXuuCAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170134
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65HBE8Yc1874019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 14:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20044


On 6/15/26 2:33 PM, Andrew Davis wrote:
> On 6/11/26 1:29 PM, Antonios Christidis via lists.yoctoproject.org wrot=
e:
>>
>> On 6/11/26 11:50 AM, Denys Dmytriyenko wrote:
>>> On Thu, Jun 11, 2026 at 11:30:42AM -0500, Antonios Christidis via=20
>>> lists.yoctoproject.org wrote:
>>>> On 6/11/26 8:23 AM, Denys Dmytriyenko wrote:
>>>>> On Wed, Jun 10, 2026 at 09:17:37PM -0500, Ryan Eatmon via=20
>>>>> lists.yoctoproject.org wrote:
>>>>>> On 6/10/2026 5:58 PM, Antonios Christidis wrote:
>>>>>>> Dear Ryan Denys,
>>>>>>>
>>>>>>>
>>>>>>> Let me know your thoughts on the overall patch. I am particularly
>>>>>>> interested on your opinions on the following change:
>>>>>>>
>>>>>>> On 6/10/26 5:51 PM, Antonios Christidis via=20
>>>>>>> lists.yoctoproject.org wrote:
>>>>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>>>>>> So... I think what this does is establish the pattern for which
>>>>>> version it will match to.=C2=A0 And then from that pattern it will=
 pick
>>>>>> the highest version.
>>>>>>
>>>>>> So for ALL 6_18 builds it will probably choose 25 and never 24.
>>>>>> Which is not what you want.
>>>>>>
>>>>>> ... I think ...
>>>>>>
>>>>>> We have never tried to mix versions like this in the past, so I'm
>>>>>> not 100% sure what the best course is.
>>>>>>
>>>>>> Likely a mixture of the override based on machine needs to be in
>>>>>> there. And for that I'm thinking you might need an extra variable.
>>>>>>
>>>>>> BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
>>>>>> BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
>>>>>> BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
>>>>>> etc...
>>>>>>
>>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18}=
"
>>>>>>
>>>>>>
>>>>>> Something along those lines?=C2=A0 That would be the most clear fo=
r
>>>>>> people to follow as well.
>>>>> It was done differently in this patch:
>>>>>
>>>>> mesa-pvr 24 was maked compatible only with SGX platforms, while=20
>>>>> mesa-pvr 25
>>>>> was marked compatible with the rest of the platforms. Also not=20
>>>>> ideal though.
>>>>>
>>>> I think Ryan's idea is easier to follow, compared to the flow I have
>>>> included in this series.
>>>>
>>>> Another way of going about this (I'm not saying this is easier
>>>> and/or a better method) would be to create 2 MACHINEOVERIDES.=C2=A0O=
n a
>>>> per platform level (ex: am62pxx.inc) to add ```MACHINEOVERRIDES =3D.
>>>> "rogue-core:"```, then within ti-bsp
>>>> ```BSP_MESA_PVR_VERSION:bsp-ti-6_18:rogue-core =3D "25%"``` picking
>>>> the right version when paired against a sgx-core override.
>>>>
>>>> An added benefit to this, the new overrides would cut down on the
>>>> need for duplicate variables tracking Rogue vs SGX (examples:
>>>> BSP_SGX_DRIVER_VERSION, BSP_ROGUE_DRIVER_VERSION).
>>>>
>>>> A downside to this flow, tracking what is currently included
>>>> within=C2=A0MACHINEOVERRIDES , describing what architecture of GPU c=
ore
>>>> doesn't really fit well with pre-existing overrides.
>>>>
>>>>
>>>> Let me know what you think?
>>> FWIW, we used to have separate "sgx" and "rogue" flags in=20
>>> MACHINE_FEATURES
>>> years ago. Not exactly MACHINEOVERRIDES, but still easy to do=20
>>> conditionals.
>>>
>>> But complaints were that all this needs to be unified and, first,=20
>>> both of
>>> those flags were merged into "gpu" MACHINE_FEATURES and eventually=20
>>> completely
>>> removed.
>>>
>>> So, I'd argue if you do want to bump mesa-pvr version, it has to be=20
>>> done for
>>> all the platforms regardless of the graphics core, SGX or Rogue.=20
>>> We've already
>>> went through a lengthy period in kirkstone (2022 era) where SGX was=20
>>> completely
>>> broken and customers were sent back to use dunfell (2020 era) just=20
>>> to get SGX
>>> working at all...
>>>
>> I see, if the desired way is to migrate both cores=C2=A0 at the same t=
ime,=20
>> then this would cause a big delay. Since migration for SGX cores from=20
>> v24 to v26 is substantially more effort and can take weeks (as IMG=20
>> provides no support). That being said, I have already planned for=20
>> such effort, but that is later down the year when a legacy SDK=20
>> release could happen.
>>
>> I think its still worth the effort to migrate for mesa only for=20
>> Rogue, especially when mesa-pvr v24 is staying around and can be used=20
>> by SGX devices. Also worth a note, SGX devices are legacy and have=20
>> not received a official 12.x release - so if any customer wants to=20
>> use the latest SDKs for such devices they would have to go back to=20
>> Scarthgap 11.x SDKs. So if this series or some different revision=20
>> does get merged, the latest official SDK for such devices will not be=20
>> changed.
>>
>
> If SGX isn't supported then what is wrong with updating Mesa to v25=20
> anyway for
> the SGX platforms and just letting it fallback to SW rendering? As you=20
> say if
> customers want functioning SGX they need to stick to 11.x or wait till=20
> 12.1,
> so nothing is lost here. (In theory HW accel might have still worked=20
> with SGX
> on a Mesa v24 + Wrynose combo but that isn't verified, in fact Wrynose=20
> expects
> Mesa v26 so even the current Rogue using Mesa v25 is a bit of an=20
> unknown..)=20

Yeah I agree with this. Some background info, mesa 25 was picked cause=20
it is what IMG advertises as officially supported on DDK 26.1 (new DDK=20
for SDK 12.1).

Thoughts on this Ryan and Denys ?


>
> Andrew
>
>> Regarding the point of SGX and Rogue being unified, this might also=20
>> be a good point to start making distinctions and branching the two=20
>> cores, as the overall drivers and supporting software like Mesa are=20
>> drastically different for the two stacks.
>>
>>>>>>> I wish there was a way to use syntax like
>>>>>>> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
>>>>>>> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logi=
c ?
>>>>>>>
>>>>>>> Also already aware of the extra ":" post-pended to the variable, =
I
>>>>>>> can send a v3 if that's all the feedback.
>>>>>>>
>>>>>>>
>>>>>>> Kind Regards,
>>>>>>>
>>>>>>> Antonios
>>>>>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#20033):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/20033
>> Mute This Topic: https://lists.yoctoproject.org/mt/119748763/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

