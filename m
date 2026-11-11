Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.685.1794414096604606302
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 08:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=YuKrJFKQ;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=FM3x43oj;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF2t2v980995;
	Wed, 11 Nov 2026 10:21:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zejY63t7hBzeVHjqxfroVPs/iYPxpakSXtkHHhnAA
	TM=; b=YuKrJFKQm9FY9ibUA6YvyvcxhNKla4jbYAGx6vrY6si9XI8SBmvmV7H0J
	yciAHpGDrW/E3lXkAufAVI487uXNNg1ppK/eDPD96Axh6uFM5NTck5Y/RuGQz50A
	2Gl9kNxjy3IC/oGhl/8JCmwwpr4bqoU3CE6EqGExNFqKLNYpAEWWvMpsJLbeQoeN
	swaXRxHgsZ7GzrjRW3IiQs8jIVkqSF7SVOpyfS6FE5+ndwzn3uLaz/CWGKXrlW6R
	AZBwEICVyIH6MLqcAP99Ebzv3hrqSd29l+NsDmEN4gpfl+4YhoRcostgicR+zZ0r
	bNJLSuVC0vbbbmwzmrGeVaOhcj1Rw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjx38s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:21:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1aPaAUqSNwa1NqhPbG71LYUoXzzf7Neh6INxz6XAe2/rOj72YE6tHUQLkA9lG9qWpid1Drri0UgqQnWpA163gjE+6gz/MBVlL07iVnmA/2lUNjyxhd4Eb7vDl6mzSzWSJGYjZ+N7sm0TvXI9LNi1nZcMtskLpF9WYLu773iHyzcMwlj2iZkVazpMtifyATHzrJx3RtK+jB9IAdnqTGpJ/hXUwoxK5bSgA7vvKejcofkADka8++L7MeGEhx4xncMYM0Vi+z0MOXG2u5UjjQxyGIg66830g1uKRyDbbVeTjFTK87McZtGT+Io2TLXTLali7OVkTo8AXEz/n6DuxYuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zejY63t7hBzeVHjqxfroVPs/iYPxpakSXtkHHhnAATM=;
 b=J0mDlb2zZz7fDcFjkX6WnPmSKL2nZB6SyNEX4cKNTaqLuT8tQkqtJVnGm8ifCG/pJEypH5AXj2pzfihPCDhjd5rVnsNjWZSa7Y8Ajss+f8U74wVmQg4GuU1H9Hylj4L54gq36gJp4RBV+v3Hxa9582bXQ3V69HagVe+w9LXHIMZCDgauLA0ORopddJPKguQOAPs7cLiXus1OaW8vSWk/neFdBTerbo5N0nIseRJgBIEa93WvmwqWKdDPxLRzc45pGTkCEBf/dY69KlTrE2SRhND3+VO6FGvjbH5kmQtW2/fG8rtSplH52tltxQA/YxHFZKO9ctvVOJa7V2MAU+M4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zejY63t7hBzeVHjqxfroVPs/iYPxpakSXtkHHhnAATM=;
 b=FM3x43ojRYDyPT99+5mtI3f6uXbW+bhgnr7EKMUWVDI47rqV/0FB8uPwlkBnoo3kef4udDlFcdzWupBx8LX/eD+kHB2s+hJj78oY64AFTvRX4232dtl6nUT+jwFMMa7fatW8tm+H8J9Esy3OAdS91y2QugDmMlkkEuaNQLv8f1E=
Received: from DS1PR07CA0005.namprd07.prod.outlook.com (2603:10b6:8:456::9) by
 DM3PPF1BDA8E55F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c0f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 16:21:28 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:8:456:cafe::79) by DS1PR07CA0005.outlook.office365.com
 (2603:10b6:8:456::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 16:21:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 16:21:26 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 10:20:33 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 10:20:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 10:20:33 -0600
Received: from [10.249.32.167] ([10.249.32.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABGKXcI3251219;
	Wed, 11 Nov 2026 10:20:33 -0600
Message-ID: <8cc73d88-bf92-4fd8-b93f-6c033587ed52@ti.com>
Date: Wed, 11 Nov 2026 10:20:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv
 configuration for display support
To: <reatmon@ti.com>, Rahul Sharma <r-sharma3@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>
References: <20261111101358.3203148-1-r-sharma3@ti.com>
 <20456b38-7fed-444e-bc7a-c54f9467cdf5@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20456b38-7fed-444e-bc7a-c54f9467cdf5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DM3PPF1BDA8E55F:EE_
X-MS-Office365-Filtering-Correlation-Id: 8084c5fb-c267-4ae8-ac9a-08df400fd5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|4022899009|1800799024|36860700016|4143699003|261026121527099003|261028144727099003|261022115727099003|261022075727099003|56012099006|261022105027099003|261021123027099003|261102123227099003|261009223027099003|261021121427099003|261026140227099003|6133799003|18002099003|22082099003|10067099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: Ce5M4SAlS+hyisE7jkKOmzs5WdnAxZDT4AODrVCM9+4bOBLMpewAhJ2Ir3tjEgNBwQOIgKhYOKQNFGV2kZAApsqdFzG++q4WPpBn2OJunWQ6X/EEqdbHnmlbEVEcYwjW6g1z1KrHqzsPZn2O5CLyoTDt5FVrNzF2izI1iTfKPS8/4oEEPXzbAiit1hc3FIW9k2NeaEoZFLsuDNumORrjXLZVsRQqiBUOE8VbJefGGTZ+v6Vk1welKjiGvIPNPiDqO2nSP6xNIEsilVb4AVwC8Fs8+vcHAhcUi3nKbxfqMXSt6jbK/X0Ufi/U5c6ZakUG4+rUf+6jA4XBOiTVcusXiqMFDlq6BTeOCP9lpajNzu+w2EorFuybduKPg6qwemJUu8KZMrayPCZx9nA3ScfOmJgQQBcSVDSwi0qPlkmk69sTlmQcZ6QkZRgqYWIkZuOOtNal9Ep2xKlW7qcXzr/xpbS8gH4Oyyb6sKj57srOdcghZtK+BhbeH8ybvBEjyKmoucyC8A1b6bTXrIBfCpWKtA5kBLTRdw5OateVDvZUk7fySgE3Zmt2Dngnn3uCZyE7MzuDvyCiKePdP+OZ6wL0QKQsRsv0bv5Yxp7XWqJ7bnMS5Tu6ceqSznFwKmxS9yk/XnRgfR9Jr/J9odBBlf9R7A==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(4022899009)(1800799024)(36860700016)(4143699003)(261026121527099003)(261028144727099003)(261022115727099003)(261022075727099003)(56012099006)(261022105027099003)(261021123027099003)(261102123227099003)(261009223027099003)(261021121427099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LynFBnd1uNK8cxQ2AU3/Mbu437DNlW4s9ZSH2D3veBqj7Ucgh7ACXK7/e+CULLibX7kvRc7OuyYTDCFMqe8RtblGDS6xvXXdII0jljPyc0UshWr425elyXu8PV4dU3PHk7aetTyUDTH+uympWY+qBjL6M8Sk/sNJRLYN6kXZtoye3uqcHC85VcHvYJ57DVn8oQpuSfvbe3JDFdaJGVI8j//GY4tEmzSI6RR97I8CU50HU3yFH7selWw92I7DgiaO8WH30BFeAfAWzd8sVVCuvg6dcNRXACnYBy9arPz36uzZNdMXHYYBGzmtIeJxXTBO2jaZYEDjZ3XT1RHlvWtG0IpxRNTUKMUhwhSdCCS9fflxdxNAGBINO+DkhIhLNJsg9k6tdCz1XAMYLSmvd8g0pDURAYOfkX7cTcSxdc0tV2ORHQaAkZpElz+7a+S56Vbi
X-Exchange-RoutingPolicyChecked: wKndIW1Z+mdU/ZilDmnFc/c6StuXtGGZIGV0sLYG47TN95CxMiMTuk405tl5kutG0EtYbnNC8aMFjCxsZujVNBV1o7MFYNXuJGPD3mRT+oYkHhgz/MM6GVQRI9tFcgKGrkmjpRELs7lWoxaAx3uHelVRZJTHp5bn1t7arwv40rXNiJ4XYpZWW1L14H46gN+1D6UMcVLls9rJCIzxRKzs2hIOBBgbp9KvUUFZHG8iuStWI2+hFdk9xtyA/DgcNxfKuylnZp8xKPhOcQWkp9rDTNVyuFUUCKobAAsrFDOYcUvDWh8tn8rcf3J9E9+AH1GlETVvfipm5IR3Pa3lKNsdqg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:21:26.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8084c5fb-c267-4ae8-ac9a-08df400fd5cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1BDA8E55F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX4ROifwyUEFON
 FMNZV1ROa0obYyEBdRsxHsMcbhaqQ4YQX/abcMXW5qQ5Heo5cg6X7wXOD1e11g39Hj8fmRfQsZe
 LL/SAUXCsxUtlxJ+eC65hoOsaarrsT6wts5+0FjpZesTvoJsWIBvDDnYUITijzuyRGcb4ZATAyo
 PkVzNxMNuQg/86iBvW40G1u9zG9Ztq3cZjToZ+D8enGC9jtvuOtO+JqmJl6Ot/xTdFjgznBjaHK
 ZqyYrXJTSHaSt1GVmAFMuWVz72zizikriNkWLtAxKTmdPnS/sxcx2aSa+7hmScr8ycXTEez9o2t
 ECDWRW6Ocaw5ICrEjdXvJUVbb2/Lxqzc6U9mIwY5dlYXyYSpMlHH2mFvFVogVv2mDrHYajQze6r
 yO3rlFB9zYxfQeyEZhmaS5bdXbMCEzDLYt8eXLRgNYiK7GuCvVfIIbm39xEIqGuer0PwRiVw+5e
 Kj+1TqBo2Doc/gvH7Zg==
X-Proofpoint-GUID: 0WQ45Lhvm6RnMEn-7P41smDhEZEcmst3
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af4960e cx=c_pps
 a=W+em2WlbpAENNNrDSTAr1Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=82EZxdLvUyBrVFOlCn4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 0WQ45Lhvm6RnMEn-7P41smDhEZEcmst3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfXwH+q4N5+1f5m
 6CyLDvTeC4pzRVRqBF/ZZKoI0qQtt3jCvoGzQMnMwauZIrfy7hikCH1OCS/GvQ+iWwsrp6n9gyy
 vnt/Xfgcw30Dv1T1VVNFD049XRGDJtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 6ABF2t2v980995
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 16:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20531

On 11/11/26 10:05 AM, Ryan Eatmon via meta-ti wrote:
>=20
>=20
> On 11/11/2026 4:13 AM, Rahul Sharma wrote:
>> Add U-Boot environment configuration to enable OLDI display output
>> on the AM62Pxx EVM. This includes:
>>
>> - Create tisdk-uenv bbappend for am62pxx machine
>> - Add uEnv.txt with OLDI simplefb device tree overlay
>>
>> The configuration loads k3-am62p5-sk-oldi-simplefb.dtbo overlay
>> to enable display output through the OLDI interface.
>>
>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>> ---
>> =C2=A0 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++++
>> =C2=A0 .../tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 12 ++++++++++++
>> =C2=A0 2 files changed, 17 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-u=
env.bbappend
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-u=
env/am62pxx-evm/uEnv.txt
>>
>> diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend =
b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
>> new file mode 100644
>> index 00000000..bc061b1c
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
>> @@ -0,0 +1,5 @@
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/${MACHINE}:"
>> +
>> +SRC_URI:append:am62pxx =3D "\
>> +=C2=A0=C2=A0=C2=A0 file://uEnv.txt \
>> +"
>> diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-e=
vm/uEnv.txt b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm=
/uEnv.txt
>> new file mode 100644
>> index 00000000..0ffda50d
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv=
.txt
>> @@ -0,0 +1,12 @@
>> +# This uEnv.txt file can contain additional environment settings that=
 you
>> +# want to set in U-Boot at boot time.=C2=A0 This can be simple variab=
les such
>> +# as the serverip or custom variables.=C2=A0 The format of this file =
is:
>> +#=C2=A0=C2=A0=C2=A0 variable=3Dvalue
>> +# NOTE: This file will be evaluated after the bootcmd is run and the
>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootcmd must be set to load thi=
s file if it exists (this is the
>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default on all newer U-Boot ima=
ges.=C2=A0 This also means that some
>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variables such as bootdelay can=
not be changed by this file since
>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is not evaluated until the b=
ootcmd is run.
>> +
>> +optargs=3Dvt.global_cursor_default=3D0
>> +name_overlays=3Dti/k3-am62p5-sk-oldi-simplefb.dtbo
>=20
> NAK.=C2=A0 You are modifying a file in meta-ti-bsp that is owned by met=
a-arago.=C2=A0 The BSP layer should not be changing something from a dist=
ro layer.=C2=A0 You should just send a patch to the meta-arago list to ch=
ange this.
>=20
> But I need to ask, why are we trying to change things like this in the =
uenv file?=C2=A0 Is no better way of doing this in the defconfig for buil=
ding uboot on this platform?
>=20
>=20

Agree, don't add anything to the eEnv.txt file, that exists for end
users to make customizations, usually just for quick testing (vs having
to rebuild u-boot to change the default environment).

For us, you should make these kinds of changes in ti-u-boot.

Andrew

>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20530): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/20530
> Mute This Topic: https://lists.yoctoproject.org/mt/122209407/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

