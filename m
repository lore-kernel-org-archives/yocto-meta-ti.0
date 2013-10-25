Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07457E01719
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 01:08:55 -0700 (PDT)
Received: from ad.chargestorm.se (212.20.242.100) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 25 Oct 2013 10:08:52 +0200
Date: Fri, 25 Oct 2013 10:08:49 +0200
From: Anders Darander <anders@chargestorm.se>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131025080849.GB8552@ad.chargestorm.se>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: meta-ti/arago support for TI8148
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
X-List-Received-Date: Fri, 25 Oct 2013 08:08:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

I've got a customer using a dm8148 SoC, and though I'm not yet tasked
with helping them with the build system (I've got some lower level task
I'm helping them with), I suspect that it's just a matter of time before
they ask me to help setup their build environment.

I know that there was a commit in ~April that removed TI8148 from
meta-ti, stated that this machine were no longer supported. However,
from that commit message I can't really conclude whether it was
supported and working up until that, or if it had been non-functioning
for quite some time.

Has there been working support for TI8184 in meta-ti (i.e. after the
move to a oe-core based setup)? Or is the last supported version found
elsewhere?

To summarise my question; what's the latest version that
supports/supported the TI8184? meta-ti, meta-arago, arago, or where?
I'd be happy for any pointers regarding this. 

Thanks in advance!
Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

