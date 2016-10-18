Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FEA7E00D4C; Tue, 18 Oct 2016 09:36:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F0E0E00D48
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2016 09:36:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9IGa3fQ019113;
	Tue, 18 Oct 2016 11:36:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9IGa2Gh027595;
	Tue, 18 Oct 2016 11:36:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Oct 2016 11:36:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9IGa2Rn002185;
	Tue, 18 Oct 2016 11:36:02 -0500
Date: Tue, 18 Oct 2016 12:36:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20161018163601.GX12745@edge>
References: <0ac2b27c-8987-9962-709e-589e8bca6d76@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <0ac2b27c-8987-9962-709e-589e8bca6d76@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Using PRU with BeagleBone and Yocto
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
X-List-Received-Date: Tue, 18 Oct 2016 16:36:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Oct 16, 2016 at 01:17:10PM +0200, Gary Thomas wrote:
> I have a PRU cape for my BeagleBoneBlack and would like to use
> it with a Poky/Yocto generated image.  All of the info I've
> found [so far] about the PRU is based on a raw SDK, not Yocto.

Well, our SDKs are based on Yocto Project, so all the info should still apply. 
But the problem might be with the cape part of it - may require editing dts 
files to get it working on BBB+cape...

-- 
Denys


> Are there any clues on how to make use of this (I've found the
> pru-iscc recipe so I'm hopeful)?
> 
> Thanks
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

