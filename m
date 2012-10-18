Return-Path: <tim.bird@am.sony.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe005.messaging.microsoft.com [65.55.88.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 134C3E003D6
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 13:22:26 -0700 (PDT)
Received: from mail233-tx2-R.bigfish.com (10.9.14.245) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Thu, 18 Oct 2012 20:22:25 +0000
Received: from mail233-tx2 (localhost [127.0.0.1])	by
	mail233-tx2-R.bigfish.com (Postfix) with ESMTP id 83783D000C0	for
	<meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 20:22:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:160.33.194.231; KIP:(null); UIP:(null);
	IPV:NLI; H:usculsndmail04v.am.sony.com; RD:mail04.sonyusa.com;
	EFVD:NLI
X-SpamScore: -1
X-BigFish: VPS-1(zzd6eah4015Izz1202h1d1ah1d2ahzz8275dhz2fh2a8h668h839hd25hf0ah107ah1288h12a5h12a9h12bdh137ah13b6h1441h1155h)
Received-SPF: pass (mail233-tx2: domain of am.sony.com designates
	160.33.194.231 as permitted sender) client-ip=160.33.194.231;
	envelope-from=tim.bird@am.sony.com;
	helo=usculsndmail04v.am.sony.com ; .am.sony.com ; 
Received: from mail233-tx2 (localhost.localdomain [127.0.0.1]) by mail233-tx2
	(MessageSwitch) id 1350591743989987_14442;
	Thu, 18 Oct 2012 20:22:23 +0000 (UTC)
Received: from TX2EHSMHS011.bigfish.com (unknown [10.9.14.235])	by
	mail233-tx2.bigfish.com (Postfix) with ESMTP id EDA096800AD	for
	<meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 20:22:23 +0000 (UTC)
Received: from usculsndmail04v.am.sony.com (160.33.194.231) by
	TX2EHSMHS011.bigfish.com (10.9.99.111) with Microsoft SMTP Server (TLS)
	id 14.1.225.23; Thu, 18 Oct 2012 20:22:21 +0000
Received: from usculsndmail13v.am.sony.com (usculsndmail13v.am.sony.com
	[146.215.230.104])	by usculsndmail04v.am.sony.com
	(Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with ESMTP id
	q9IKMKUO015110	for
	<meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 20:22:20 GMT
Received: from mail1x.sgo.in.sel.sony.com (mailx.bc.in.sel.sony.com
	[43.130.1.112])	by usculsndmail13v.am.sony.com
	(Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with ESMTP id q9IKMJOK022803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=FAIL)	for
	<meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 20:22:20 GMT
Received: from [43.135.148.222] ([43.135.148.222])	by
	mail1x.sgo.in.sel.sony.com (Switch-3.4.2/Switch-3.4.2) with ESMTP id
	q9IKMIVe032735	for <meta-ti@yoctoproject.org>;
	Thu, 18 Oct 2012 20:22:19 GMT
Message-ID: <508064FA.5050701@am.sony.com>
Date: Thu, 18 Oct 2012 13:22:18 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
X-OriginatorOrg: am.sony.com
X-Mailman-Approved-At: Thu, 18 Oct 2012 13:30:04 -0700
Subject: Dependency on packagegroup??
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
X-List-Received-Date: Thu, 18 Oct 2012 20:22:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I'm just getting started using the meta-ti layer, and
on my first build for a MACHINE="pandaboard", I got this error:

$ bitbake core-image-minimal
ERROR: ParseError at /a/home/tbird/work/yocto/meta-ti/recipes-ti/packagegroup/packagegroup-ti-test.bb:5: Could not inherit file classes/packagegroup.bbclass
ERROR: Command execution failed: Exited with 1

Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

I have my BBMASK set to "meta-ti/recipes-misc"

The README says that the layer depends on
git://git.openembedded.org/openembedded-core

In looking at the dependency on packagegroups, it looks like this is only referenced in
meta-ti/recipes-ti/packagegroup/packagegroup-ti-test.bb

If I'm not interested (currently) in the test packages, can I just remove or
rename packagegroup-ti-test.bb, or add it to BBMASK,
rather than install the openembedded-core layer?

Will this break anything?

I'd like to keep my setup as minimal as possible.

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================


