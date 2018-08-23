Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 311E9E00718; Thu, 23 Aug 2018 10:38:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F14CEE003C1
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 10:38:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NHcEki100053;
	Thu, 23 Aug 2018 12:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535045894;
	bh=X3ABmhHz44IUGfgxlfBsg9JJT72N0kPo8jJ/sY+hdjg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=u2i0XcJ+SVDrl8NtPwXjkOnHoiYvLld88EVJMgNJSl33uuCblUWFUqMFWYMfo2U4P
	hvLElM+3KnIqAuvS2wsG63x/TmpWLIH/rOkoNAOtXGUVuIske5oH3U1NC15N0quhkJ
	a52zd+N5R5xZhIQ6z9ogGDRBuG3zHEHiBJvXObuE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NHcEW9005203;
	Thu, 23 Aug 2018 12:38:14 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 12:38:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 12:38:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NHcDrb024547;
	Thu, 23 Aug 2018 12:38:13 -0500
Date: Thu, 23 Aug 2018 13:37:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Leo Meza <leo.e.meza@gmail.com>
Message-ID: <20180823173719.GV29422@beryl>
References: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: Getting Started with meta-ti "rocko" and beaglebone black (BBB)
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
X-List-Received-Date: Thu, 23 Aug 2018 17:38:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Check if your rootfs contains zImage and DTBs in /boot as well as modules in 
/lib/modules - I don't believe "minimal" image handles those automatically.

Alternatively, don't use "minimal" image, but rather "base" or a more 
specialized image.

-- 
Denys


On Wed, Aug 22, 2018 at 11:18:49AM -0700, Leo Meza wrote:
> I'm learning yocto and was able to easily boot my BBB with a
> core-image-minimal system using the meta-yocto-bsp layer. However, when I
> removed that layer and tried with meta-ti, I just see this on the Putty
> serial console, it repeats over an over:
> 
> U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)
> Trying to boot from MMC1
> *** Warning - bad CRC, using default environment
> 
> I'm copying MLO, zImage, u-boot.img, and am335x-boneblack.dtb to the BOOT
> (1st) partition of my uSD card. Then extracting
> core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd) partition of my
> uSD card. This works fine when using meta-yocto-bsp, but not with meta-ti.
> So, if anyone can help me understand what the different steps are between
> using the two different layers, I'd greatly appreciate it. Spent several
> days trying to figure this out so far.
> 
> Thanks in advance,
> Leo

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


