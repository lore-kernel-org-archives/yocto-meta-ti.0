Return-Path: <jfabernathy@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32FA1E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 15:11:15 -0800 (PST)
Received: by iagz35 with SMTP id z35so4270455iag.35
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=FJyppSqrRDvWu/nxht0W4pO8m9HFOHPmkzF/mBo6PWI=;
	b=k80kiH4B/2wBYloPOv37TDGCM4I5bCN6OI4C8ydkLDouLe1q/DMWcQfLnMi9y4Wdl6
	+1VNnJ8KroKFF7+9KEmkK2HPRsL8dhHsKm9knE9g7my/UhBXxRVKOoIRNLPs7uUClLHV
	zSSGt3v1PlrTvhM7qxM3kQclDhvcdj8efl0xQ=
Received: by 10.42.157.65 with SMTP id c1mr5456638icx.42.1328829073166;
	Thu, 09 Feb 2012 15:11:13 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-54-223.dhcp.embarqhsd.net. [184.3.54.223])
	by mx.google.com with ESMTPS id vr4sm7370742igb.1.2012.02.09.15.11.11
	(version=SSLv3 cipher=OTHER); Thu, 09 Feb 2012 15:11:12 -0800 (PST)
Message-ID: <4F345291.5010202@gmail.com>
Date: Thu, 09 Feb 2012 18:11:13 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <4F33BE16.2080802@gmail.com>
	<C07F39F8-891A-4122-A6A6-844C5EA55C09@dominion.thruhere.net>
In-Reply-To: <C07F39F8-891A-4122-A6A6-844C5EA55C09@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: build error on machine omap4330-panda
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2012 23:11:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 07:53 AM, Koen Kooi wrote:
> Op 9 feb. 2012, om 13:37 heeft jfabernathy het volgende geschreven:
>
>> While trying to build core-image-sato for machine= omap4430-panda, I'm getting a build error a good ways into the build.  My bblayers.conf file just adds meta-ti and my local.conf is standard with the following key lines:
>>
>> MACHINE ??= "omap4430-panda"
>> BBMASK = ".*/meta-ti/recipes-misc/"
>>
>> The error I'm getting with bitbake -D -v core-image-sato is below and I've attached the log.do_compile_perf file.
>>
>> Anyone know the fix?  Not sure the all warings being treated as errors message.
> Like I said, follow the instructions in the README. That sets up the right toolchain for everything *and* it sets up things to support 3d and multimedia.
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
So if I follow the instructions you are referencing 
(http://www.angstrom-distribution.org/building-angstrom), where do I 
clone the setup-script repository.  I assumed in the poky directory 
along with the other Yocto/poky stuff.  It seemed to work sort of, the 
virtual/kernel built, but I tried an image from Yocto called 
core-image-sato and it failed at klib.  This may not be a valid image to 
build.  I assumed that virtual/kernel is not a complete image, just the 
kernel. I'm trying to do what I would with Yocto and that's something 
like core-image-sato.

Where did I go wrong.

Jim A


