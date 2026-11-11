Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9685.1794404675948231432
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 05:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NdUjYAJP;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=bEW64jDT;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCWuoX4127524;
	Wed, 11 Nov 2026 07:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zDWyzQPfkX4UfrfIlvQM/kxmTHDWSfHIU6EHwMR15
	w0=; b=NdUjYAJP/Y4SjNYTYvQlK1IVjiLrcB7RokRgjxoWRRViXhbTb/2JzJKx+
	ZiUqQzkyw5zRJTQ0izk36KUg6HC01dcOmBqOoil4DLzgRWuJUmQmitC3WNVNxszN
	PJM36TgrVGO+aXdr3FSQiWD3UizybEeyrQckkTcEx0t2vYJZv8ro3WJ0dofr9my2
	gy2G9zA7BMTn0It8PzOZOnxV2pgB3Hgp9GBkeW+tuBDu0A9s/YdekQKH8y3HV3/w
	HNxHyq8KqjlHXtvp6wJ32D2dGdH36DO3wB3W/fjWXdAuDsBCCVS3dj1OI+kvXw9+
	/FEdszwuabXu/zYSeifpk4hRvvHKA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsyjppd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 07:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz2w2kdXmJija/zHKZ8kohjUZMrhf2VoBCfHhNObhE67fmcvHxeeV/u0R0P8wWhMOriJ2z/u85hCheZrwrSGzyj8MK10EaMCIpfJfs+fo80u9AZj1WuF9PKS7wpPpzoq7o2sPWu1l8QzRthKx5RVxPm1QMWltmEiGw1SpgHWngT4wkf1+7zvWbVVZnLEW2D9KLKGznfk0apQT1fa2vQkMz8z9sGTb9PGmKlHRWVpJYCD7Vb8uBe7hwxPU04yOMMBkWl3tdID5PnB8ka9CUkc9nOBbpR7DFwznml6taQ1PSenUAoyI48iWZqzTlKO2PdmBjAhLmmP719kXTrqDfQ63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDWyzQPfkX4UfrfIlvQM/kxmTHDWSfHIU6EHwMR15w0=;
 b=kEHrHupuuZqDKzhQMRwLbxS7vlDt0/o0AVwQZW8WkOrfFdE3Gt/2vpGdhNfCMQiUsII2MDTG/wbOl3YYEhBB/ce1SLyoKUUizIrmUaNqmVTAgnYdx9dP2irWXrwf5fhyT6KZMvRMpd/Wm9dxYMCJZiVyU5nKy+GC1MVwwYgZmWrrl4EQlsVF88hOEEoXCSEwHzIo/8x7PwT2JHJWobqEeyZZfq2l6z9WblDlAPZfDBoncsKfBAKfehRHldUFw4YC62RgSq5EawGP/o9vf6JfpEf+7zdk+gDUg54I0YZY1Ja1K1shQhu5E7Ly/foqUyew3X8YjarcJDg3sGefP3Hb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDWyzQPfkX4UfrfIlvQM/kxmTHDWSfHIU6EHwMR15w0=;
 b=bEW64jDTOsBirTePB/rkApepSTQ3WVoOWiElcn8u0LZuwPXzqU5FDDtXbPBknB1ZGPhA3I8gLlaxWhTqh3FZ3466lDMCPna9TlEZbIzVwhV12ZgvRge7QI8XdpkKxBPTV71sihbqXoqYHCu2ipzgxeF+Qj8tnKVZiHBy3V1K6gc=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by SN7PR10MB6979.namprd10.prod.outlook.com (2603:10b6:806:328::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 13:44:30 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 13:44:29 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Sharma, Rahul" <r-sharma3@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [meta-ti] [wrynose][PATCH] Revert "am62pxx-evm: Add OLDI config
 fragment for Microtips MF101HIE panel"
Thread-Topic: [meta-ti] [wrynose][PATCH] Revert "am62pxx-evm: Add OLDI config
 fragment for Microtips MF101HIE panel"
Thread-Index: AQHdccvh2Z93t5ks7UOLbyqDf9gUw7co4fGA
Date: Wed, 11 Nov 2026 13:44:29 +0000
Message-ID: <8b7bb89c-9626-4a9e-a5e7-122174bd97e7@ti.com>
References: <20261111105934.3239366-1-r-sharma3@ti.com>
In-Reply-To: <20261111105934.3239366-1-r-sharma3@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|SN7PR10MB6979:EE_
x-ms-office365-filtering-correlation-id: 39663913-9b20-4a50-d652-08df3ff9e8e3
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|4022899009|366016|261009223027099003|10067099003|261102123227099003|261021123027099003|261021121427099003|261022115727099003|261022075727099003|38070700021|56012099006|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: WEWFZPefKwxpYSc20hbxMB4eyigVco+sjbGUM2jPmZpuDBabBJ2Lg/dDZK84zPKrTQBsfsbkPqzAGEPYeIIe5J9bH9JZr/nv1Uz676nsGuJnnGeihNFor6e9n8io+F9ri+ZJ+d5dAHpNreSwg8IthX+FF59uB/eRnkR+h88x/ylEt9aaGpsVCxbqCh0JzwSFORVPKqHwSJrPSJr6Qp9AMZZ4iq6MWxtpaIiGNS0IswesWQ0bVxdpy38PmqAtybWLJdWAIyGUYBAmdYLyZKPOU9qnvgtN24ivXHUwLpjWf9iP6LN/1vpfz9HpARPHqDLmmA38qsho07tfs7551aG72K69byFhiD10ha7e14KAwfpbaQxUNB440lTVZO8Z82MUzviVp7ePIO0YcMENIhv1lpu/Kiv0mOtbL4XBlHolLxlDpkpZlKO4Mx5iOIygMEr3wEqb8FS7fvoFnzLxvvTaejN+oSgEsRrPVtJ9FiiBsAAmC0HaOj5gphj/6AQ9z/I39ygMOL7wLSlWgY5UgX5goQ4lPXF5CmLG4/BWNfYRua1bo+boFIW5A5j+ooAZ+JBCq3wdvzVokNPKQy0oPRqX74dR/qyRR0CQUJDK2K9sG4Xw9yCYSB4VBE6qalqVUX1ZXhKqEjZDCK/Ue5C8dgpGC2xIETmfmgX+Vt/X3CElGgI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(4022899009)(366016)(261009223027099003)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022075727099003)(38070700021)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXFMUi85aC9iNjBUREJoY2ZqV0ZoKzJWcUJJTUpmWm00ZFE4UnppcTI4ekZT?=
 =?utf-8?B?LzN2NWhlVlhyeG5KUkZxVWh0dytkc0NaaVBLbzVpZTZPRTJDV3VJczFIeldq?=
 =?utf-8?B?SE9ZKysyL2l3NW50KzJ6akNwR3o5dWNVQ1VVTzlwa0J6VEtSMjBLVmQvVXJV?=
 =?utf-8?B?aXp2eGQyYXI1Rll5K0R4QytjSktvdEJqYXNHVGtINDh3Vlc3YVpmaTlJM0tU?=
 =?utf-8?B?QWZXUytjMzg1YWYreFZRMzVZdGdDcURFY1htWWNiWEYyTTJaam9iS2ZtRnpw?=
 =?utf-8?B?bXoxK2pBc1VleVc3dXpHYjVNTFk3R1M4K0tDaEVRcWtWNllYWFJNZ1huSVdK?=
 =?utf-8?B?NkVJRmZ3dkRRMzh1c0NsRVdEb1dHeFRvckpGQnRhTmdwRktGSnd5SFpyTXNw?=
 =?utf-8?B?ZlhlcnhlM0gyYkRCZHhKUk5FVGpaTGphRm1IclkzSUxhMzJmTFVVRmcxQkRy?=
 =?utf-8?B?eTRMcXVsdDhCUkFWZy81WWVBRHplU0hxQkFGU3ZxdHhzeWYxaUxQSjU1dGhE?=
 =?utf-8?B?cVF3NUUwNXNJWkdyZnU5QTN3MkxwL2ZSU2lPZWdON1kxQ0pheDNqZ1V3UTU2?=
 =?utf-8?B?dFRLTVI1RXdmZStDVGZ1a3U1ZVBDZW9TUTYvSllpdHhmRHhLVFhFZ3JuQ2lo?=
 =?utf-8?B?c0hQRTJJMXUwd0dkV28rYllPWUtMVlRhSzYvQjZtcy83ZFBvM1RWWmo0TURW?=
 =?utf-8?B?N0NRZWNTOWQvSFpXV0hwNlZ3bUhxSVZDVTlUdGNNRUF5Z0JhZ044SU8rZnhm?=
 =?utf-8?B?MUhxZHN3eXk5REtBVk5DdExLRlpOZE9FVWN0VmdWU0JxQWwxN2U1MksyZXVi?=
 =?utf-8?B?Zll4bmpMSkl0cXFjVFhoRDBxaEw0RTUwT0x4SVNXMVh0cnZodkxZby8xdE02?=
 =?utf-8?B?ZEtqdXNmRThuQlJ3emppZnJvYXhaNXdTQU1QRkEyelk1RER5Vjd5YnZhRDFl?=
 =?utf-8?B?d05FL2pYZmJURGRrS2VpK1FEUUdFQjBnMjkwQWx6VHhTdWQwM2EwVE5wMWlw?=
 =?utf-8?B?eFRWbUY2dEw4S0xwVVNaK0NEbGdCcDNqWi8rL3UzOE5wUThvcktGYlZwenVx?=
 =?utf-8?B?WlNUdG1ZbzlVT0E3c3ZWMFFQcEtyQlFZYkNRWWRJV1crSzVGTVU1bThkV1hS?=
 =?utf-8?B?WTVob2I0QTZhYTUxVmpHa0p1TFRXMDhoS3ZZVUFFVms3Yktidkc5L3pEM1pO?=
 =?utf-8?B?OWk5TGF6ZjVxUFA1YXRYc3F6MDFHR3FITS9BUURKem5YMW1Ybkt5ZWVTUHpq?=
 =?utf-8?B?TStMckUwSE5HSm5yTExBdHVhTFBFMnhidzlVcEFlN29IdjZjdHJZRmZQbG5W?=
 =?utf-8?B?bE50NXI4cjQ2RGE3ZUJPcmpweE5Ta0N2NThSYlQwRmYwcDVEb2V4Y1dqN2gr?=
 =?utf-8?B?K3ZucndHOTUzM1ZMekFuRXVZb2NONVdSUXJIQWpNR2Ryck1vMENIdWFuM0dZ?=
 =?utf-8?B?VSt6V1A5VnVaYlc4SE1aV1NUcjY3VGF1bFlXL2pSN2NodE1sek1wR0tPSW1X?=
 =?utf-8?B?SUw0ZTZrOVM5T3pxaDY3T05Ka1lpaHZrUVRlaE85T2pZL2FUUmt0TG5yWWRN?=
 =?utf-8?B?T05rWVlqSVBRdjN6aDcvWDVwVnV2L1p1ZmJSL2RGRk9pZ3J0UmhscGJPZzJO?=
 =?utf-8?B?K3BRMTVJbUhCVmJadWVQalZ2TnRoajNDYmJYNGlFekdoVnlDMlB1bkNPbjlK?=
 =?utf-8?B?azRUTURBd2QwSCtNY1hJMENjNTlKaU5uL2xLSEdDTlhhZFZaU294UU9YcWVJ?=
 =?utf-8?B?eG5ZZTBKZERNWW9TbDFreXBZSXo4SmJUZTdBRWZnNXFKMExBaUowRDYva3o2?=
 =?utf-8?B?VzY5Q25vcjBTayt5aVU0ZkJ6amhRNUQ1TTNiUXpXaThFOEdmOThmRzg2UDg4?=
 =?utf-8?B?VjYrRmxKb3hLL0I5SlZuYS92SXJYQjlnS2owQTJ0a1lCTENNdFN0N1lTUk93?=
 =?utf-8?B?MnBwbUgwNjlaL0g1RVNQcVVsWVF6aFBVZ00rTkU0VUlhSkgrV0E0T2RGYVFU?=
 =?utf-8?B?NHlpYTJIaUZSY0pKb1ltdFBMMElaRnpNalJUVFFpZEQ5MTE4OUp6S0NTTkhC?=
 =?utf-8?B?UzBmN04vVWZEQ1B0bG93S3I5RWFqRUxPeGlIUEI3SDdCRGV4N3RDd2xHaXFD?=
 =?utf-8?B?T3ozbXpOL1lRK1lZcWw3Sk96NjRyaVh0ZDF4ZDJvRmNyN0sxbnRlTTAyRWlV?=
 =?utf-8?B?VWtGbXZsMS8wYnQzMGsyeml0NldCcERCZTJIbVJDUmVJekRPa084ajh6cGJX?=
 =?utf-8?B?VE1nWlNKNFM1NUNYc0h5WU1LWWFoc1FqZmNDTk9vSUFnWXlvOGxmWS9tZGg0?=
 =?utf-8?Q?uEabpO/Tu87f8cGrGJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <703C314DED07DA408A85E02B9E2A2151@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D7UFYe5u6+h7UW1oKQZqwY9EABKyULDRdRbqy/B/mVlGNEvAnkIA3I4gzvPraqu7NxVrSR+/S1AsQzQI2iUrK/k/Pd4gz1SlMrl3+c6343BO94o1jLEkJWLsB+Sa8YyfsIxc0NW3Upy8bftBd9WHUNhEQQakuAEBVcIAjFOOZFR5Mu7IkC+fycpv1+xCNHSExqe++8MIshfaRlWJvUtdt/gnaQWyd1D9vWHktc5N7/98hZZsbRAyo4UL3imIGq4CxtHv5rKAbgW61sQ0m4tA4Labf+gBjZI+3srrqXCyMmrRxLFR+WXf6dC4Fda3VTOfp7Zq9XktLPpdOereG5Khdw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39663913-9b20-4a50-d652-08df3ff9e8e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 13:44:29.6005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2HVbugR9uyzI9W7c98ggUqZQU5SEBhnG2mtLHvboXfmG/FSnmc3HQ3GwU/Wc9mEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6979
X-Proofpoint-ORIG-GUID: mQGxQUuE4jNz-ljkYfYll11qQ3nsiwen
X-Proofpoint-GUID: mQGxQUuE4jNz-ljkYfYll11qQ3nsiwen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX/Hwqxfv+Bjdh
 gtbgsE48vui/ItRdSZkFx8ILPyBh92vfLadA9gOOm3QsJoNfwYfHLo2mqhAcWyZL7d9KNxh5Yob
 HjW0d4X9yhPnfrsqjm+rg1fYdchDF8Z9Ltip6eRbBdXLwhzkRoQD0ijmvN6iihcMELXP9mmCdVZ
 pqHbdI6URr4bCSElBn9UkVFElp6n8veY70thK+rEWfYVqFWfCUqe98Fs90jRyGXcKokzXJ0VJwd
 2cXVRjA69bedpQLk7uMOMZkeaKe9rdvz4oyuVgrhIZ8Z3tFeI7kgxw+5PlGk4vpFUxNl3uMiOKY
 AMK8xQoTU1iMPf6+RE9rtrUAGk+bS68NgwVo7j9YlIG8U5SjM58BLgtTZ11P3DG2hdfW2rSK5Cr
 fKyi5RZyulAS+ZreYLhmnrAfHgjoPTQKAbHpb/Fm0NFeXB7whIm3ktECrtwDy5/IsYIFUdHyVDN
 WC/Zp4+LytJuNo85sXw==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af47142 cx=c_pps
 a=Vy3FhvgG8Thl4oebyZnGOA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=FfPvXeHlgCiaMftf1ZoA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfXwb7XZrL/NHVP
 clYvjMxb01CAKJYft9gt7mDF+jNX1c11ainBDei5PJcsXqfp5B+gJIYnLYLnjh9CqmbhUSKZ4L0
 tv5GHvFYZsFqTamtxeoXEzMTZoRTyoA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 13:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20528

T24gMTEvMTEvMjAyNiA0OjI5IFBNLCBSYWh1bCBTaGFybWEgdmlhIG1ldGEtdGkgd3JvdGU6DQo+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgZjZlODM0NjI1ZWZlOWNjNmI2NGMyZDJkN2Y4NzEzMzg3NDA5
MjRjYi4NCj4gDQo+IFJlbW92ZSB0aGUgVS1Cb290IE9MREkgY29uZmlndXJhdGlvbiBmcmFnbWVu
dCBmb3IgTWljcm90aXBzIE1GMTAxSElFDQo+IHBhbmVsIGFzIHRoZSBkaXNwbGF5IGNvbmZpZyBm
cmFnbWVudHMgYXJlIG5vdyBiZWluZyBoYW5kbGVkIG5hdGl2ZWx5DQo+IGluc2lkZSBVQk9PVCBz
b3VyY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaGFybWEgPHItc2hhcm1hM0B0aS5j
b20+DQoNClJldmlld2VkLWJ5OiBEZXZhcnNoIFRoYWtrYXIgPGRldmFyc2h0QHRpLmNvbT4NCg0K
UmVnYXJkcw0KRGV2YXJzaA0KPiAtLS0NCj4gIG1ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9hbTYy
cHh4LWV2bS5jb25mIHwgMyAtLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9hbTYycHh4LWV2bS5j
b25mIGIvbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2FtNjJweHgtZXZtLmNvbmYNCj4gaW5kZXgg
ODA2ZjZhNDcuLmNiYWUyMWM0IDEwMDY0NA0KPiAtLS0gYS9tZXRhLXRpLWJzcC9jb25mL21hY2hp
bmUvYW02MnB4eC1ldm0uY29uZg0KPiArKysgYi9tZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvYW02
MnB4eC1ldm0uY29uZg0KPiBAQCAtNDgsNiArNDgsMyBAQCBJTUFHRV9CT09UX0ZJTEVTICs9ICIk
e0VDRFNBX0JPT1RfRklMRVN9Ig0KPiAgIyBGb3IgQU02MlAgdGlzZGstZGlzcGxheS1jbHVzdGVy
IGltYWdlLCBzcGxhc2ggc2NyZWVuIGlzIGhhbmRsZWQgYnkgU0JMLg0KPiAgIyBIZW5jZSwgZGlz
YWJsZSB0aGUgQTUzIGJhc2VkIHNwbGFzaCBzY3JlZW4gdXNpbmcgdGhlIGFtNjJ4X2V2bV9wcnVu
ZV9zcGxhc2hzY3JlZW4uY29uZmlnIGZyYWdtZW50IHByZXNlbnQgaW4gdGktdS1ib290IHRyZWUN
Cj4gIFVCT09UX0ZSQUdNRU5UUyA9ICIke0BvZS51dGlscy5jb25kaXRpb25hbCgnRElTUExBWV9D
TFVTVEVSX0VOQUJMRScsICcxJywgJ2FtNjJ4X2V2bV9wcnVuZV9zcGxhc2hzY3JlZW4uY29uZmln
JywgJycsIGQpfSINCj4gLQ0KPiAtIyBPTERJIGNvbmZpZyBmcmFnbWVudCBmb3IgTWljcm90aXBz
IE1GMTAxSElFIHBhbmVsIGRpc3BsYXkgc3VwcG9ydA0KPiAtVUJPT1RfRlJBR01FTlRTOmFwcGVu
ZDpic3AtdGktNl8xOCA9ICIgYW02MnA1X2o3MjJzX2V2bV9vbGRpLW1pY3JvdGlwcy1tZjEwMWhp
ZS1wYW5lbC5jb25maWciDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBW
aWV3L1JlcGx5IE9ubGluZSAoIzIwNTIyKTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cvbWV0YS10aS9tZXNzYWdlLzIwNTIyDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy55b2N0b3Byb2plY3Qub3JnL210LzEyMjIwOTY4MS82NzQwNTk5DQo+IEdyb3VwIE93bmVyOiBt
ZXRhLXRpK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBz
Oi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvdW5zdWIgW2RldmFyc2h0QHRpLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg0K
