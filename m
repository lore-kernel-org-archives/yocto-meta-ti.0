Return-Path: <ashok.palaniswamy@lntinfotech.com>
Received: from p01c12o144.mxlogic.net (p01c12o144.mxlogic.net [208.65.145.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B91F0E00868
	for <meta-ti@yoctoproject.org>; Sun, 12 Jan 2014 21:18:57 -0800 (PST)
Received: from unknown [202.54.134.175] (EHLO
	chninmsedge01.chennaiodc.lntinfotech.com)
	by p01c12o144.mxlogic.net(mxl_mta-7.2.2-0) over TLS secured channel
	with ESMTP id b3773d25.0.158807.00-384.387392.p01c12o144.mxlogic.net
	(envelope-from <ashok.palaniswamy@lntinfotech.com>); 
	Sun, 12 Jan 2014 22:19:06 -0700 (MST)
X-MXL-Hash: 52d3774a5ab0b548-cb651889f5930fb0a2a97502d7fead4f445ca323
Received: from chninmsedge01.chennaiodc.lntinfotech.com (172.29.23.55) by
	chninmsedge01.chennaiodc.lntinfotech.com (172.29.23.10) with Microsoft
	SMTP Server id 8.2.176.0; Mon, 13 Jan 2014 10:46:17 +0530
Received: from CHNDSSMGR.chennaiodc.lntinfotech.com ([127.0.0.1]) by
	chninmsedge01.chennaiodc.lntinfotech.com with Microsoft
	SMTPSVC(6.0.3790.4675);	 Mon, 13 Jan 2014 10:48:49 +0530
Received: from chninmshtcas02.chennaiodc.lntinfotech.com ([172.29.23.3]) by
	CHNDSSMGR.chennaiodc.lntinfotech.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 13 Jan 2014 10:48:49 +0530
Received: from POWINMSSCRDR.pwiodc.lntinfotech.com (172.29.23.17) by
	chninmshtcas02.chennaiodc.lntinfotech.com (172.29.23.3) with Microsoft
	SMTP Server (TLS) id 8.2.176.0; Mon, 13 Jan 2014 10:48:49 +0530
Received: from CHNINMSMBX01.chennaiodc.lntinfotech.com ([169.254.1.127]) by
	POWINMSSCRDR.pwiodc.lntinfotech.com ([172.29.23.17]) with mapi;
	Mon, 13 Jan 2014 10:48:49 +0530
From: Ashok Palaniswamy <Ashok.Palaniswamy@lntinfotech.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Jan 2014 10:48:48 +0530
Thread-Topic: How to build Yocto project for AM3517EVM
Thread-Index: AQHPEB7wpf32Q8FTIkGDxnfgECr9YQ==
Message-ID: <127A5335E8FA314589D708E59E33891D2F5AD5D043@CHNINMSMBX01.chennaiodc.lntinfotech.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
Importance: normal
Priority: normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Jan 2014 05:18:49.0488 (UTC)
	FILETIME=[F0F7F900:01CF101E]
X-AnalysisOut: [v=2.0 cv=fthrkiEf c=1 sm=1 a=LrHhkUKorLktj/F6MHbgQw==:17 a]
X-AnalysisOut: [=7zWe_ivwxWwA:10 a=MHmriYiyTdgA:10 a=BLceEmwcHowA:10 a=Ikc]
X-AnalysisOut: [TkHD0fZMA:10 a=tP0R5P8-AAAA:8 a=8LsZ6xR87z0A:10 a=EsvbMRzz]
X-AnalysisOut: [AAAA:8 a=hv683PU7cdheZiY09MQA:9 a=QEXdDO2ut3YA:10 a=5wWboV]
X-AnalysisOut: [6KwKgA:10]
X-Spam: [F=0.2000000000; CM=0.500; S=0.200(2010122901)]
X-MAIL-FROM: <ashok.palaniswamy@lntinfotech.com>
X-SOURCE-IP: [202.54.134.175]
X-Mailman-Approved-At: Fri, 24 Jan 2014 14:25:34 -0800
Subject: How to build Yocto project for AM3517EVM
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
X-List-Received-Date: Mon, 13 Jan 2014 05:19:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Class: urn:content-classes:message
Content-Transfer-Encoding: quoted-printable

Hi All.

I am working for AM3517 based custom board. We are planning to use yocto =
for our development. Please let me know how to build yocto for AM3517evm =
board.

Is there any wiki or steps by step to build yocto project for AM3517evm =
?

Thanks,
P.Ashok.

The contents of this e-mail and any attachment(s) may contain =
confidential or privileged information for the intended recipient(s). =
Unintended recipients are prohibited from taking action on the basis of =
information in this e-mail and  using or disseminating the information,  =
and must notify the sender and delete it from their system. L&T Infotech =
will not accept responsibility or liability for the accuracy or =
completeness of, or the presence of any virus or disabling code in this =
e-mail"
*************************************************************************=
=0D
 This email and attachments have been scanned for=0D
 potential proprietary or sensitive information leakage.=0D
 Websense Data Security, Protecting Your Information from the Inside =
Out.=0D
 www.websense.com=0D
 =
*************************************************************************=


