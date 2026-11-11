Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4346.1794380323669884984
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 22:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hJMsit/n;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=rVqLi1UF;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5N1k23286614;
	Wed, 11 Nov 2026 00:58:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XyJEMnOOOfdedZaGT1beX4tNGgIEKsbmDOk0zRt7L
	GI=; b=hJMsit/nsDHRM5uc/w7Mmz55JuDMcvs0OZJaAGU1vWrTWz85q5vOUV0qI
	hZMh59cGCrmvHaC34H2KWm3WzXNan94VEjfat9Z69cBcOJcR2zZaIgf9h9mCIbVu
	wu/xUmNOl+nYQBZmUGJw6S0ESfdMV4kOSVZ4X032fxzjHDlr4AFRXm2r0Md8q0b0
	HQdRVYpMALXLss7pvG6Rn/J/I+AZw1UEA8HiRf3+nuLmKwIZ9MdEC25wwE/QBy/C
	U1iZLw41NUfupSUbkP4ZqDyevfOMS/VToeHwyMrD51MihBQstH87tbsy+HGWWZPP
	guAEe1PTUQh3BXwuszkYczzbRtM0w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsyguaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 00:58:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdSBgoaEdrt7bPNNNwTXk7JrlzGIHOd8aSdOlEEuKNNoon2yiBILnEvcDu7V1tgkukUzaIR/GshWahn/PEdTu5nDi0qSFWJqVL94XK+4hrtBg8mjiiGNP1I4n2X4IjSjacmtH9nEhovvLfg21YcsRcroqM7SEthxSC88Vci288Mwq97gmX916RiyND6A9cRh2+iqGrQTUAP8zQfhLAStfaP4wG5JPXH6XvMjANUZnwMkOCUOgPyk7zQ/GuEkXPRsTJnGoua54jw172Ho4gkCF9qzdGOheOSHEe64ZUuMWXoBFW1wPP6f54yCojfmYkWDXO1A7nRe4FA4WlokeNMZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyJEMnOOOfdedZaGT1beX4tNGgIEKsbmDOk0zRt7LGI=;
 b=HHW38f6fw5C/Haq59IpLR6EkO+89hYJ7qJ0KqQPB0JQnDCGfRwsqHiEgbeR/EBg+QeQ3vB4quT5yXUz12Zia8Mr5wXqt6queXZ0kO0891MMq/YNlwNPOygiS/f392AoOoHCM2eBTiTW9+5U/inpRlRWnVe3cuA1tEcafWXqhXmhWNrEq1EAO2z8ef0++Cy4XoqwGibeE488lsQ7BGaZc22Tk618LOIpV6a2hNpDa8g/0e+9BdQjyGsSVZVfHDmddk56gN8Ytqk/BKwUnsTRO2AlmHDH4IIk45KM8inj0xSWx9GSwq646dzFswaGDlNoWtpvgTxHZnPjFE88GricvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyJEMnOOOfdedZaGT1beX4tNGgIEKsbmDOk0zRt7LGI=;
 b=rVqLi1UF2DkGNguoK8Lq2Z7qRDHTZIoQ4iUQU6UAfmBuenbtuFUOS2AC1H1tZRYEli9tBsZGwHWwlPYTKRfIxxR7uZjvPc7mZxfrN7UcH1IVpRDmtk6IHOt6BRmiuYsXiTUmBgBnMzWR4LpD61SDeoqY4xdBbnhzV6ak7vkZe3E=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by IA4PR10MB710689.namprd10.prod.outlook.com (2603:10b6:207:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:58:39 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 06:58:39 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Sharma, Rahul" <r-sharma3@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [meta-ti] [wrynose][PATCH] Revert "am62lxx-evm: Add DSI config
 fragments for display support"
Thread-Topic: [meta-ti] [wrynose][PATCH] Revert "am62lxx-evm: Add DSI config
 fragments for display support"
Thread-Index: AQHdcZkay3QOLbCGOEGaumFle2tzbrcocPUA
Date: Wed, 11 Nov 2026 06:58:39 +0000
Message-ID: <ed9128c7-a949-4b51-af9e-6d8e3dfa939f@ti.com>
References: <20261111045551.3719301-1-r-sharma3@ti.com>
In-Reply-To: <20261111045551.3719301-1-r-sharma3@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|IA4PR10MB710689:EE_
x-ms-office365-filtering-correlation-id: 4fbd471f-0c35-4abb-274a-08df3fc13731
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|23010399003|18002099003|22082099003|261009223027099003|56012099006|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261026140227099003|261026121527099003|10067099003|38070700021;
x-microsoft-antispam-message-info: HJ9e+P8Ode1Iz23z4KR9dRYR9a+LijaXSndpyuxC6dA4sAGPWoyVoO9VjQrH54h3ElJm6Pdwuhdk7KQXREKIYuYUs4clTX9tCCGwCyzRkcaAtOYP5ez7v4yxoHySAfIrpT51Jvkjjh3MnYcqBvkNdalFi2/3zF5yJvLhLhiFZV9qBhdNOZ6SDKtrwym8CXRhPhy+yjgMGeRZRBN/sJ8DfyNdxb09E2ZN1KFZRfSETAeZC22+MqsnxJfFfiY40Y350lRcs6154cmx6Xufb4Y47W6P3MZOpngjyAEFi3AkMN9nPYc44uZaxuEBz8Nyv76ySyotPHhjvKaIF3o7yk/2bLZVQiWwX9biVoYkkKIZhXTZy7Lq++dJ8h4T98wlx5qrC44uE1Nm7XrZg1UJ4Sib2/INITsuYmZsjsutmPtao1LwIFvnkSgkUOTcyYcYSU4ThGoeh89CQ5mAlr9jt5EG8KOdeUmLa5+ran/qbm2v5tkIB8ksE1t1n/nORRu9g1C3HN202bW2daxuSGtisCfl9d7VQuJaDbx1FDsIXSSPuJnQzwvEEHlxo+3tLlaOFfZmp2JF/BYvJPIqauMlT3NxbNGmsexEa032giU+MF0zG33UGwrlZrh9cPm7d0PUbAA+LuVhx5BAj79HS5HDpcXdTq1I27u1cVMPFkJ102B/5DY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mys2VUZMNEk3c0FIL2Q3MzlrYm4wOFBLV2xLNysybGZSZlZERWE3YWROS0Rm?=
 =?utf-8?B?NFdOOElkRjdFNTQ5dGZEM3doamhjbm5RL3RJdVZrOTV3SDRIbFcwRk9TNVph?=
 =?utf-8?B?VEhXN2N1R3Y2YUJpSHJQcmk3QVI2OVhqWHZNZ2VpMXRSV0Uzd2VMd1FQSTEr?=
 =?utf-8?B?bnhya2FyR2txbUU5ZDJudTM3OWVKdUtUbFljODBHZ25Fd3E5THkvWVgreUtp?=
 =?utf-8?B?QkhYbjhuU0lsdERuYkxRV3VIYVBHK1dIWmpsTXZmdzRZa3FPNHUyQ3hsMG1N?=
 =?utf-8?B?NWpOd1JoZjJnYUVjMEl2V1Q1TTFVSU5pTWdrVjdIYkF5K0FZRi9oaEJFVzN4?=
 =?utf-8?B?WDJwUzZBd2VIeEM0YWQrcWtkQm1LR2pneXZyN0ZUSDRqSm5xWUhsMTlJMDYz?=
 =?utf-8?B?YXFtK2VuWUFPWjJxbzZNWkU5Z2VMUDArVWpsRWtnemxpOGJnNGsrSDh0dFJa?=
 =?utf-8?B?dDVkcWRXY1JSWDNhR2xORFdXaGxOeG5LME5KM01GelVUeSthbWFrRlA2Y2s0?=
 =?utf-8?B?YnpaYWxGVGV3RDhqQWM2ZUZYRnE1Z2paL1RwYk9OUmFJTE10Nzg0bGY2Smx3?=
 =?utf-8?B?bXA4WXlITE5YaWNxSVFXdWxJeWVCcWl1SkNTSC9pQm9DOHBQV1hZTEZSOXVM?=
 =?utf-8?B?a1d2bXBZM0JHTE9ycGZmbCttZFRaTmlOdlNWbVYrVVlTQlkweEVhS2ppaFpx?=
 =?utf-8?B?SnFNK0hkcnVZc0FTWER2L2k5eU1WV0pqeFAvWUlLZjhSMU5rY3pqVXR5OUlt?=
 =?utf-8?B?NUljK09NSnJCWktwWkt4cko5a21qRURwaWlTNTBERTZpNmlwZExVM3BZSGxM?=
 =?utf-8?B?U3FBeFF2ZVU4RnJhcFBobWtXQmtscytQalJ4dUpyTWlha1RXeXV3UERRaDVi?=
 =?utf-8?B?enkvVmtKRkZhWm1WRzEvb1p3aXo4cHgwa21DTlBHM1RlSUVudXR4RkN1RzhZ?=
 =?utf-8?B?azdmenhvUHpHYzQwd0MxZEx3cDNjYmwya29ISkJuMllvNG1VWFlDT2J1c211?=
 =?utf-8?B?WnppLzJZUjN4UzJoaFUwNndFRlowalhHc0huQmphUGxvbkNseU9UZjE2S2pG?=
 =?utf-8?B?RCtWK2hWR0dSMGtQalkxbzliM1FhTUpOeXduWVNLNjZqNkJRaGlnQ2hPdUE3?=
 =?utf-8?B?ck41cklkaHBVb3l4SEI0YlZSUExlcytlT2V1eFQ4VTlGb0ZrV1dBQVdrZDEv?=
 =?utf-8?B?RGNBTWt1RDRwN1hDMysyQjgwcisyZHIrTFl0VDZmRE1sdERzazloTWU5VHJI?=
 =?utf-8?B?QUY5MHB6aXZJa1BSQUl0ZFhmSXdVQS9Ia3VaenJKNzhJK2xDUHFWTisrSTBv?=
 =?utf-8?B?Q0M3dXF2VE5hV3dmZDBtTE9nUWljSUo5b1BTWGFVRnR6ZGZmRUZvMGlKQjQ5?=
 =?utf-8?B?a2Q1QmhkZkVyNFpFRVFSeTEyVHovdnBZWmt0MHlpZFF5U2toaGpWRlpyYTY1?=
 =?utf-8?B?RXA4RkdwY1ZwQWdQdTVpR000MjRJdmxIU2daOHhhMXJLeHlwWitmWFVmTFQ0?=
 =?utf-8?B?SnVxNDlKT3FyRXZYUnp5NGhGTGEvVlV4TjA0RVdrUklCRjRzZkU0MktncnE3?=
 =?utf-8?B?TEJYMStuZkFhVDBwTzJKQ3ptZ1dwcGprYXI1OUprQ1AyV0s5SXhBNWVwUmdH?=
 =?utf-8?B?eDNuRlZ0THRzWG8rTk5qVDBSMjFVa1hRVzFaZ3kwNjdqb1Y3ZGhqZ0ZTczBs?=
 =?utf-8?B?U3dOeHhwNk9wUGJ3Ry9RQkJvTlhKRG1PY0FoZk1RNEZnUG5oeENpNVYyYmJB?=
 =?utf-8?B?WVpSTTM5TktHYmwrT1JHYzdwSFQ4S0JFbGtML05PWXpIdm9NRG9tc2NNY2Ri?=
 =?utf-8?B?Rk5Db29YL0RYQllrUm9ja3pBUm9hRC9XY1J1ZGJKT2N5VzJtZFpKTVMvczFC?=
 =?utf-8?B?UG1NVGVkNHdJbHZRUVAyZWV6bDhrU2R4WllDdEZMOFJkZW44Ujd6OEsweS9O?=
 =?utf-8?B?Mi9JWFNUZDBnc3UwZmozaDBaZ1Y3bWk2T2RLaGJwZ0FsZ0tkLzRnRVJ6Z3pW?=
 =?utf-8?B?MUF1YUM3Y05uRndnQ21Pd2Eva1ZPK21LTWo3cnc4T2t2S0Naekt6T1dtVlNz?=
 =?utf-8?B?dXo4VHBwWXQ3ZEhZNkQrcm9xRzdvb0ZoNXB5ZkJ1WGozNVlQYUV5V3NyMEl6?=
 =?utf-8?B?b3JnZ1Nld29PQTJEbTVQb0JRUnp5cHRhcktIMTJkNnVHQW5wWVRRRkhzRnEw?=
 =?utf-8?B?aTV2azFFSVpzUFVncnA1VjFnZDdnMXNJS0FhYUIxZ0xBYmp6OEZnOHNSUGlx?=
 =?utf-8?B?NXJMOWFxeHlBZ0ZuaHBISGNQTzFnWElnMENWVmpmNDZXUG5ZNm9iZTBXaC9H?=
 =?utf-8?Q?W/CWp6XcChkFFhjhyV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2643A4D18B91E9458C0BAE1C29E439BC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E+u1ZVvM37ndynrPu/iKEl+x8E3yUJ/KUXisFnpNz0MorbMRI1tDPe560ifVK3ecUhw0YF2pP2djq5PKWfoSnDsxMijK2HGKjXVImyunDhpu36GT5JZ2f98/QOmHugQYaurB2tRinuUNSbRaeW+OaBYqZvGIo7pROtRXb22Sm+WW9tcKU5CoeS/H2+AOpECXibBPfI4qSoJv4PCPlrwYT6+TbbJ05LXTWcAoUukSrZUSIYyTaeF2gMJTUdIJeWjVbhL9d7kcVnbRU6Ct5v/mtljZgsjgHFdR0t9DqjfcmlDmPK9NLxeetOHvS6oIK/952qyndn1p3vojaVCH0m/Sag==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbd471f-0c35-4abb-274a-08df3fc13731
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 06:58:39.6593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GwefWueG2lHI53IbN95W6Ab/VdIbgJTk280DD4spX3+re+iI0XPJKxDXPzk2Jnm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB710689
X-Proofpoint-ORIG-GUID: PXh1HkHomxMi3rFWuPzoIWGJUbQjWRTE
X-Proofpoint-GUID: PXh1HkHomxMi3rFWuPzoIWGJUbQjWRTE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfXyNSCPsr1VmEl
 og5DhfmPXt6rc3TsgO7AUDuVC6EssqrSw19o5q+Gqe4tElPsTfVqIZOsayDqGjEqP4Ymtutkm56
 1gGD77tRYTvKoFjTiGYIJnjLsouVj2sLQbz5WJbmDc9935+H2lzpXb0rYYgPAW4bV60y2vKwfkx
 jsCo1XSpKSh5QEi4gxeFbT8wO0O3Qop3YQInYf9zbRLz2b296uvbiNx8tP+v3KvJzMmNhan3r79
 QCbaUr0v3AMp6No6PVbZA0auisrC6mj2SgKybcY+5uG9CZAixKqp03S5sSqs5dchGkkEf0Wzi7U
 qsYabunuEGs3zWT1soXw0tG9hu2uy2MI7Wt/5wgpIRLry66JlRf+rGKCXQ+Db5iwn5kBGChuiK8
 eD85VNr6Xbz4Vb0VTCyt+rPim2uK16qCn2H1NiZY5zxywJ0zKnEH6nyjNmgx3uaNNVotv7wyD2E
 EFhlhDd8vfh0kPh2yig==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af41221 cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=vxVNvzJGwkSReB7FBmEA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfX9n30PJCXCK/Q
 ukZq5ts2p9ojSEGqDP7Scv365oBJaVgFlYFft+oZxDPzo2lG+pyn6/tD9SnGh5Z36BaL56FudiG
 Qs2mwrjCuaZLDlpNLN6CVlEEH8kNYr0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110027
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 06:58:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20517

T24gMTEvMTEvMjAyNiAxMDoyNSBBTSwgUmFodWwgU2hhcm1hIHZpYSBtZXRhLXRpIHdyb3RlOg0K
PiBUaGlzIHJldmVydHMgY29tbWl0IGNlN2U4MDc3ZmE5ODBkOGU2MzRkYjMzNDBmNmY5ZThkODFh
MTIxMjMuDQo+IA0KPiBBTTYyTCBMaW51eCBib290IGhhbmdzIHdpdGhvdXQgc2ltcGxlZmIgb3Zl
cmxheSB3aGVuIHRoZSBzcGxhc2ggaXMNCj4gZW5hYmxlZCBvbiBBTTYyTC4NCg0KTWVudGlvbiB0
aGF0IGR1ZSB0byBhYm92ZSwgd2UgYXJlIG5vdCBlbmFibGluZyBzcGxhc2ggYnkgZGVmYXVsdCBp
biB0aGUNCmJ1aWxkLg0KQWxzbyB0aGUgbWFpbiByZWFzb24gaXMgdGhlIGNvbmZpZyBmcmFnbWVu
dHMgc2hvdWxkIGJlIGhhbmRsZWQgbmF0aXZlbHkNCmJ5IHVib290IHJlcG8gdGhvdWdoLCBzbyBw
bGVhc2UgaGlnaGxpZ2h0IHRoYXQgdG9vLg0KPiANCj4gUmVxdWVzdGVkLWJ5OiBSYWh1bCBTaGFy
bWEgPHItc2hhcm1hM0B0aS5jb20+DQoNCldoeSBkbyB5b3UgbmVlZCBhIHJlcXVlc3QgYnkgZmll
bGQgPyBQbGVhc2UgcmVtb3ZlIGl0Lg0KDQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNoYXJtYSA8
ci1zaGFybWEzQHRpLmNvbT4NCg0KV2l0aCBzdWdnZXN0ZWQgY29tbWl0IG1zZyBjaGFuZ2VzLA0K
UmV2aWV3ZWQtYnk6IERldmFyc2ggVGhha2thciA8ZGV2YXJzaHRAdGkuY29tPg0KDQpSZWdhcmRz
DQpEZXZhcnNoDQoNCj4gLS0tDQo+ICBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvYW02Mmx4eC1l
dm0uY29uZiB8IDMgLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9tZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvYW02Mmx4eC1ldm0uY29uZiBi
L21ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9hbTYybHh4LWV2bS5jb25mDQo+IGluZGV4IDA3OTli
ZWNkLi43YTQyMjYxNyAxMDA2NDQNCj4gLS0tIGEvbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2Ft
NjJseHgtZXZtLmNvbmYNCj4gKysrIGIvbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2FtNjJseHgt
ZXZtLmNvbmYNCj4gQEAgLTI2LDYgKzI2LDMgQEAgVUJPT1RfRFRCX0xPQURBRERSRVNTID0gIjB4
ODRmMDAwMDAiDQo+ICBVQk9PVF9EVEJPX0xPQURBRERSRVNTID0gIjB4ODRmODAwMDAiDQo+ICAN
Cj4gIFRGQV9CT0FSRCA9ICJhbTYybHgtZXZtIg0KPiAtDQo+IC0jIERTSSBjb25maWcgZnJhZ21l
bnRzIGZvciBkaXNwbGF5IHN1cHBvcnQNCj4gLVVCT09UX0ZSQUdNRU5UUzphcHBlbmQ6YnNwLXRp
LTZfMTggPSAiIGFtNjJ4X2E1M19zcGxhc2hzY3JlZW4uY29uZmlnIGszX2E1M19kc2kuY29uZmln
IGFtNjJseF9ldm1fZHNpX3JwaV9wYW5lbC5jb25maWciDQo+IA0KPiANCj4gDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIwNTE1KTogaHR0cHM6Ly9saXN0
cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS10aS9tZXNzYWdlLzIwNTE1DQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210LzEyMjIwNzM4MS82NzQwNTk5
DQo+IEdyb3VwIE93bmVyOiBtZXRhLXRpK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4g
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvdW5z
dWIgW2RldmFyc2h0QHRpLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg0K
