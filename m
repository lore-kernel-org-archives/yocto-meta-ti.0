Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F8E3E00D04; Wed,  3 Aug 2016 10:40:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.37.81 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0081.outbound.protection.outlook.com
	[104.47.37.81])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0019E00CE8
	for <meta-ti@yoctoproject.org>; Wed,  3 Aug 2016 10:40:12 -0700 (PDT)
Received: from SN1NAM02FT001.eop-nam02.prod.protection.outlook.com
	(10.152.72.57) by SN1NAM02HT195.eop-nam02.prod.protection.outlook.com
	(10.152.73.49) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.8;
	Wed, 3 Aug 2016 17:40:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; ti.com; dkim=none (message not signed)
	header.d=none; ti.com;
	dmarc=bestguesspass action=none header.from=xilinx.com; 
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT001.mail.protection.outlook.com (10.152.72.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.567.7
	via Frontend Transport; Wed, 3 Aug 2016 17:40:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:57409
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bV09J-00066K-El; Wed, 03 Aug 2016 10:40:09 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bV09I-0005Ie-Je; Wed, 03 Aug 2016 10:40:08 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u73He7gN001327; Wed, 3 Aug 2016 10:40:07 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bV09G-0005FZ-Mi; Wed, 03 Aug 2016 10:40:06 -0700
To: Denys Dmytriyenko <denys@ti.com>
References: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
	<20160801233449.GI3677@edge>
	<fe415fd4-f9c9-faa7-61aa-d0e33d26ac78@mlbassoc.com>
	<72940363-f223-78b1-2b0e-0663fdd4510e@xilinx.com>
	<20160803172810.GB17623@edge>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <cfe98310-dd21-dadb-2989-5f418449a48d@xilinx.com>
Date: Wed, 3 Aug 2016 10:37:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160803172810.GB17623@edge>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22490.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(377454003)(69224002)(199003)(189002)(24454002)(377424004)(47776003)(87936001)(65806001)(189998001)(31686004)(4001350100001)(110136002)(64126003)(76176999)(65956001)(63266004)(305945005)(77096005)(230700001)(9786002)(2906002)(106466001)(356003)(4326007)(7846002)(50986999)(92566002)(586003)(31696002)(54356999)(23746002)(50466002)(8676002)(2950100001)(36756003)(19580395003)(81156014)(8936002)(81166006)(86362001)(83506001)(33646002)(93886004)(65826006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT195; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT001;
	1:OJM/WmOoDiZ1J1UIE2f8G9SozgndTnmD4+0oH/VfDPzjZUmFhM1Y2TEloGTJweoTq6moqrb9ypiKcwa4qAXuUfE2XZdzlOf1ThrlTJgGUGXbiCJ4t9GNJs+hMbJ8fa8bqQLlblQ2pWXKN0nBGuPSDyQbXSkk1sHAGCvhQAw/mKMvGKYx604l19MZggaLpww7ZF32t8m52N4OVQ5mwINf9aF+WCIHXarSrvo7O56uCUZ+gl6XuvXEqWpvfXvF6TFGZv6MEJ8WtwjEWpY7WLSNcIagaoklKFw82WcFVB+T81P6ueFABuj51wqHSMkXD48P2rH7kv0gGoLytXqsQcLuT/aELmxyDPeTGiqqC5z7npWkg9ZHrw4UyLpBiYuRCJm6xcuAUmMFFMFDHZUKaOmBZiqDYCkCHzDctqWk7reX6vln6tv6UGVeEASIWEf2y/qToR7T+zNZ+Q8xIqK1/gk6oCg/5xZtkB7ElexaqUMutRdnryU6YXoqe+DGfU0AP3J1+SdS/L3WbJlwB2HhrnGtnwqtWvFJ3SlVXiO8UoyhOLISR5e7rE7xUVTVNFm2kbuZ
X-MS-Office365-Filtering-Correlation-Id: c67ff3b7-86cd-4a55-948e-08d3bbc53757
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT195;
	2:VX8iZzF5sHgrMw43c5E50GP94yDfFazv0PWnuwrfZFaR36Xnxoa4p9Of7KG5gYi/O131iymVdhn7OPwosOewOkX/v85J/K6EY8+qTptSgK72GuiUd+Ggue/+LPtAtyZfEF97x/MiUSs1UsW+MNqN3rbU3CcbCXfdlGLhWq8LNYbcI18GzsYslV91MoxMCQez;
	3:rG0Lk/ahyNwAC1Bw2xhbzsRJIvwUHlaghoxa5hpFW8Vss+IeH/1UcUGpNk0WS0WWyvtDM3uZMKhSLpdMjm7Tu2jELYPhNK2fjj3/9zkBsOn5LxWW4/BxEbW2zFlA8v4VHx/rISRTkBqwfF/vqBvozjLJDa/S2TPB1z+rFFIPYiglE7v99Pm6NlaZWhGQM0i4RVSD3R5SJXvbMXEcvAD9Q4TZM3qoANeNmB1dQxfSYXIsXujXTN5vLrM5CzP7KMkO6KqUdzfeJWTsGfXAfWyJgg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT195; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT195;
	25:FJEUxdPZVXR4KVVCu5bCjjeqGPExrZUsG6WNEUO7M9oNLuYJ/Z37FI5S4tdYmbli3MLQnPS5bD0fat69egTYT8SDId9L/DqvqhEACi1mx2iMav6roJTElws5snovDujonQYMAYd5qM9AGOn3QFUX3F/ZSd9ppBL/MnhSr7+lXFs4zafj5LIZncUtsA7Q38xxCeCMfsor7crpU4Y+s4IMy5CZ3fL4npD6Nxj3f6FcaQzgDOBMQVAMTzv4f13QIsqv6iDrq+kiCjsnbvdnpL7eZ4W28XGFEgNJwADcROwQ9qHGD5IQwL4LIYuEKvx7p4il9X3YGyriuZHS6lMAu/5NP7ObTpOr+9HjdFEsggV9NaB84rXZHzYH57dja5aHlUDK8GLTambCiGuxAt9v626B5cO7v0za5u2FiWBUj22rOvhYcMLzELDTITUL50Q1v31CtgnFkkzxdfLSZ6+mRE6xGcv8BmzbjFDwwr48awx1ljOhzEwFm+21cKHmjJ1VoPncVG/bYH/MJD3MFTZdx2bOQRrrWY0ilI+Me4DFBHseHPVefLaqaBWK6OV2OlPb4ab+pWKeq1fBS18aWpRnjohL9Dp4gKrhq55rZmtL5uB2id/P4HTuCkulVh9TBfceuAOlregV4TTQx7x81JebY4HkGNyp/wCEHVF5H2pRfvCWNS/60NMd/1Yndz6sirr0DMVAfCvQXre55cGDeiZfn0mgbVxsH9Rjzpld6PuQl7EnxYAAqZYeZxSdNX9CtoyP0eba26NcXWayXWejGH8wKXOvXIQ7cuVl7QF1rb+CU0hBjvI=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT195;
	31:9rlIYklIIge/hnDL2CBkEoi5MmgDryjkxfqU4GmcR4ciznX2TYBd/RpFtIUWvgY2btOsgCwzqYaYhVUmT/t/lvJ/SPcoonL7RqY11LOQ3wveBlbpL4mNSmEN8C2mp0gNhXxveL+kp7sEom/HcPOoDG9fSV/B7ETvOJOkG4GxhYOHZBjoLAD8ZKEGR34F7sKRLjOV1z1cfgDUVqH6Xrtg3m2zRdIwlnSmCK0b3MmjDB0=;
	20:tBPs1lSc7xSUrfKITuXkZMikGsCZUYGLenoYekuGHtcU+vHmbH8mB1HziOQKQSTuHN44PznMSLp+wQpZ3nh1yyh3jSm+ZGBYcXeEVh4hoFDM/yg/b7h8bhIvIskT4rLUszUnqo9ZA2YhckE1AIj4NZ97jjdCo7df8LMqihh5HOc9Ik7acO6x5nnUUg2Lx6SOYHGiMgRMlV5Zuy0ZVMHeJy9E1Ys/H7gEeZMOvlrPPAnzVaN8qBIDY6fMs3ybClooWJSv4rZ/58tedQDPoaNrSUPlhDimcKBqnlcmm1sWiKh+uQ+ZjmqBf3vVhFND2Jrx6GRLHD2Kqui/W/aSXXl2Jk9idP1C17lHRg25wSuNRc2n0eDKYT2F2MfkExB6za/0F/ERbF8/wssdV0IPiRXPvOwcwyZd+cobyuRhMFWUZyi1F6lvR+o7JQyTMJHYmxLXHRqnkXxThRTqe6nLKISZCdCN4Cr345EOcLbelVdiQFDVApbvG/SNpn7JNWIAEXUV
X-Microsoft-Antispam-PRVS: <88101e99133d4399a0fe9ea401783b4f@SN1NAM02HT195.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(5005006)(13023025)(13018025)(13024025)(13017025)(13015025)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT195; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT195; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT195;
	4:3gU0uFo86DrbObv066CapmeLopZfqm6NtljLWTZ1WCgmjBHeLjVsRgOJMQ1mJX40u0nyCZELqkSjptnsKNjVq8TC9ZGSTOm40CqQ/BoaSy4V8D16/e1qz+EyZRme8vHhyBItoWMC14aAqlvwH+8ly7u1aYqkNBfIDQr1qi3EhYINNlCSA4ccAhA6IJpfbQ1H01ap/5SfHRk/3ch7KojLI3lOfOGzG0OeNlG9uSyNMtDRjZfw5A8N9DjVSSctCBOkUAUydBQR3M4Rk5ZDY42Q0E+EQ1eNYOcbSPwFn835XUXFhKKbXLeFKG6LNvmgQOe5UWgqPiS6KjDl+d98Is4yQ/0C4Qr4WRQITJLDhxCQO3utPPDehKQ9rta8Jwq88f0musHDqi0NXVMgtoQUmKyxyBSOlFsLfeIS/yzmZIw/cb/hQZma6RvvoYS1OJuwd5q38THUst/OU0tUkSsAMYow5IbuU3vTlK08buKmIwAaOxT2RVb5rbpwFmU63UnhHv6l
X-Forefront-PRVS: 00235A1EEF
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; SN1NAM02HT195;
	23:ddT8SN5iyXIUfT832ilr1gYyqsfX2hRkVTHVY?=
	=?Windows-1252?Q?QyhJV/773FYHZlaLTB6s6CjfjED07MgdJpNG41aY0/ZMumuzyq91tvxQ?=
	=?Windows-1252?Q?6uuhR1dUuDrfnW8y9sixJQXHK9uQV86C+EmZa+Onrxy1bso3w8MSaMNF?=
	=?Windows-1252?Q?MqqdxePfasieJJWr6i1cfb5NRVuHmvBBwWQMVnBK5558csBr5sR0k5mn?=
	=?Windows-1252?Q?z9kjdLfnKG39zEqNcx7Oel2dwfcM+i8Ooml1YuW33zYSnqpG7uwysJGo?=
	=?Windows-1252?Q?oQvst0laZywTbiezYAH9FHexKz7K0kBmH0u2e8XtZf+AUVghPoRfENNU?=
	=?Windows-1252?Q?AvfHqjPVPN8RqRk3VEx5bt/oUxJBeCA+cqtewLKrCl7cvme/D/Bvuolx?=
	=?Windows-1252?Q?CHR6rpweEdFrzDYsbTbxUCqmzBYO9XWtYsF4v/0Krn3hGE6ht4MwZsW+?=
	=?Windows-1252?Q?p9ATNqb1BFSLFxg4R/Ch5dNIs+hNkpQjKYuIEtKH2ZWVE2T7aeKdFlAz?=
	=?Windows-1252?Q?TuA0eeWs0QymWq3z6oVL2dpzciATjbDvjunO/Q/HjxqOrjmboOGaM5Sy?=
	=?Windows-1252?Q?EWRbPwGlKU/pwqFlUY1YVf6wS2yFI2GM5nDH9LN39uOUvGhTMfxYibYW?=
	=?Windows-1252?Q?wrwP1wrAxTGmcSNXk8I/FoECoZaaVWYQC3Agd2MAYIhC6FXddU5wOzlO?=
	=?Windows-1252?Q?woAkBV9jkn72I6fEIbdiee8cNws9vHxXDXfXJ9e8zf9dFBS9l24N9qbU?=
	=?Windows-1252?Q?hqs7QeXNAtSwGxPl+XK7BvKPvV6xafGqeRd+l9U1LNgrnduAhyDTyd/O?=
	=?Windows-1252?Q?XP9zxbW8/d+txHJmSq8QT7a6mFQNv6+7sV7L7rA/8i4epsd+ORrKp1VG?=
	=?Windows-1252?Q?fahjBbQSZQKUxVHfM0yTsDQ/roKwAyENFth5uaG8pQwnO3t/tFHu2U7u?=
	=?Windows-1252?Q?G6SV72Tnbmy4sFVhoMuqn2qwiU0dGVETok597HaGrHKQEGr6uoBsB4Sa?=
	=?Windows-1252?Q?fAP0RdIIAI+jhAHKPhEmDjJiS/J2OYI+UBGJbRkijs9VdmFB0VV1obqq?=
	=?Windows-1252?Q?QE1IczV1Op/1QhwJH2tmWr0+K/be7jP33YUXqlmuUIw0n2csWJFlQFUV?=
	=?Windows-1252?Q?0g/zwxK+laWi5xrUNY3Zv/K6b10UAmgl2PMa5x2hKmvMShBDZ2V0cQH2?=
	=?Windows-1252?Q?fqFjEYpoDqauEn5nyKlN89aLZo4I35Xc2DlPKpIU/LHIa8qlNyNputG9?=
	=?Windows-1252?Q?xtjk42DMi0Q5UxuE0YEii1q1x3ZKztTStep+VrYiUDDoMqx3ZGnm7fug?=
	=?Windows-1252?Q?cI3xWEmbMx+wSPz1Jt8i8d9deYCYL/AcpKJK2G+mIFASLS5rtC3+li2B?=
	=?Windows-1252?Q?e+MSPLCrldw?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT195;
	6:n4/0vtGla6sYo0R0go8FDjSZAHjoF5ACoyqiUjh4CNvs/60e2gyjZzcomvA4DvEx/JFZfYsSXhFtCpmHRpyrnbAVtTW2FcJvlJYm8smmN41Iv4wyMgDXbgO06FjggKFdDYiPEJdk4ET7lYbHuMUfBCmivsbCk2UyDhvQ5i3jtHvwaxXWXEJ5ytkyOZpRvS6Z3eS085uaLCJMHms+eJtqQGYhSuEjbMMQQHgwaQ3z9KG7X4spOvfecONgxMtgFxHBFMZ9Kz8Fjkn2GpK5BreZedpD1hcAAYts+q+dyATRr6aKvwCRH8T7mqcOerjrTFYlh9q8TitoZSEWWL67ghIGxQ==;
	5:Ws6tbfGxGG2sazDOU1Brs5LyCERYk/flWFaf6FWBaCyx+9k7VuCWySZwZCci8sIpbEmjUXM7i773PVde5Az+bojQbhJsH6Xoc+oTpWvdMbnCINVdtuAtgaDCJDT9SU4N/aYTl5jP8P9DwlrPiGWU5g==;
	24:Om0bAKkx+rMCTB24dURpEB8pDk8jV5qtniVfYatO12C8S/IYAranHyLNRHtUCRTcFn9PrhTeZBflo0zCjzJGnCv3pJvA4/u1qm9NZLZ0Ql4=;
	7:0gfn//3PPK7EBBoMK2SW3oW4WMMqKQokwKmL8vmWX9t4QgX1F4tO+JN94rFiw5pmvq6ytEoqwcrMeG45KbYzsHUEH9+rYyOT6R9WzN66Lu0fdjdI4pKCtuqbf6QmY3xRm0weXcewYLKuxDD7hdL1M+R3/PNLH8uyKX8EKHD9h2dbtHZwsg9w6tuozitP1Vn9UjsiR0ufbaVo/sAhpRrY/cSw/jTXhG+1xK1kQ1QhZTCaAAJR5JiAaZT0oAoJlDVE
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2016 17:40:09.9091 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT195
Cc: meta-ti@yoctoproject.org, Gary Thomas <gary@mlbassoc.com>
Subject: Re: Getting started with meta-ti (beaglebone)
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
X-List-Received-Date: Wed, 03 Aug 2016 17:40:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/03/2016 10:28 AM, Denys Dmytriyenko wrote:
> On Tue, Aug 02, 2016 at 11:17:35AM -0700, Manjukumar Harthikote Matha wrote:
>> All,
>>
>> On 08/01/2016 07:12 PM, Gary Thomas wrote:
>>> On 2016-08-02 01:34, Denys Dmytriyenko wrote:
>>>> On Mon, Aug 01, 2016 at 03:49:37PM -0700, Manjukumar Harthikote Matha
>>>> wrote:
>>>>> All,
>>>>>
>>>>> I am trying to build for beaglebone but facing some errors on master
>> <..>
>>>>> Added BBMASK = "meta-ti/recipes-misc" in local.conf
>>>>
>>>> What's this ^^^ for?
>
>> This is not required, I copied it from a wiki page (getting started
>> on meta-ti)
>
> I don't know what that wiki is or how old it is, but there's no recipes-misc
> in meta-ti... It's not a good idea to collect random outdated tidbits on the
> Internet and try to get it all working...
>
Agreed :)
>
>>>>> MACHINE=beaglebone bitbake core-image-minimal
>>>>>
>>>>> Gives me an error
>>>>
>>>> Are those Python3 related errors?
>>>>
>> <...>>>
>>>>> line 51
>>>>>    os.chmod(binfile, 0755)
>>>>>                         ^
>>>>> SyntaxError: invalid token
>>>
>>> In python3 this needs to be 0o755
>
>> Yes this works and fails on a tar extraction command. Another
>> Python3 error, will look into it. For now, I just deleted the
>> extraction block to surpass the error.
>
> Yeah, that was my other question - why master? There's currently Python3
> migration going on upstream and meta-ti is slightly behind on this. I'd
> recommend using krogoth stable release to get your stuff working. You
> should only be playing with latest master code, especially with several
> additional layers, only if you really know what you are doing...
>
I was working on a patch to OE-CORE for u-boot. I got a pushback stating 
beaglebone was not working on master. So I started on master, however I 
did verify my patch on Krogoth as well(both works and build u-boot using 
outoftree source code). Didn't realize beaglebone also existed in 
meta-yocto-bsp, now i have verified in all the possible combinations for 
beaglebone :)

Thanks for all the help, much appreciated

Thanks
Manju

