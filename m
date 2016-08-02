Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A01EE0093B; Tue,  2 Aug 2016 11:34:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.37.76 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 847 seconds by postgrey-1.32 at yocto-www;
	Tue, 02 Aug 2016 11:34:49 PDT
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0076.outbound.protection.outlook.com
	[104.47.37.76])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEE36E00874
	for <meta-ti@yoctoproject.org>; Tue,  2 Aug 2016 11:34:49 -0700 (PDT)
Received: from CY1NAM02FT036.eop-nam02.prod.protection.outlook.com
	(10.152.74.52) by CY1NAM02HT099.eop-nam02.prod.protection.outlook.com
	(10.152.74.208) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.8;
	Tue, 2 Aug 2016 18:20:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; mlbassoc.com; dkim=none (message not signed)
	header.d=none;mlbassoc.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT036.mail.protection.outlook.com (10.152.75.124) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.557.8
	via Frontend Transport; Tue, 2 Aug 2016 18:20:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUeIx-0003bY-8l; Tue, 02 Aug 2016 11:20:39 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUeIx-0005e6-An; Tue, 02 Aug 2016 11:20:39 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u72IKb7M010727; Tue, 2 Aug 2016 11:20:37 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUeIv-0005dq-JM; Tue, 02 Aug 2016 11:20:37 -0700
To: Gary Thomas <gary@mlbassoc.com>, <meta-ti@yoctoproject.org>
References: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
	<20160801233449.GI3677@edge>
	<fe415fd4-f9c9-faa7-61aa-d0e33d26ac78@mlbassoc.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <72940363-f223-78b1-2b0e-0663fdd4510e@xilinx.com>
Date: Tue, 2 Aug 2016 11:17:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <fe415fd4-f9c9-faa7-61aa-d0e33d26ac78@mlbassoc.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22488.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(377454003)(189002)(199003)(377424004)(24454002)(189998001)(586003)(83506001)(8676002)(33646002)(76176999)(36756003)(50986999)(54356999)(2950100001)(63266004)(23746002)(356003)(81156014)(7846002)(8936002)(230700001)(92566002)(305945005)(19580395003)(9786002)(86362001)(11100500001)(106466001)(77096005)(107886002)(4001350100001)(50466002)(31686004)(31696002)(65806001)(81166006)(47776003)(2906002)(87936001)(64126003)(5001770100001)(65956001)(65826006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT099; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT036;
	1:yuInWsPxjx2ZYaF0DCEZYviNzBqCFqKhisSYJOerfsbKe6HzfRmBLpWjl17EGTaVZvk7TijdpWicV+H5xHGUPJF+3ROQ6R8U6nCwp8+7OVCzLDGw01Buboy8cO7uhETMRZ8KyJMemrTRMKvSh32aDtTfNocYreNRj4z0yJX32AykHOkc5pSqivkyI2JRU4vegdW5Wbso89HS3v1y4Eve4RdEqN7mnJglsxB8mAGK+LQZqqeAYEzXlaKKsoGZp+2m3GPUZPfkprnVoSoL/swvnvCSFavnKjaqJzwbb269bLrPNjdaIcg9emAah7kjt4xI6hNjPeMluQW7gOy++fUQTug9TEw5n74xHMr0Ivt5A6D8qetlKwNMa+XjVuDX7Upq6fl8Y4+0ioxGi+IwRgEChfnDP9mD+ff86H7Uun/ajbooxsLt15xrAeStH968YMH/mYdAMf7Z1M17xfhOHaqL0rLkF/U7yXkwem9Ya2TC74gtma27+nVtI90oTY8HHMZQL2mGcf9c4XMPeWkZoLhkNju1uin/F2L+Vtv8gXwBSCyg0qc/LjbezvfnS35MdvuF
X-MS-Office365-Filtering-Correlation-Id: 5345f70b-8d54-4890-a9c6-08d3bb01b572
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT099;
	2:92lNuI0LyYEIwi+SmC+MhEKd7Rr19s1xk6iM5Mo+HyjDrSdBE5yEsnBz00GsCUn6oMB6sqkkAK78P2DGA4wEFCqJlAG+mAizU6c03cg/PFWHrzjrCWeJp3DohMoc3UASAuSlFghCV7jLpLZ7iYPwQ5JX5+bUAsunmp5ll6yXls2n6O7PSMCrYxio7RJBsfqk;
	3:2m1sNEh3gYwPPm4HIabsswasZQPG5+n1YbQ/N7gI3d08rZI68qR3NmfKILOyyN9U/zZL9yTacP11iBXyiETIVMA711Sfr4Zfg3+NiKJm3yiUs6loyqGAh8IfR3rZ85ZeKNMy8ETmyLFfKLxvIzV1q7pdDWrUjV63rxPZn4sxSiKsCrfXcmnG2YWbH8UhDDAp0igkOaSQbFjg1diw2vJTy3c0q/YT8UMjnbRawZc+/3kTWnEuOn+5m03bdznUqcIhVLSkAUGCjjEt2Tlb4auELg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1NAM02HT099; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT099;
	25:aCAPOCi+mDQcA5lkpccfy6FswjDvP/h3D2ylFpdZLhr4UZv4MNjihzxzJTN+jJmZgoWfUXh9ar5TOCASaBQYqInSjh8Xq9GoQE/CuWXV6p4IkqhjQtJa8KJOxqdAGBE8hGsZNW+K0bnuNnQPTLMQeer0qN0PMgI2PluPxlIUrPGHPXO/3Pu1g1AcGbYk0TFPmhaAchM9nwXVt7TQz3oQC2lXl1tq2Jm7GSieLKroJhzeKNFqy1Ys96Zyu3ncfmifx27P11Fj8qNBz/yQne6x2f74ejTpWHEhvHj7FvUy6Dru1x6fTFkFK2SN/kiyZI/I80RobC0V19ziaWoI3/2kR77iyP8AwXNFfB3I0JCrnsKNZfLs59MR+xgLeHiT4Vu2DcOfHIVkc1eGr/RiQqU59DIBcFeK35hWyWklXKOBM1BiuM0ucHCXZto6QksC4xUZ0g2XVf2SSaQQWZFe+LASQPxtDBZO1TU4ItJgQgf/aa01kzGdTVEX7Za6t+vjb6ghDxc4JyLGHQSOhMW3TJwBbO9iotHrU/LM2s0t8GcyoWOOluC8mijATCwuITxuQLH5/3uG1dzt/x1nALlRdKXe6Z1KWRMKa2fTRhg3NAbhR8/ZyBZEQkWnEQtZDfNm0AzXBKP8siYkT5aZX5VojWdCKSEZwQ7lFdj/79vfSgQnqAsTU6uLzs4YohouiTBsb+a/kFGF2YdoWUyrMvKbGQwu8PlEkeJ2jxDHy/alr4mTK3wG0QoUo0ET12sukLLsjQDSRxFK7c1Cg0dy5m35eX6aDw==
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT099;
	31:+ZeEn7RAsi+3urvSd41ND+fNl5DCdkLxjWnoYWiZ9Mb4bwlzWqT9wiCyh1T+4NE8SnWO3Iu6+54P8Nj0YwaHW4F0b/+tp+/71ArdZiRBg+BZ+LfWeXGNnKzwy5jbv4qBKXomKIi5sAJtX1pDx66Q1E4VDA62HRsx6FCIZB/ntefHcGEc5R/4lgv3fzA0o39fTRlxdt6pwSw1Omh0jKsmed8e5fUfxa98l8PamUGl/Hk=;
	20:R5pLYfczXMJM8mZSyKT5461acSg4bAGLB4u6HcYD/p5KEQh27wtG0Ofv8Tcab1eVh4n4cWG08qNNJcld6v2GTvEhJEJ+lkNj6gC+RI+G2yYnmLXfmIhgrr7ELk5dbZQ1sOB6zVhidiaYMRbE1Yoqt6AgThmBdHeZVE1wZ00RRFKDVDmc0nmYJnONC2y+JDbi8WSAYwMtRco3CEVqMyYz+q/arrn9L3cqxvX+ULYvyZeuCH87ow8I1f8MEg+cY6c0vbLwWV/cuqeZieuhJZ2759k6CYynmW7854tFFWNFt1qQ41Ajz6Y5CY5M+dHM6NbdtCqZymmhH41trFgUREPbrRVatpO3QCwiOO185eO96uGGEJ5k1rsd8gxgEWPJVHpXh8dFBMT3EKnVCGFF/Mfik9NrQi17qUsBnHv4a2Dv68uOyX1UA/x/GOmS2RsQZSuybjdHnfFOYGlErOyl63DGaLhw4fcMqGGbFXMQzJKdFPZemU6laqVucgKHEj9cvu8C
X-Microsoft-Antispam-PRVS: <ea74779c7b4e466db84784b7888d4d77@CY1NAM02HT099.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(5005006)(13023025)(13024025)(13015025)(13017025)(13018025)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT099; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT099; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT099;
	4:sTv2TOqHqaSSvDundUFW3loWBpjOXutUHn/Wscda/XK0Eg/M+NPdoB0fAy+BJx+BRFO9AorEKRF5mdeFfUoHX+r0rHIuacZIu8O6CM0dIbv7s4gsASQ0f4KDc8Q86anDrvmY9//18cCN6i/+zjGr3OI/UpZv/OIvLBlPDifXKxJx2UP/XaukMrBSorR7QhHwMMQKwgjA1BnOYXan57pxEG1xZ6fjkU0cQggHzy7FXj9lPLwBxJvDoNxxZtlhbVhCBcASDqDkwvYJi0+NkmsBqpEXg1IpnN6vsPapnit+a+DrAa9EwgjHBOBI/dbiIDCHKoNWPD/IpS9X8jTu3W7r/hKGsaqomDvtzo3j1pJtwllfwthcLPDSK+pIlXxj/3+0lRj67HGxSTx2CeTPtvjCpsb4s3Jpwtw4zjw1klUULgxrGEp72UmdlZYsCHXGbH71j+FgT3JiqME5c7uyqJLVWCR+yZhE3wAvbdrC0aPKL0e9T8frLAW3oNTc4SPC8NpP
X-Forefront-PRVS: 0022134A87
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY1NAM02HT099;
	23:tIWojl27zeoJuOhK9y7Wa56Xnv5Lr0DsUpX6B?=
	=?Windows-1252?Q?ujzA7LvQdM9/KdYfeHaOzH+z2XUoAgY7XW0eOJFYefYyUgspv/73KUyh?=
	=?Windows-1252?Q?tiRffO6GlMxdZeqe15y1jM0msumBUjEgzeai5P/ZJ1ZDutEqIl8GFZ1d?=
	=?Windows-1252?Q?HdOaP2T/cIvrrDMUQkvUzHufYCm0s+zRNu3ZesuwAux2o1bpXsOmkqre?=
	=?Windows-1252?Q?xAga68WfMo/bsTnwqYTNpzQrEmQtOWF3dY3u/EwdhNcKu0H5GD15LQ7M?=
	=?Windows-1252?Q?jfTYwxZAj3L8N5tBM72WhKvgFqBwnSrfUp9B58GRSy+Zh0FgCf4jSeCb?=
	=?Windows-1252?Q?EPohkUdRhW2culP0l9/IU3slnDUQ29yrb2mauApMCthgxV+gEXt8AcQU?=
	=?Windows-1252?Q?oKfCclVY8A1NP63IScbIegGd5UpgpMWMVZTbKX7xDZvVwmZlQCkRKHMo?=
	=?Windows-1252?Q?0hv1+GdmUaV9rNteEKEgQESbLOvve7XjtAW9IyPNebGOyjIAX9z7wvC1?=
	=?Windows-1252?Q?/m5bKG3WudBt9HxgPNO5htJVzUGKCfwW9+ykt3n5VRel1VYZPT+RX06k?=
	=?Windows-1252?Q?cNxmpOpNDGjEnoXG3W+sTNME/xS2Va2j4bTpTrfaOaHAmRzBhzNs/CLO?=
	=?Windows-1252?Q?RlW9crgTE5x9HqAxRIiw7q1SjhtykRBMrNufJYiQSdzVO/OOB53mprhS?=
	=?Windows-1252?Q?n+WO0P54fXieZ424eUP/6/sb9yTwRAl2i+ztagdmF57uU5SyrD6D3CBk?=
	=?Windows-1252?Q?pKtfIUObpnph0IbMZl1rZNHCaha5uxSmTTIVYGYMVvBH/0PBgXpXzOOF?=
	=?Windows-1252?Q?VChqh7aq4KSHZNm5OjcvGHZCzi/kQwb2ywEu2T2WkKEHMdZi9DYZ8tUy?=
	=?Windows-1252?Q?9l8s0EDpR9GsijnXMkpIvCrHjahJoytpK9j0fGGDGmSVDqwe4aECQJrz?=
	=?Windows-1252?Q?hMxv9aCFRmdkBrZ1z74klpWD/UusGOB7/A/FTl9yT+WnRQyYj9bntBgM?=
	=?Windows-1252?Q?8fgdehPBjoMsAjUMB/+fZxB+ujmBYh/Y6M7Ow6+qBe91nmZ0Q48ssk1l?=
	=?Windows-1252?Q?CtUDTU2MyWdInYfs/6o9KBrWn2nMJdxc05q0ik/KaYLO8bhl29OiEqLI?=
	=?Windows-1252?Q?b0XdkG0omPYGphJxNZOsVjyJSVrkLomcmcNl1UowNhVGLFjnw1rt/ze6?=
	=?Windows-1252?Q?ITHVdHaWyZfjB29jGrIp63jUQ6YdfSBSoTsvCQg2QKLW/XOjTTwoPym5?=
	=?Windows-1252?Q?UyQPw3ip53OWcqMFqx6rHjsYeCqRfDGvuqA4IMR4kWZ6pO3L2sc9i+GP?=
	=?Windows-1252?Q?k1z9uWCmHinwwDKurfOcPNSmg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT099;
	6:YUhZXQZ90gvZ9faWvMO45PZQaaVkL7jkfA7Gx2gR5dxaEPhfebNSePx505ZfN11qTypxE4A216GWcyVhID5SqTtMPhuig4GfZbRZGLUy3ZlVV7Dnui/fxZST0By+woIA6/pCmLidWAB08b//s2XVe3+EBAyyRMra+sITlajBCn2SUbNY+nBNUjngNziNljXAQ6ocB+JAQzb9f6oivwGL5A+eJ6sI8NyGJcgZn2khWJasDzB+EV7jkEkrMRDVZUSpzHWA+v5rAZEPY3Pd6TSoFAqyZouyvd12UbpDI2XEJoFmp/3pi9hI+bqS19qJ0kkEwaGNS5AlpxTT3Dk8u+8U4w==;
	5:UaGT8xpnwiAa1g2XRQh4T/oyel30ValIHg9xLvWcDy7sMyattQtKd6Vc4b59icTNJSy6rkWjUMIWBF+14JpEhIOwFse4zxjGVCK8UXQZhsqTRd2pRz82PnsNkQGfvEyqqVkhY9nW6G/t0Bsz0V46bw==;
	24:iTsv5ITFamqWWe7jir917P0O8roWJCVDxgLMCOuZscO6qUoLODHpMT0Ug4EdD9VYPYF6QtcxVBlPLnhxCONt35w4YnT8H50FRSRT9q4W1sg=;
	7:okO+NiimoKjyNlsucIwVSTS4e6UV09jWZEdwLw0ytuHq8SSxalzRLhDU9JajsbjT2fc9GJ/Z3xdYqm5ZmRbw8dj3BpeOvmS89gTsuhzI+Yy5JMJzFR35KaW2DLt+nOllEVisyTqW5xP6ujUL/Mttc1oywn1a2jTKYBZ7Kt14yG4ksw13bIHd62GVGuWkyImfc0wSBk5q6KQCn3w6qbwAi0/eIwsKCe4/6eN6w+Zas2PIi6LiJkyVlTA5HL7Rimk7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2016 18:20:40.0892 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT099
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
X-List-Received-Date: Tue, 02 Aug 2016 18:34:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

All,

On 08/01/2016 07:12 PM, Gary Thomas wrote:
> On 2016-08-02 01:34, Denys Dmytriyenko wrote:
>> On Mon, Aug 01, 2016 at 03:49:37PM -0700, Manjukumar Harthikote Matha
>> wrote:
>>> All,
>>>
>>> I am trying to build for beaglebone but facing some errors on master
<..>
>>> Added BBMASK = "meta-ti/recipes-misc" in local.conf
>>
>> What's this ^^^ for?
This is not required, I copied it from a wiki page (getting started on 
meta-ti)
>>
>>
>>> MACHINE=beaglebone bitbake core-image-minimal
>>>
>>> Gives me an error
>>
>> Are those Python3 related errors?
>>
<...>>>
>>> line 51
>>>     os.chmod(binfile, 0755)
>>>                          ^
>>> SyntaxError: invalid token
>
> In python3 this needs to be 0o755
Yes this works and fails on a tar extraction command. Another Python3 
error, will look into it. For now, I just deleted the extraction block 
to surpass the error.

Thanks
Manju


