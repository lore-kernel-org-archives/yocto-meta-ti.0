Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C879E00994; Tue, 25 Sep 2018 10:09:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C488E007B3
	for <meta-ti@yoctoproject.org>; Tue, 25 Sep 2018 10:09:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8PH9Ukh129965;
	Tue, 25 Sep 2018 12:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537895370;
	bh=6tqJXooXxRaa19mPWErbGRYkK9+5mx6jKe+rZMq8p/o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fN+gQJvrN0XpnS4GA9Sf+hJ776BD0JvTnEdlQx/BIgrrGZS28nYkiyH8BN2Ze0Aeh
	Ttq/KaHQ83IYTC+ydFAtfHT6D1ceNPZ8lwvLcLd8qBVUX+SzbGBDZIwPCmAEKdV43h
	S7qAg7AwaJ+HgLFgDZaYm3jMR3jcPAp0LkydoYCw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8PH9Ubk025071;
	Tue, 25 Sep 2018 12:09:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 25 Sep 2018 12:09:30 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 25 Sep 2018 12:09:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8PH9TUp024207;
	Tue, 25 Sep 2018 12:09:30 -0500
Date: Tue, 25 Sep 2018 13:08:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Tsai, Matt" <matt.tsai@thermofisher.com>
Message-ID: <20180925170816.GI25477@beryl>
References: <BN7PR07MB4866C3E8727CE0B47C74E8E792170@BN7PR07MB4866.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN7PR07MB4866C3E8727CE0B47C74E8E792170@BN7PR07MB4866.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Unable to run bitbake -c virtual/kernel menuconfig
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
X-List-Received-Date: Tue, 25 Sep 2018 17:09:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

$ sudo apt install libncurses5-dev


On Mon, Sep 24, 2018 at 10:01:43PM +0000, Tsai, Matt wrote:
> Hi all,
> 
> I was trying to configure Linux kernel using Yocto and meta-ti layer: Poky 
> branch is sumo-19.0.0; meta-ti branch is sumo. I was able set up the Yocto 
> build system to build the core-image-minimal successfully. My build host is 
> machine Ubuntu 16.04LTS and the target device is Beaglebone Black. However, 
> when I tried to customize the kernel using "bitbake -c virtual/kernel 
> menuconfig", I got the following error:
> 
>   GEN     ./Makefile
>   HOSTLD  scripts/kconfig/mconf
> scripts/kconfig/mconf.o: In function `show_help':
> mconf.c:(.text+0x914): undefined reference to `stdscr'
> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
> checklist.c:(.text+0x2c): undefined reference to `wmove'
> checklist.c:(.text+0x4c): undefined reference to `acs_map'
> ...
> scripts/kconfig/lxdialog/menubox.o: In function `print_arrows.constprop.0':
> menubox.c:(.text+0x3c3): undefined reference to `wrefresh'
> collect2: error: ld returned 1 exit status
> scripts/Makefile.host:111: recipe for target 'scripts/kconfig/mconf' failed
> make[3]: *** [scripts/kconfig/mconf] Error 1
> .../build/tmp/work-shared/beaglebone/kernel-source/Makefile:512: recipe for target 'menuconfig' failed
> make[2]: *** [menuconfig] Error 2
> Makefile:146: recipe for target 'sub-make' failed
> make[1]: *** [sub-make] Error 2
> Makefile:24: recipe for target '__sub-make' failed
> make: *** [__sub-make] Error 2
> Command failed.
> 
> I wonder if anyone has the same issue and how to solve this problem. Please help. Thank you in advance!
> 
> 
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


