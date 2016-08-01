Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 920C2E010E8; Mon,  1 Aug 2016 16:25:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.38.74 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1963 seconds by postgrey-1.32 at yocto-www;
	Mon, 01 Aug 2016 16:25:24 PDT
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0074.outbound.protection.outlook.com [104.47.38.74])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A391E00EEA
	for <meta-ti@yoctoproject.org>; Mon,  1 Aug 2016 16:25:24 -0700 (PDT)
Received: from BL2NAM02FT010.eop-nam02.prod.protection.outlook.com
	(10.152.76.59) by BL2NAM02HT046.eop-nam02.prod.protection.outlook.com
	(10.152.76.141) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.8;
	Mon, 1 Aug 2016 22:52:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; yoctoproject.org;
	dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT010.mail.protection.outlook.com (10.152.77.53) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.557.8
	via Frontend Transport; Mon, 1 Aug 2016 22:52:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43607
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUM4d-0006i0-BY
	for meta-ti@yoctoproject.org; Mon, 01 Aug 2016 15:52:39 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUM4d-0000Ko-5o
	for meta-ti@yoctoproject.org; Mon, 01 Aug 2016 15:52:39 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u71Mqce2029210
	for <meta-ti@yoctoproject.org>; Mon, 1 Aug 2016 15:52:38 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUM4c-0000KF-Jc
	for meta-ti@yoctoproject.org; Mon, 01 Aug 2016 15:52:38 -0700
To: <meta-ti@yoctoproject.org>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
Date: Mon, 1 Aug 2016 15:49:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22486.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(53474002)(199003)(189002)(11100500001)(305945005)(87936001)(54356999)(356003)(50986999)(7846002)(31696002)(92566002)(36756003)(86362001)(19580395003)(83506001)(450100001)(64126003)(65806001)(65956001)(8936002)(63266004)(2351001)(229853001)(33646002)(106466001)(23676002)(50466002)(31686004)(47776003)(81166006)(2906002)(81156014)(4001350100001)(110136002)(107886002)(230700001)(8676002)(9786002)(189998001)(586003)(77096005)(65826006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT046; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT010;
	1:0x7jnmv9KirggFRKnQ51Kd2doDn+0AIfYRLdzxQme0vzblTRuvrEwhQHEsZgcFWIH9Ndhl4vBmpqYxgKJw8MnQQo6w5HrTo4x8SiPUx2MdEn2vXj0/8YeHxHHzR6rBoPLYZiBHbWQ3JWAwyzRm96ZtSsHNn5aLKAgCAIcbC0mqXCZFvFNvvyWH7TTefgzbrEQz+P9fOtpbQzzxr7YobvNgeeYLV0MUp8PPFG6TkHs/jRgfXs9NaTmaV8/xK1G99BwM7S+gFT8LWnbrD6XuU8mX4BUgwHwTBsDyULqSA9AfWQ5bbTb8faFgw31Xv7qeocUYJ0pshdUKNDMNSafQrJkpHnVpCtgTuEpMdYhjmlHhYexCU80G3URM3du8gO8/8qqSgcdl457dogFxCyIAW6Dy9damzQKtCRbaITd1UeL8bSve/Akw+RedC1W+u3FG4qOfOXEMXuPEYfPhXoFlvQBpKpBJ51S1hwK95lmKV3dtteDLcpC/RMfZjvbU0z0fK7fmRafRbznEanQhqIUVxGYJqCrAB3biTRHQBAXhpzwU2KiimHGEaxVOTpLaCxRgh9
X-MS-Office365-Filtering-Correlation-Id: abeb677e-31e3-4574-b67b-08d3ba5e8a66
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT046;
	2:RaXHWiUDzYPWSWBO72V/Ekh8Kn9EYX+Nj4kYCZP1iq6zsLXLiaLYLfiKJWm0D8fMclaL26XIdIjmb28HUcY0bzVrGc51kfSRYcloTNAJIO1kr2tWTLTpNl2RvpLY3HJW35VD+WCdJMBnMID1/5yOKFQ7aCEG+vFWCNFg+O22skprAHMYYgGFzfp/e+YDM8sn;
	3:NF8AWTAwgmerpyLvrz1GFJNxXV81KuXCrCyTpSyh+74Gh867XQHGziX/KPf6C4yBkuHHvaRBLy4+THfdc6JZNe29dpMD1r0likEpOxccZ8v7nLFPbkxWlXi/ksmyyYafKJfyWcADvkYd6YJ82E0B7on4s/Xo7QETdoNj+wEvrNdRfKEyjWI8Xuw5RzIWnGm9PKSmQ5R/Pjwh3PYppgd6SqLyTP77E5Q+eKj0R0oy7GSv4+1GKQTPJ06q4uALOB0+wtSYzqmq2/LYDqDYqdup+w==;
	25:ZS3MaioshCQ3qMkUvErjhOoejR5Ui7IoQuZ3/P7o+W5dEyW5AF43dSVWGZyKGTWskYznlw8UOeVaDsrmu8H4HvRwuEyqF+iqhCBzeTerWp9cJ1M4pyoeZD/hIpArAjayvn5+KMzqa8iM79SZFaQu8+JpgaO0YoOqChpq8eVOcXL5FP7O01hnv2pcP6f0zbvX92Vg5yz6HkfbE/X96jtL8YWeBwZZVJNr0iXYlsHW1QVw1BtmRbbkJGlaV5p6goQdjG03w1WGwJSP5bjklLKgKZpppycBENqD2WXhSRSqS4InQDL0e/Zai3jxwxLUZxpfphH1JILMC1niqnujaUqLDrvTF8wbuVUgzz5ez9tosj0MA6okP7K5Y18h4i+0el+qyzVX9V/FNvIBK+dLw1bFxCvJmjlCW0V/+LpOJStlR18=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BL2NAM02HT046; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT046;
	31:VC2R2as8DUUajgQG3e4N+l+ofz1lhj6jn0DHnufaxMVmqg+FjnpQnM6dIISJMPGE+AZu9ALaE0DOW/CpxeQ+UpUIIpuHRLOk3WqFQxD8XPCAOP8ucJ7X/Dk63YVe5BhHwpngHLNqp5dsl38oKvq2H30ZIxfxeLsIz6jaTqVKH8M1f9kMqvzXbFddXT46w1R8Skev8m/KVCa28sEKz+lf1H0sZVEn8ywGJaL7RnUpUH0=;
	20:EWBYtd8tWVyoe3qPQf64ch0cZ0zXQkE0/H/jAEvB7xEvnuMaXHHqiEqbUmCD+psz+CPn/KiVa7F1EwE17P+uE/1v5UXbDJU+kZEIU1U0wd60HOgqrb3WJPL9J83S2k9ddU9IjR8weUxma32+wvvjTx/sgKuTcDA6lyv6Yoc3oHn70/VtnjiRyJkFQ7kzZ3+5e2c6/JKgNDR6XhB0x55SaGDxDdtL39tgjFEPbaNhAcM3uQzgNydmPzY7e0jeV94O8n74OmOsY4oYcDCOuA6+eoXcX9fYt3WmjLD8OBG0CDLe8i/tsteVNvieQ8N6UyDW3r4YzrJNkOQol/NlV633E4T4JOHugeIr/JHEL51Lw7l7+riKs64KvwW0GjW6sx7l5DSrNQnkZ15bm9C0tYpjdIbeGkSVOm8X8DdIuit6D+Mr742kQu1+86F2WOkAt/W6g0Pn0HJ55PyknfMqEf3dyC3wKlvzB61u4OpKPESsQAPmOnBY6OCubHIXTOzoIByX
X-Microsoft-Antispam-PRVS: <bbe25d9f616948a3ae6b46ac22734e7d@BL2NAM02HT046.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(13024025)(13023025)(13015025)(13017025)(13018025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT046; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT046; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT046;
	4:1sloLoL+pl0OEX+inWjYU2KX8ahFpSjVEeXUu3YjbbPoEwGDPGTMBwfdcqxCZJB+MIAs8hI3esFlb+0mZ4R9UfvOP5HHBwpdc2MgK+VFYGA+V/Q97CBBRraP+C6mEXrEfxrIaODOHlN1mk8rsXSvcEdlVcafz81sbcgLJtE6dy/T1t/NsuSw9tmFFQoAlSbA6vKWGaMuaYWDT/bi+G0Qwe4X4UII2+NkUTatd8oBy80+pmiztFQLLcfHT5zCNeGrk7Hji8zpP+7e+q/ex9EHevlfPS89j1gPfo4TOsQHDRnNQ8BPDFukalshtsXsRZ7M7ycFpBn2AcgRbLfp/IfeER9qizkUiLlJtSdzDIWFiDcEouU2XuT2Ep9Tb9OKY8UyDubVWLtsjyJqKU/fSAMEmPmF/SHDQ5TVVcMempVQvUSeDMX1AeUWLEt7/nx2z0EZl09orAq4CbQFdyuIqfBIHf3YpRWRMLevOlmwNu64CWVKpI8rLmf0ErDXKCe/ZshR
X-Forefront-PRVS: 0021920B5A
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJOQU0wMkhUMDQ2OzIzOnMyZ0JtNFZEZFFEV1FCcmZPaEkwQlRibE84?=
	=?utf-8?B?ZVo3K2NoYk15RlFnWGwrU1M2VEZOQWdiQTR6NEZsd3RRWDFpdEx5T3c2V2hB?=
	=?utf-8?B?UzdkVEZPNWxnTHgwYlowQVFmZW5pRUN5QXRHWTArYm5YcmIwbmoyQ1lvdnB3?=
	=?utf-8?B?bjdnSlNsY0d1aEtLVzFFZ0U4ZWYzZGRVaTM1UzIrc0VuOHVaZElwV1dUQlZm?=
	=?utf-8?B?YU5VWXFHaVRLRkdGUEVqczM3dVIwc1pZRGhKenk1YTVNUVFWMWNhN0FDWXpS?=
	=?utf-8?B?SGgvdnZRMlc3eDREVkc2bEVGSmNORHh5RG03MEpRQ3p0ZlAzMGNKa2VieDJN?=
	=?utf-8?B?dGhEVTcwMHdTM1JZZ1BneHBaTnVKS0h6ZkJNQU5CTmszMjBvMUZjTTdxSHNV?=
	=?utf-8?B?ME9mMGxITXVwb0FLbk1aTG93OC85bXQrUVRiWW9MeUwvdWdyR05XSGJNRHl5?=
	=?utf-8?B?ck1ZSkdTRXF0QkNKV0Jkc1dXa25VV0lMdFFCTElsL1RaLzlRT20wRmM2VGpZ?=
	=?utf-8?B?SENiZkRmNUNqc1Q2MGg1QStJVGtBdVdqRVk4bDQvRENHeDAvNE03LzdzNkVS?=
	=?utf-8?B?OHk0b1JjS1Z1QUlkRUxYQ0krMEFpZGVvSzVNMnZlNVM5RHFTS1J2Y0dLNWhq?=
	=?utf-8?B?Q28vVGRnOGthOUpCOEFxVnpWb3kzRnQ1YklWZjgwajB6TGlYSHdxTEJ5aFFz?=
	=?utf-8?B?c0pCS1NRQm1hNzVVaXFERXZWNjc1VmNkbVREUEEwclEycExoOFZzOVRNSlpa?=
	=?utf-8?B?N0J0TEo5YkZyRjJVWXZrSmpMWHl5T2Z3aEpjTHRybmlsbFMzMGpsSkx4OEMy?=
	=?utf-8?B?V3RqaVZhMzNuTW93UmJUNUxyRVp5b0xyL0FvZXhLRkkzRSt0bXhjd3V6OTR1?=
	=?utf-8?B?RGJ1SXdNMUlTTlo4QlZMY2htY1hjTVhneEZOT3FaaWlBVGxFc1ZZREgwakxl?=
	=?utf-8?B?V3N2UGFwaVNCVGNsb3UyNFNPWWRrZFJmUFpQeWV2YVV5TjBkODJ5MWViK2dP?=
	=?utf-8?B?VlZBaE40MkU2dTVkYk80VncwWHJLNktRV1VKU3c3TDZRRjV6aGd5K1FSWUg3?=
	=?utf-8?B?dk95Y3pncXh0amlySVl3c1FnMjZHNUNDTHdoYSs0QXJ6VTI0UzFrNC9Ba1R4?=
	=?utf-8?B?b0xxRVpRelVIeTdwYlZtYXNQSXpHekJ2SzdUL291ODd4UDBDMGNsVVlyOVh5?=
	=?utf-8?B?aFl0SnlLQ1hwMDNVZ0hkSmJ1ZGNJbkxZd2VnOEsvMHEraUJKRUFhaWs1ODhM?=
	=?utf-8?B?dWtqZjF0L0NqK1NScTR0amo0RDMyRGt3QmlWWnRZbXY2eVcrcVJ2WEFrb2kr?=
	=?utf-8?B?YXNOVEJLRXZRR3pnSGw5SEdvK2RqQWF0NWtpWE1LdDlMSUppd3l5QVl4amZD?=
	=?utf-8?B?N2ZqdEhyMy9NenMzS2ZINW9oeGlndUpOWWxyTzVIVHRScVZ1S1JzNFZJR3Vw?=
	=?utf-8?B?TjN6RFNqVDRSK3Ezc2VXd0lvd2w4OUVUaTBHdU5pU0VqcStKTktPcnpCSXhj?=
	=?utf-8?B?OHFWN1JhVEhFVUtNTG14SkNTV0pudmNaQ1RzdjQ0NXJmTHBSTklWcStObXJt?=
	=?utf-8?B?S0NPWWFCTExQcTRPVnlHNmpqZDUwZnlmR0RwbHJJcWF3QSs2TEIzZmkxM3FJ?=
	=?utf-8?B?cnpwU0lXWXBzREVRVDE1NnVxU2IzSXlaRXJ2WTNjZUFtK0FId21QMVFBPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT046;
	6:iCWVeBnWqE2VhpgwJ6PG92zcWspjlln+Q4oPjXFIhTFYs1flThnn28AxG2Mhof9eoq9R7KC6NFL0bPCbG/vBkwGY4w/FrMWnvBHqF7t+qBmHDpffmHiN/IWG3cdBIcyKlKvLI/HmuHk+d+JkwY6RALObZAzM6Eq4F7XTwt7+GTQUMcafeyUUHc1FIn8OhBij4DW1Xw8Qty2N3TwcqwUQJBqz2W+Wm6HKik9SiU6ynAEDqM7klTxTtghHVRoh0KuxqjvUYVrlAKltPVFuxGy9/F7vlddxdAxx8s9Y/2P0ti7iibiqp4n2pSfDt0Ljce1kIadXaE1tpamuWzsm3RVrLg==;
	5:N1+uRQPj/e5FMbW/Othh4MZRPwvJfjtbugN2KXTOa70Z01jdB9ZnlKj0DpZEtq2ykiTGe8+IrcQeec6Xrftz3HPgJegGVNBvQlKRi6bigDE/6d9YcnrbVtUGjOo7PUEsZY5sBXHcyS6aM7AseLQGXg==;
	24:GfB7UE1H5jQuDVylL9FP6nnxcyxn1x+p1H9xqv+CnIX4p8O+bCROO+L+tHpRXrwBcjvFkmCIlgeK6p1+J6dEd09nJcCIqa/zkiy64D8cuG4=;
	7:ouMPJfYucFi3fOpAKNDfsCCIE2wVVusLFmbW018xF3qnTEBHYX39kNP+RvyS3WV9CODpFy9b0x3KLjml+FV+IFlQtkjd243v4KC4GxA+eH4juEaOoPTuGDPQFqfD+6MTaZ+7naC5XwrpKJMIXWIuWePSes8NUydD5BwwN2tnoPncRmF0atPtZlMfAsQWTgSZlRETOeBzUjuIGpK9ytx9+f4Y2fUJEh/ihNWRyca8K/35GW097ZY5WG3mYKJbvElN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2016 22:52:39.9176 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT046
Subject: Getting started with meta-ti (beaglebone)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 23:25:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

All,

I am trying to build for beaglebone but facing some errors on master 
branch. Maybe I am missing some configuration for the builds, can you 
please help me out

I cloned, poky, meta-openembedded and meta-ti master branch

source oe-init-build-env beaglebone

Added BBMASK = "meta-ti/recipes-misc" in local.conf

MACHINE=beaglebone bitbake core-image-minimal

Gives me an error

ERROR: Unable to parse 
/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
Traceback (most recent call last):
   File 
"/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/siggen.py", line 
151, in 
SignatureGeneratorOEBasicHash.finalise(fn='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb', 
d=<bb.data_smart.DataSmart object at 0x7fd9cd6f1b38>, variant=None):
              try:
     >            taskdeps = self._build_data(fn, d)
              except:
   File 
"/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/siggen.py", line 
104, in 
SignatureGeneratorOEBasicHash._build_data(fn='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb', 
d=<bb.data_smart.DataSmart object at 0x7fd9cd6f1b38>):

     >        tasklist, gendeps, lookupcache = 
bb.data.generate_dependencies(d)

   File 
"/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/data.py", line 
438, in generate_dependencies(d=<bb.data_smart.DataSmart object at 
0x7fd9cd6f1b38>):
                      if dep not in deps:
     >                    deps[dep], values[dep] = 
build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
                      newdeps |=  deps[dep]

....
....
='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/../includes/../includes/ti-unpack.inc'):
              code = compile(check_indent(str(node)), filename, "exec",
     >                       ast.PyCF_ONLY_AST)

   File 
"/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/../includes/../includes/ti-unpack.inc", 
line 51
     os.chmod(binfile, 0755)
                          ^
SyntaxError: invalid token


Any help is appreciated.

Thanks
Manju

