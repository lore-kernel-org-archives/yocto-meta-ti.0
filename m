Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DEE19E00A0A; Wed, 22 Mar 2017 12:50:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A706E0094C
	for <meta-ti@yoctoproject.org>; Wed, 22 Mar 2017 12:50:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2MJoYm4010229;
	Wed, 22 Mar 2017 14:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490212234;
	bh=5W1mDLRnLibUU9/111qptGsbU3RSKyLi3BJvrcojnRo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=d5PYnB8gLCSayvbxpbjFXylp9koLHT1VzIyguEWnNTCidjqWKZNfLtBaY0ffznhwc
	ZmdvfpGqK/LJg75+ET4V+Xily16KX6z96p3qaZNKA0YWi8Lea6VZc5bCL04T9q4f4X
	YL/7WN41YfZzW5cBqTMgHSP6OO8MJ2OXz/wASSLE=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2MJoTso018259;
	Wed, 22 Mar 2017 14:50:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 22 Mar 2017 14:50:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2MJoS9S010441;
	Wed, 22 Mar 2017 14:50:28 -0500
Date: Wed, 22 Mar 2017 15:50:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Glenn Schmottlach <gschmottlach@gmail.com>
Message-ID: <20170322195027.GB29187@edge>
References: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
	<20170320155459.GP14484@edge>
	<CAMS2kBE1mvJT5y=WiL1YvLY6-sdkCdZDvLMLL=i4wOqxA7QxXw@mail.gmail.com>
	<20170320201516.GD23524@edge>
	<CAMS2kBHk15OszF0wTbLKyKGG6j+pv2dnm7oC28F2YF1htpebBw@mail.gmail.com>
	<20170320210801.GB24585@edge>
	<CAMS2kBF=V3pk9dy6zruOTtyYX=Ajsm-jvkFLJjA2xfn+KTrOHw@mail.gmail.com>
	<20170321174523.GA25961@edge>
	<CAMS2kBErBWJj19WOM+5K=40h22zqypdLxS1N6UfFK=kgva3fUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMS2kBErBWJj19WOM+5K=40h22zqypdLxS1N6UfFK=kgva3fUg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Trouble modifying defconfig for linux-ti-staging_rt recipe
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
X-List-Received-Date: Wed, 22 Mar 2017 19:50:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 22, 2017 at 03:41:22PM -0400, Glenn Schmottlach wrote:
> >
> > Looks good... Can you try moving your defconfig into "ti33x" folder?
> >
> > recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> > recipes-kernel/linux/linux-ti-staging-rt/ti33x/defconfig
> >
> 
> You're a genius! ;-)
> 
> I moved the defconfig into a ti33x sub-directory and it appears
> bitbake now uses my defconfig instead of the (default) one. So at
> least now I have two approaches for configuring different kernel
> options: replace the defconfig with my own or use fragments for
> surgical strikes.
> 
> Thanks so much for your help . . .

You are welcome. It's interesting that file overrides are still in play and 
take precedence with bbappends... Need to keep that in mind.

-- 
Denys

