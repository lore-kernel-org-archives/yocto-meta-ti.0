Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD7CC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:37:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55888.1786459049847682822
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 07:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=kvaEK2A+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=g2Zc4Zir;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXGI31463062;
	Tue, 11 Aug 2026 09:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bZCB+F1DahgZX638W4AtwDbeWbOVoue1CkbjErAF+
	Lw=; b=kvaEK2A+GGy6Hhha22aFDbhCRJSdBSIr41KkRkT4QE4uCXpXPOo68TFpC
	iPojcDwFn8tyyTA0hGYWowycbMfK+XQ/rNLgeFXNSto8dsz9SjbVsHHjH8mnXpTm
	XXy19mBoDbZgRsUw2K/fisZjh6mUu+QumSBCBX8+xBkXRgKahd+Qi5P1kFx0/fQ7
	wigLgn3CFKh6bjD8qPG+Go3fTtaRXhh6wbl4x01zPKoBIqHUx43iANr/BVHHiK45
	BRttzhhPsuTQn51lw6aYH6nGZnSkj868dbOiIwD3RfxRUggnvFJY7GKnTEvBnEC1
	I2Kp7X+iUYo8myy/Ml9edsXWh+Rtg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00wn9sg6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 09:37:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=badwTkOB7gf4/18FbDmasSIj/+BwyAxjnHphKmR/4EH0M49k14+QM1ma4CKSfKoT9K9s5tXS+FhlHgp2HUGvlXD4zP4vXK4I2zxQg8WeYtNX7z8IS3iqEHv+Q19QSLdPi9XBzbF6PP14hqZp5mVR4bJxtlYg/ryJy9MP3ZzLu3dtm0hU96/4WHMWrREqvBH10cCBKRF24xqEho3ydofsPRs1MXgfs7/RAsFuxTj6tBTpjWJXa2ZglO0/whziO6ASMJMcSiFqRjoY57Hjm45RrKDTinjKFmzLEhQUu79PFjuLxnJXJ+D5abXJMyKXNUb2IKVisoEpH6LF0TlqkSIhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZCB+F1DahgZX638W4AtwDbeWbOVoue1CkbjErAF+Lw=;
 b=LzQHTxBlg/Ca2MrjAAtE2brZMPZse4TfOUEIDHh/+XmCxOJJEyiclPjQreLV76jRjsAIapFi31C6hpRU+L5TWjuKBoNJKBXyUHihynMCn53KDHW0I9gircpuNNi+7z/XrG/6nggLbgjy2fIc1PWXr0GpGNZjER9NFmVG/Ip+AbUd9ybD/hi0mR1HtDqO6QiplX47+oQHkv8Atxv4ASYzrX9MuV041ICUclrIejQ0EEWG8fZ7vnORyO7t8lwr0MgjjAccDETKiU6loboACPrBrj9ffiB3O1EZDDHyUN+GEY/Gd/fiIytzXh9+uvPMI28NifM6Ncv5DdTJ3kiPZ12dOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZCB+F1DahgZX638W4AtwDbeWbOVoue1CkbjErAF+Lw=;
 b=g2Zc4ZirMCKYDvtW04aVyyq6xrrTpwjRBwDjEcGFGom/5zxVyH2+ALp3CI54ip8WT/750MxqEt03n8vSdGRFw0d15lFYN5yZr6kEXGh17adQtMN3eS5xPcF/NONIoPOLljugtVJsnZEuOKknVBF/3IiyxlFKejeDAqpI8NlKFFo=
Received: from BN1PR14CA0022.namprd14.prod.outlook.com (2603:10b6:408:e3::27)
 by CH9PR10MB997856.namprd10.prod.outlook.com (2603:10b6:610:345::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 14:37:22 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::48) by BN1PR14CA0022.outlook.office365.com
 (2603:10b6:408:e3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 14:37:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Tue, 11 Aug 2026 14:37:20 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 09:36:45 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 09:36:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 09:36:45 -0500
Received: from [10.249.32.130] ([10.249.32.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BEaiFE331223;
	Tue, 11 Aug 2026 09:36:45 -0500
Message-ID: <659d7415-1a8d-4ad7-85bb-dc61afcd6c2d@ti.com>
Date: Tue, 11 Aug 2026 09:36:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to
 scarthgap for j722s NFS boot
From: Ryan Eatmon <reatmon@ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
 <20260807074253.2214683-1-prc@list.ti.com>
 <9e16f8f5-256c-4bb8-aa9f-799a8c95dd71@ti.com>
 <f2ec40e2-bc7e-44bf-8773-d33f933062e0@ti.com>
Content-Language: en-US
In-Reply-To: <f2ec40e2-bc7e-44bf-8773-d33f933062e0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|CH9PR10MB997856:EE_
X-MS-Office365-Filtering-Correlation-Id: f145a72b-82a6-473e-633e-08def7b60d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|5023799004|56012099006|4143699003|10067099003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	99TxNyyubveZhcg2HH9Xf9yax8QtdvtUpa/IAc/ruoNL64bi7TNl6pZTyHFMvwIbHJkrwY8lEdIx1j6bulWTeUCGc/GLUHe/ZjCILbc2r7AH3VIdz/D9kt/fKWFsmFaVedFESoYyP//yYTcE+0oggc7V863te0vbPqvFkplk/AR//q5b1B31xA/TqqU5Rjzvx2DVYQqr9eSrL8+JKEEatAkr5DKIR2Ga8767pCwrF8zirkXmiHVdMc5XGhr62R7DeRhyQW3u0yobEZJhOQd5UqchI6w44nj4ogxglptadeGhgYoq46uvhhdKdIAP0bpp8zYE/5TJ/k+JZAV+9qXU5KcIVxuWF3jSgNt3CiOIaSLJTPjVjVjIh0zU1+JY8ZinAaXnDsZSiapn9vtSGj964JkYE+Z5SVs8ikUFLcMWPiNvfYLGj4B0SJRTwosELT1lOUIh3ZWCKMVq67ryWBT8G/2/9/1MPzMofB44NzvbnEe8rsaBWzqb0yDoGaO15bT/X1Nrc1+0TqxlxtaUPyH/teo51vBjBzL8n0deNVZ0b2xQg/kjU/C/qFD7gLJF6c5+jU+9ZA9RZYd8N83TN/4uyTubJ/n3Rq8zR7VV4UVIntVx2+IGTdJkPoQCCdsDKm1/CVhKxtjKzNTPEuyw7vryNpUwZ/hJIiR28W/T8NO5jmqcLpNxAwMcx8bXz7LKPo12NC0Cg628fPd7bWsdTYVb4A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(5023799004)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GK9a1rPGWQL0O7pgAH1J/s9FHmlMDtR/X+uQxBYQgehaNU57j07dYkT6t9chOYbI4Sw1pVykwiYGbrSgF4HEvwFjoiuv3FTSZgsb+CH9VSDhy+bURaCtpalP6pna0N0eriBIHRFK1VDXPuvOIAvmh3RDulgQ5m3wCf6zluznrs7HQUIKj2IEKOFnYLxbItlXPxG4AgXwXo1ix/56sB07w6AFe8SLrAepE2xSSeMcMjt4Zwx7Lcrgp9h5gqSA0oJpSg7hEejI6SvRHQoCvU3QFD21XGGWA/xeCq6N6HgKPCG+rLNGcaEPHjN/MStW6E0y4qtVyfFddRar7+tBEG9WCSIXq7YaF3d65PJmQKp67QmIhKI4MMCyHFhbLbBp03XQElqn78KdpTVxkivvCIvD5euNCsAA/iJb0xb+39NspHE3B0fd4uepyoiXjFG7AgDU
X-Exchange-RoutingPolicyChecked: 
	gi+v5PJKFXlG9KxsZiw9XIHXqu2rKwAenX9VfOa7cvQplvqUmbsqzUmdBdgL1132qW7AM1Eq/kDhHy/5AWkl9P3XpO0pDhmrhFdp1Jpv+vF6OGY+49/bnQs1MWnFGfDM6ZDOG8SybEjYv/LMnEWo+XaBIZLTr8S7YsTnShNpd0AKhaNZ+wiL2MZ7EgIuMA1nlhyzZfpqwQA9hKz6fhPpNSBAvhT7QlaGcsu1kPHJK97nY6LU2IZnvmTBUoz29hp9vLOqeVXDmcgTrOo2tpr0kPTd4R/1ZRKO97y7SyEFFC183QGjD1vW3qF245r///2ntbEdWkvwZgmUhfU4J+LCEA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:37:20.6336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f145a72b-82a6-473e-633e-08def7b60d01
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR10MB997856
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyMiBTYWx0ZWRfX4K9btixRjEME
 Bc5I0/zUJV8yEYvlxgAZf9a7KRLVi50enOTpDlofXA6crzY/UAki/ePckxwdO7TZy7KHDwWgPMH
 v5i8aRZbT5JeeKAxOnyjWGwhXjVgWoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyMiBTYWx0ZWRfX7K978n+T5xwj
 3cOF8d6By+CsvrGtKfFaxV/Awcka+d08JHcOxv3viqhfmJTl/a82C51+jcxvIWoqJDSqYkhFykG
 /GWDZfUGm0KydA6nfmOW/7ZFk9ekSHNrF/xVD/IUjEefhYDScc6efJIeBAJhaRP4bkXa16MEBSr
 J6KqvgXCOHlP9TxSrQ/vvBLug6Rt79pJ9qXhlBB33yBwQLTlO/ATnzTdft+6LbIk3MO/QTjmUma
 SqXubXjKrGoJnNU3z/3GaIwgEiq4Y4ZZfNoat8ldnhTZ3YRm2ce1ou4bJaF0j+8GWWCfl8wn9Og
 A8p3Yhjd1My6/hJe7cmmfmmIZeCmW3qTFFO6FYXoKvFVYaWUpsqkFp5hA7dq7lr+FgSYeAS5v4s
 SpbjbRLgmQuFAwczEEIfPQs7yiH9ubuio3zrD6oOIjhLoO8V8kUCNJZdgT4/6HOhRNhAgKBt99I
 4sFg/GIjLvK+/gqJo+A==
X-Proofpoint-GUID: Bc1SWr_KkYLlxpjjknti05tPyWB5V3vk
X-Authority-Analysis: v=2.4 cv=cYziaHDM c=1 sm=1 tr=0 ts=6a7b33a6 cx=c_pps
 a=ifAyozehCtGKCK27NPK/8Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8
 a=cN9th1_XAAAA:8 a=GAKZbdv6nxGJVtPSFcUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-ORIG-GUID: Bc1SWr_KkYLlxpjjknti05tPyWB5V3vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110122
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67BDXGI31463062
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 14:37:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20243



On 8/11/2026 9:12 AM, Ryan Eatmon wrote:
>=20
>=20
> On 8/7/2026 4:14 AM, Moteen Shah wrote:
>>
>> On 07/08/26 13:12, PRC Automation wrote:
>>> meta-ti / na / 20260807073837.1394655-1-m-shah
>>>
>>> PRC Results: FAIL
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 check-yocto-patches: PASS
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Patches
>>> ----------------------------------------
>>> WARN - [meta-ti][scarthgap][PATCH v3 2/4] k3: fix weak=20
>>> IMAGE_BOOT_FILES assignment
>>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REVI=
SION-1)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings vis=
it:=20
>>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>> WARN - [meta-ti][scarthgap][PATCH v3 3/4] initramfs-module-netsetup:=20
>>> add recipe for DHCP before NFS root mount
>>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REVI=
SION-1)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings vis=
it:=20
>>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>> WARN - [meta-ti][scarthgap][PATCH v3 4/4] initramfs-module-netsetup:=20
>>> add j722s CPSW proxy-client kernel modules
>>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REVI=
SION-1)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings vis=
it:=20
>>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>>
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 apply-yocto-patch: PASS
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> scarthgap
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Summary:
>>> - Patch Series: [meta-ti][scarthgap][PATCH v3 0/4] Backport=20
>>> ti-core-initramfs to scarthgap for j722s NFS boot
>>> - Submitter: From: Moteen Shah <m-shah@ti.com>
>>> - Date: Date: Fri, 7 Aug 2026 13:08:33 +0530
>>> - Num Patches: 4
>>> - Mailing List (public inbox) Commit SHA:=20
>>> 302eea507c00c061dfcbf75fea1e6f4d22c77b5a
>>>
>>> Applied to:
>>> - Repository: lcpd-prc-meta-ti
>>> - Base Branch: scarthgap-wip
>>> - Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
>>> - Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.=
57
>>> - Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7
>>>
>>> Patches
>>> ----------------------------------------
>>> All patches applied
>>>
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 check-yocto-repo: PASS
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> scarthgap
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> PASS
>>>
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 yocto-check-layers: FAIL
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> scarthgap - FAIL
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ERROR: Nothing RPROVIDES '${VIRTUAL-RUNTIME_dev_manager}' (but=20
>>> <build-dir>/sources/meta-ti/meta-ti-bsp/recipes-ti/initramfs/packageg=
roup-ti-core-initramfs.bb RDEPENDS on or otherwise requires it)
>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable=20
>>> providers.
>>
>> I dont understand the failure fully, how can I reproduce it locally?
>> @Ryan and @Denys any inputs?
>>
>=20
> My initial thoughts are that that setup was done in oe-core master and=20
> wrynose and never backported to scarthgap.=C2=A0 So it does not exist.

In looking a little further, this is likely just some goofiness with=20
yocto-check-layer and not having a distro when it runs.  Not sure why=20
this passes in master/wrynose but fails in scarthgap...  I'll keep=20
looking at it.


> Why are we trying to backport this to scarthgap anyway?=C2=A0 There was=
 never=20
> an issue with j722s in scarthgap.=C2=A0 What has changed that this is n=
ow a=20
> requirement?
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

