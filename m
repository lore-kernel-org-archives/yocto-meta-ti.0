Return-Path: <gleym-meta-ti@m.gmane.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 348AEE0096A; Wed, 20 May 2015 19:10:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00, DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (patholdn[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [80.91.229.3 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.0 DKIM_ADSP_CUSTOM_MED No valid author signature, adsp_override is
	*      CUSTOM_MED
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.9 NML_ADSP_CUSTOM_MED ADSP custom_med hit,
	and not from a mailing list
X-Greylist: delayed 903 seconds by postgrey-1.32 at yocto-www;
	Wed, 20 May 2015 19:10:15 PDT
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93E4DE005B9
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 19:10:15 -0700 (PDT)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gleym-meta-ti@m.gmane.org>) id 1YvFhR-0000Rr-JO
	for meta-ti@yoctoproject.org; Thu, 21 May 2015 03:55:05 +0200
Received: from c-24-62-41-121.hsd1.ma.comcast.net ([24.62.41.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 03:55:05 +0200
Received: from patholdn by c-24-62-41-121.hsd1.ma.comcast.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 03:55:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: meta-ti@yoctoproject.org
From: Patricia Holden <patholdn@gmail.com>
Date: Thu, 21 May 2015 01:49:13 +0000 (UTC)
Message-ID: <loom.20150521T033353-266@post.gmane.org>
References: <4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
	<5550FD98.1050507@windriver.com>
	<CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>
	<55521DB8.2070606@windriver.com> <20150514220801.GD20022@denix.org>
	<CAFZh4h9=cJG8aVbwvh_NjR24UTnCj9A44zHPs3rqEn_rdCfN3A@mail.gmail.com>
	<CAFZh4h-r1_gabVP0HdDoOrcT_neED51JpMmm586KLuc_efWdFg@mail.gmail.com>
	<CAFZh4h8qX6hYJ_kA4Ny=K7YqGnECu_nX1Jkejj=3P8saYmCH2g@mail.gmail.com>
	<CAFZh4h9oJ3UZFt2b_3SHB1xi99M+rEWis12-VU2gQxMQ9sVBsA@mail.gmail.com>
	<CADkTA4Px0rhNzfPsjcNN5Bq4sKZujkPDwnJfxq5dsKRc7=G0Aw@mail.gmail.com>
	<555B6573.5030002@windriver.com>
	<CAFZh4h_LtR6s08XtL78uD0WUA2DM_8xuzOCEaCF5rCDe7tqFng@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.62.41.121 (Mozilla/5.0 (Windows NT 6.1;
	WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152
	Safari/537.36)
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 -	kernel-abiversion missing
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
X-List-Received-Date: Thu, 21 May 2015 02:10:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I'm new to this project and environment, but do have some input on this 
problem.  I've 
been running into the same issue and trying to get my image going so 
that I can get a bootable image ready for a client by next week.  I have 
tried using linux-dummy and creating my own "linux-xxx" to try to get 
the problem resolved.  I always end in the same failure.  I looked at 
STAGING_KERNEL_BUILDDIR using "bitbake -e core-image-minimal |grep 
STAGING_KERNEL_BUILDDIR.  It is set correctly to my linux-build 
directory and I see the abi version file in my linux-build directory 
too.  In the error log, however, the path being accessed is not the 
STAGING_KERNEL_BUILDDIR. It's looking for the abi version in 
$HOME/poky/build/tmp/sysroots/ags0-qemux86/pkgdata/kernel-depmod/kernel-
abiversion.

I'm now contemplating just going with the yocto-linux and then adding a 
patch in my bsp recipe-kernels to try to get around this problem.

Any thoughts or suggestions are most appreciated!



