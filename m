Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6C4C5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:12:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54956.1786457574470454215
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 07:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=dii0nY9+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nXmm/8Q/;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BDWbvI2111176;
	Tue, 11 Aug 2026 09:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ULo83WA3dB6/CO7mPwjxcXLp9i0LaNSbVmRxwlR9d
	oU=; b=dii0nY9+FuJ3+KnCAALTnUvZaPpPqOHC/aky4gfV+SATfmRCOX3+NBXNi
	5TeO1FslEqIqe8x77/OW+8C490sL15vJbrZeGKWeMBGnv9sbdA4Jbamo8Jkv0vLg
	U1rk9hgHJsH+0s9h5Vhk2KuBh44a5zTcVg6E60hAN9fdTwimVqQecvfrfmcX+KZP
	Zvg7lkdofRjAi03M3UZCfwzYe18djHkJM07Z4TbgMcX8frHSQ9RoDtuBod8fGEcb
	CXp+kZmcVnSZNI35621KhYo5OlxBhrYXiaqQ0/Xzddyu38T7gsR4TWpbxjmj48Zw
	fqyVL4f3C5EyfSKPScB1YEdtFhtxg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g00wu1n2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 09:12:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6q2xeuxbzHrZlleSoq8kWdYf1vOT1l8HQ00OwNyRvgyMZsh0G0CpNmMHi28fUj+o6chOSTZfEa0p7oASfw/TUgtKz69AZSUZqgnOwhyrBuXCVo9erUgjMOAaFKfpYvqlCtbqhlLopVZ32z9n1RdD85qcFT8lTEOeW7jcTzPjz1FJ3zrmlVXT08ejah57PvqQcDdRtftzLD3qbew/TDmCIYjV5S1epNXtCQv53KWTmQtHho3HcVM/QqS+e7FNsaoBXJzppVO342JJ4hFVnA6onmEnZUc+kdrzEudhOVd96cyKstundG69YDwPRChxp1OyCxLTgRIdntJP3tLuPoibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULo83WA3dB6/CO7mPwjxcXLp9i0LaNSbVmRxwlR9doU=;
 b=yP/FebYoacNoVFKzrOP7hmoC6WJVkPWOQhplV42+NAMSEnAShJ7AdMxrh5VhCL8EfjfSiSn/CsVnmtYuspieDGtpNS95HptXq6uIB6zN1rRBNF3L0mJnHXy+kKLzWk90hyMcrZJ0DiOplNVYSvt4cA4akFGhkpjD9+QzAEU7XKOaEG2Ugdb+7lqgIjl2pZOeEXFijr+GP051mBFFAk6D+7jspaJtr0MiOThBae9Wm1m6gc/qI1JLS3rfI5C397Y71yE9kO6K9GgTHXoSVNyZH6Icjyamg7VNpc2TPLEWunAHW7t1+L4qtwomqWRGppC+5LHR8yWjmIpyzLIBKZ1npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULo83WA3dB6/CO7mPwjxcXLp9i0LaNSbVmRxwlR9doU=;
 b=nXmm/8Q/p49F/D+aCnyIn17CqmOsXhIJypQzk6qwqdqt4eVGjf6/13AyU/oApiSMAxO/EHOfuv7apr8Lr2FIcLRKiiQKqYiTslUqY12Be+NYz4Nc45eCrycppx3JDXRWIhTyUIq1Nt31c6FiLsZDMn8kqdYrN30NbtfDhRPqbLg=
Received: from CH5PR02CA0018.namprd02.prod.outlook.com (2603:10b6:610:1ed::20)
 by PH3PPF749D86B39.namprd10.prod.outlook.com (2603:10b6:518:1::7ac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 11 Aug
 2026 14:12:48 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::69) by CH5PR02CA0018.outlook.office365.com
 (2603:10b6:610:1ed::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 14:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 14:12:47 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 09:12:46 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 09:12:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 09:12:46 -0500
Received: from [10.249.32.130] ([10.249.32.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BECkrr1313383;
	Tue, 11 Aug 2026 09:12:46 -0500
Message-ID: <f2ec40e2-bc7e-44bf-8773-d33f933062e0@ti.com>
Date: Tue, 11 Aug 2026 09:12:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to
 scarthgap for j722s NFS boot
To: Moteen Shah <m-shah@ti.com>, PRC Automation <prc@list.ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
 <20260807074253.2214683-1-prc@list.ti.com>
 <9e16f8f5-256c-4bb8-aa9f-799a8c95dd71@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9e16f8f5-256c-4bb8-aa9f-799a8c95dd71@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|PH3PPF749D86B39:EE_
X-MS-Office365-Filtering-Correlation-Id: aee7550f-2125-4638-215c-08def7b29ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|13003099007|56012099006|10067099003|5023799004|4143699003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	gkI9ChgvI/QpiXC1Am5fOL0lvojgkg78Cpk86QjES9TRqIXtsu//WVzUL5DGwEmBqjHemql/xv/gjKTElYhvCYof4QMeeofS4OftwUIngwum8pYl+qQAoWR/OupR17wTxraPjvzCu8n29y7AHokzKuPDXT/KrXSlfcAFSRfxXzaQn9hbiAIEaj+fpWhaVWNb6DfKJou7Dd+BL4TrHW/b7tFWxx/HhJybJpbsiL1FLy0ilIiKuHCbNAI2lBqunuQcWKLIMKztGy/v0D9obsMf0hKvbF2VJKXFri9vwEBDyWJLzSUNEJmG0mFvhJId2pP+qNe1Co+kSBP3IgpibqXcvZsEDYrk3RuQLmjBKzdBANv+J4TVZuqw5K7qZBOBjKYwJ5EWPzdab2GH/W8zVs+iWYRvTKq8RkU+tZCmvmlfAhkTBUS11thEFWuNeQu2NMCkuonVYshX68GkFqFxr37qhn1PAbCV9pc+IG6Fqh8yjwz4EocYB7VTw7H2GaEXN5DrDXdZQLG7SVwwRwOFyLKw/Ag2RcVIDHbAQCjSjSHy/bJmYRWOIH7ZK0LBLrsemdkEeA+q9WRwrbmUtGnU/9n3+1OnsOzFfLy7aAM+ZPMes4kl2xdZfiPyRzxDG7HwWcKjlfzSglx9awniExJiDihSHxjz6PPOq+10ugiHx6b+sV/KSfRTvsMrRKWX/UbPJTeB7LSJhR8lmE0ULzPZKgyLmA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(13003099007)(56012099006)(10067099003)(5023799004)(4143699003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L+u8hFvjwICIhc9Yms4c9TsxqUxAxx1nrSXQvbdnBdLeAW+m55ZZThlSvSYhUwczCDukzO4Z+Xqj4Iq8ImBLNl3ngPm9/qb2+ABS8xhEDTK0jpHqiWNSWhVa32MD242mxGToH97IHqYUCsVgxCCckPdLm68WbmQ6nXyG6ilP5GOiXFHyerLvStJrzewQ+B3jrwRYPuuk3JJr/y+9p8YdItF/r9hnxa1+SYi5eSlMU38FmhYDF3iBTmeRlSeJoiOfucotP7pQrhdmdaH2e61e/pnJPZK/3Ebb3UMJe0QNU+laoyFy9HTEZJrKrAUjkfM8IRa/6Op9p7n1RNE1My6nz5p8TXU44i8ilwJPqMGiT1D0Un4TR1hSi3gK7m1JsBbV5l4oAk2EZBS35WAiRmk6MFusP6r3qF7ZIohWXTeZTBgflGolTCmQew4Ab/c522xU
X-Exchange-RoutingPolicyChecked: 
	nPpBw53GgTFCFY50ft7oDSOnsR4IDxL46bKmabkvqPQpipJihyPo9B3g39EZxXvzYNnircO0wS3It35MQBPnjZO9NP8xQsECb3q+SyDlwyy6tHmRfDIpBBnJImqbRvikv2s8WxG+C9hdm4NKaQxbwWTVsjhaBC8mrg3PsicFzZFTtelb3f282dJU546pFqkFWueWi7THAoyg+3QY2v2yu9I9Z4w6o25dD6oLwiNajm4YJzBXkCCk3h1PjhIbISW64x/g8bjJM5U2KeyvdoiSnaWokAzvoh/V2IFhpKP+RgnTA448secqtTprLe0PFvidsFpAHLK+mRjokkLDqZS4jg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:12:47.2985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee7550f-2125-4638-215c-08def7b29ed1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF749D86B39
X-Authority-Analysis: v=2.4 cv=M+V97Sws c=1 sm=1 tr=0 ts=6a7b2de4 cx=c_pps
 a=+3f3g5PcVU0WeXiSVbezXg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=cN9th1_XAAAA:8 a=MW7yhot_Sf6o8ntL8KUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=uCSXFHLys93vLW5PjgO_:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-ORIG-GUID: f4LiCMw3pLJmOREZ27lOGDPDImH0Hc9E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX4V6OtAEoOhSn
 QY+f24BMWHGhkWBzHfiTcY2JYZD2UlCMyfmQbZYhHwx5gzqD+zlQuBLmXexdDpSB34xMBZienm9
 koZMrmFPIluyi79IZHhgij0D/tN4s0Q=
X-Proofpoint-GUID: f4LiCMw3pLJmOREZ27lOGDPDImH0Hc9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX+jw/Q6FB4YSH
 +hkC8WDXo3Fu34MYdYXUuOX7dmsFfSNG5I1a176BHyLmCO3RY42G/zn+EHTnvwgDWgzlsiKZldw
 QcmwPaxN5ayKh039eB/qA1yQ/V0cEm58/N35XYBpEDg1eUEhhuUTc86j/S+h99Gjp7hE8KCXUvI
 u4XcuRHhMAUhbciMg7hRfo6O5bvc8IBULcqAmHt1a1Hhbd3Fsf+yMsEmFwJrvkquyxefx5nEjiL
 8SQsq99JnH5gnjvSEAtZEuBbuy3ipFcLUkPytGXaCwr2neyLjCVUcjJ1kRiB6azpeJJVjUHEXeN
 oK2/otueS2D1xHqI6/7tDd5FUTvfvlaz0RaksahqijebhBQZpOXx8mBY8aAwnK0dkhCUJyzGFW6
 6IjTnMvvxfwQQXCs5xlqWcVt813Ffwsp1KkE2eSavNPsqzljLMGWpezqMWXVTs9zZNd6CdVu/Ix
 vbW0MukJa17Q8uX9HCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 67BDWbvI2111176
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 14:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20242



On 8/7/2026 4:14 AM, Moteen Shah wrote:
>=20
> On 07/08/26 13:12, PRC Automation wrote:
>> meta-ti / na / 20260807073837.1394655-1-m-shah
>>
>> PRC Results: FAIL
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0 check-yocto-patches: PASS
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> Patches
>> ----------------------------------------
>> WARN - [meta-ti][scarthgap][PATCH v3 2/4] k3: fix weak=20
>> IMAGE_BOOT_FILES assignment
>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REVIS=
ION-1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings visi=
t:=20
>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>> WARN - [meta-ti][scarthgap][PATCH v3 3/4] initramfs-module-netsetup:=20
>> add recipe for DHCP before NFS root mount
>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REVIS=
ION-1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings visi=
t:=20
>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>> WARN - [meta-ti][scarthgap][PATCH v3 4/4] initramfs-module-netsetup:=20
>> add j722s CPSW proxy-client kernel modules
>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REVIS=
ION-1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings visi=
t:=20
>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0 apply-yocto-patch: PASS
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> scarthgap
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Summary:
>> - Patch Series: [meta-ti][scarthgap][PATCH v3 0/4] Backport=20
>> ti-core-initramfs to scarthgap for j722s NFS boot
>> - Submitter: From: Moteen Shah <m-shah@ti.com>
>> - Date: Date: Fri, 7 Aug 2026 13:08:33 +0530
>> - Num Patches: 4
>> - Mailing List (public inbox) Commit SHA:=20
>> 302eea507c00c061dfcbf75fea1e6f4d22c77b5a
>>
>> Applied to:
>> - Repository: lcpd-prc-meta-ti
>> - Base Branch: scarthgap-wip
>> - Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
>> - Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.5=
7
>> - Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7
>>
>> Patches
>> ----------------------------------------
>> All patches applied
>>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0 check-yocto-repo: PASS
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> scarthgap
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> PASS
>>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0 yocto-check-layers: FAIL
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> scarthgap - FAIL
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ERROR: Nothing RPROVIDES '${VIRTUAL-RUNTIME_dev_manager}' (but=20
>> <build-dir>/sources/meta-ti/meta-ti-bsp/recipes-ti/initramfs/packagegr=
oup-ti-core-initramfs.bb RDEPENDS on or otherwise requires it)
>> ERROR: Required build target 'meta-world-pkgdata' has no buildable=20
>> providers.
>=20
> I dont understand the failure fully, how can I reproduce it locally?
> @Ryan and @Denys any inputs?
>=20

My initial thoughts are that that setup was done in oe-core master and=20
wrynose and never backported to scarthgap.  So it does not exist.

Why are we trying to backport this to scarthgap anyway?  There was never=20
an issue with j722s in scarthgap.  What has changed that this is now a=20
requirement?

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

