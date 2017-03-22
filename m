Return-Path: <gschmottlach@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24E63E0094C; Wed, 22 Mar 2017 12:41:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (gschmottlach[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.172 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.172 listed in list.dnswl.org]
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0A08E0094C
	for <meta-ti@yoctoproject.org>; Wed, 22 Mar 2017 12:41:23 -0700 (PDT)
Received: by mail-yw0-f172.google.com with SMTP id v76so134007038ywg.0
	for <meta-ti@yoctoproject.org>; Wed, 22 Mar 2017 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vr00dQqsbENzzTGbbm28nwmRa47B+YhNlVFvtKfnxeo=;
	b=Dx9HvkLC8FRC9xRuDZK6tF0n2TodU6nWtXK0S4saZ2Xz0Aj9bxUvJ1Suj77Qac4Szz
	r3lpccgiDIBmtLauV4rL1l9eHqsOFnBGf3RSIjkkmHcIXz4FHb9T4ZUqUoa5uR9qE2Fj
	odYAo+GwUnfxKEoWlXC0A6yJINgRr9AGcKgg2b198h89EP8Ct6BuuOfJshnhHry9hNDc
	LdjJIPqJYIJX/jeruGGtPS+Hc2/w35+Z13txd2J/TkxypERYCfJ7BVUivKmv3dO9z1pX
	IMibTQnaqUZnYbyHrHS2fdTYi9GVXQOh2XUN7wFSgIrluSg+sP/78FuPnaUH9eW4Fa9u
	RBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vr00dQqsbENzzTGbbm28nwmRa47B+YhNlVFvtKfnxeo=;
	b=dmfDOAqabY8Xxwi56ffmfXfiBwFe+yN34fGz/3nkc6P84uAUOhhnmSkxPUvRHDhP0Q
	yAKSNv9jJSDisvKJi8md3VQJSmnaZvZg1EFmZDdAjpqJ+P3WCmGEXIyl6W9LyFO3aikJ
	jUcs8terBMRBc56g94VMpfmiPgsbjh6/XixEErg0j35frWqe9lFBS8ZDs8b6izYxH8jj
	Rf16FCD8STvFlpTHD51B28yopA8nBXO0QFFYmXElhjXMuCzSDLZBSUoOHxvRFAmhLVY+
	f4g4v6Il+aCWNa8PWydPkSaLHVC7vguO5KfwUPVpNkHoHEY9JkCU3cAq+Awfm6dbUfVL
	Gk5g==
X-Gm-Message-State: AFeK/H19ojqospjuQAPTKkfXrNY+Wq5e8wkgImFKOKszRum9755dKlProca0EsHDXVjuwWjLHHDqJ4qthGA+SQ==
X-Received: by 10.129.131.210 with SMTP id t201mr24634077ywf.47.1490211682529; 
	Wed, 22 Mar 2017 12:41:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.95.139 with HTTP; Wed, 22 Mar 2017 12:41:22 -0700 (PDT)
In-Reply-To: <20170321174523.GA25961@edge>
References: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
	<20170320155459.GP14484@edge>
	<CAMS2kBE1mvJT5y=WiL1YvLY6-sdkCdZDvLMLL=i4wOqxA7QxXw@mail.gmail.com>
	<20170320201516.GD23524@edge>
	<CAMS2kBHk15OszF0wTbLKyKGG6j+pv2dnm7oC28F2YF1htpebBw@mail.gmail.com>
	<20170320210801.GB24585@edge>
	<CAMS2kBF=V3pk9dy6zruOTtyYX=Ajsm-jvkFLJjA2xfn+KTrOHw@mail.gmail.com>
	<20170321174523.GA25961@edge>
From: Glenn Schmottlach <gschmottlach@gmail.com>
Date: Wed, 22 Mar 2017 15:41:22 -0400
Message-ID: <CAMS2kBErBWJj19WOM+5K=40h22zqypdLxS1N6UfFK=kgva3fUg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Wed, 22 Mar 2017 19:41:24 -0000
Content-Type: text/plain; charset=UTF-8

>
> Looks good... Can you try moving your defconfig into "ti33x" folder?
>
> recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> recipes-kernel/linux/linux-ti-staging-rt/ti33x/defconfig
>

You're a genius! ;-)

I moved the defconfig into a ti33x sub-directory and it appears
bitbake now uses my defconfig instead of the (default) one. So at
least now I have two approaches for configuring different kernel
options: replace the defconfig with my own or use fragments for
surgical strikes.

Thanks so much for your help . . .

Glenn

