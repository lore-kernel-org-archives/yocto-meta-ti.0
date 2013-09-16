Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A300E01500
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2013 04:43:36 -0700 (PDT)
Received: from ad.chargestorm.se (95.209.48.89) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 16 Sep 2013 13:43:31 +0200
Date: Mon, 16 Sep 2013 13:43:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130916114328.GA11490@ad.chargestorm.se>
References: <365E1805BC95084CBE82381A0B869994DE507B25@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B869994DE507B25@EU-MBX-01.mgc.mentorg.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: build errors for beangleboard
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
X-List-Received-Date: Mon, 16 Sep 2013 11:43:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Ahsan, Noor <Noor_Ahsan@mentor.com> [130916 10:30]:

> I was using meta-ti master branch with master branch of Yocto. While
> building beagleboard I faced following issue


> ERROR: Nothing RPROVIDES 'u-boot-fw-utils' (but
> /home/noor/SB/master_external/
> meta-ti/recipes-bsp/u-boot/u-boot_2011.12.bb RDEPENDS on or otherwise
> requires it)

> Do we have its fix available on master?

There's no fix yet on Yocto master. I've submitted a fix to oe-core,
though it hasn't been merged yet. 

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

