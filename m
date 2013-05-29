Return-Path: <Mans.Andersson@nibe.se>
Received: from bmail.nibe.se (bmail.nibe.se [193.15.255.103])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D18CE014BF
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 07:19:19 -0700 (PDT)
X-AuditID: 0a0201f8-b7fb96d000002bc1-05-51a60e64a240
Received: from mail.nibe.se (nivm100.nibe.se [10.2.0.100])
	by bmail.nibe.se (NIBE mail) with SMTP id 54.C2.11201.46E06A15;
	Wed, 29 May 2013 16:19:16 +0200 (CEST)
Received: from NIVM101.nibe.se ([fe80::2db2:7275:360:31db]) by nivm100.nibe.se
	([fe80::d0f4:a5ac:8015:ae67%16]) with mapi id 14.02.0342.003;
	Wed, 29 May 2013 16:19:15 +0200
From: =?iso-8859-1?Q?M=E5ns_Andersson?= <Mans.Andersson@nibe.se>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: am335x-evm nand flash support
Thread-Index: Ac5cdVT/raxSTPXhRJq7MhcdMF+Lzg==
Date: Wed, 29 May 2013 14:19:14 +0000
Message-ID: <9271A7A786434844A19F14A6050530257A54569F@NIVM101.nibe.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.21.2]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsXCxcSQopvCtyzQ4NNefout7X0sDowe7Sf6
	2AIYo7hsUlJzMstSi/TtErgy5u9Yxlawkavi69qrjA2M5zm6GDk5JARMJHYe2csIYYtJXLi3
	nq2LkYtDSGAxo8SfxwuZIZwNjBKvXv9lAqliE3CQ2DivmRXEFhGwlHj/8T0biC0soCbxvH8S
	UAMHUFxbouewIUSJnsSqPddYQGwWAVWJid0XwFp5Bdwk9m17zApSziggK/F3A1iYWUBc4taT
	+UwQ9whILNlznhnCFpV4+fgfK4QtL/Fg6VM2iHo9iRtTp0DZ2hLLFr5mhhgvKHFy5hOWCYzC
	s5CMnYWkZRaSlllIWhYwsqxi5E3KTczM0cvLTErVK07dxAgOaMYfOxjnbtY8xCjAwajEw7uG
	bVmgEGtiWXFl7iFGCQ5mJRHeVMGlgUK8KYmVValF+fFFpTmpxYcYmTg4pRoY5XY+ytgiZ1F1
	aNvcvzILLvgdvVbFeOHW3tIZL904Yvwnuy+Vy98v+KX9k2+oV1GdnsWTvJMbDskst3f5aWWc
	/fW1y6qjay/PvP9g0aZz28seSfE8aZh5ovRwxi175S8+BlxLbO4fUY69sOjBqkdcHIuXTDFs
	fzAjauOB01rbd81OCvF50vx6u7YSS3FGoqEWc1FxIgBHCB0qRgIAAA==
Subject: am335x-evm nand flash support
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
X-List-Received-Date: Wed, 29 May 2013 14:19:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
It seems that the linux-ti-staging kernel does not have support for nand fl=
ash on the am335x-evm board. I have tested both the default ti2013.04.00 ta=
g and the latest from the ti-linux-3.8.y branch on the ti-linux-kernel* rep=
ository without luck.

Searching on google gives me the following patch for the linux-omap* kernel=
 https://patchwork.kernel.org/patch/2624081/. Applying this patch (and the =
other two from the same series) on the ti-linux-kernel does not work either=
, there is probably some driver missing or configuration needed. Is there s=
omething trivial I've missed, or should I try to compile the linux-omap ker=
nel with the above patches instead?

It seems that the linux-ti-staging kernel was not ready for prime time when=
 it was selected as the default kernel for the am335x boards. Since the boa=
rd bring up process differs between the 3.2 and 3.8 kernel (device tree) it=
 would be really appreciated if there were working configuration examples f=
or the development boards supplied by TI. Does TI have a public roadmap of =
when the 3.8 kernel will have full support for their own boards?

Thanks,
// M=E5ns

*Ti-linux-kernel: git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
Linux-omap: git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap=
.git

