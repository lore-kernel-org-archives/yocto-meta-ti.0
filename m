Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD7E4E0056D; Thu, 26 Jun 2014 13:16:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40F42E0043B
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 13:16:08 -0700 (PDT)
Received: by mail-qc0-f169.google.com with SMTP id c9so3670379qcz.14
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=w50wt4blcTyfGHOEH0loTUL7qo6zOk8JH+ojh8dxEKY=;
	b=VvKNqIFGzbOef2HD66Tgm4y4c2VFMAzQYjZnoEWG4gjm4x3OSvHyISLXOMwu+Hov1R
	FDMJTQvgIBUvR6apbWY0Nq7OBKHNAGi9X9L9a0rFLfLLEIm5NtjAEkNVio0ux4U23T/o
	4PMY0mr5MbLR2UD9nHlp+c//ExvtXdat3JKTYXzP27AL8edj5fXVNHpruk15Ir6y6m5r
	yKskUPcqFVa2ATRz8Nd647TMAtKR4GAIck5fciyuK4Ao5isLJF+qXyxQDG4TeUgDQnCX
	jG2Qlv9kEoTLkauNlr8XU1UalAby5CJWc/rDb6D5iLHahRPQWjzEAWQvwZLKVnqbBzMs
	IKlw==
X-Received: by 10.140.87.225 with SMTP id r88mr23794877qgd.75.1403813768330;
	Thu, 26 Jun 2014 13:16:08 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id a7sm12808023qay.15.2014.06.26.13.16.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 26 Jun 2014 13:16:07 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 26 Jun 2014 16:16:09 -0400
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20140626201609.GR9006@bill-the-cat>
References: <1403806695-6302-1-git-send-email-denis@denix.org>
	<20140626193101.GQ9006@bill-the-cat> <20140626195150.GC6700@edge>
MIME-Version: 1.0
In-Reply-To: <20140626195150.GC6700@edge>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] u-boot: switch from SPL/MLO to "ais" image for omapl138 SOCs
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
X-List-Received-Date: Thu, 26 Jun 2014 20:16:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2014 at 03:51:50PM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 26, 2014 at 03:33:20PM -0400, Tom Rini wrote:
> > On Thu, Jun 26, 2014 at 02:18:15PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > Cc: Tom Rini <trini@ti.com>
> > > ---
> > >  conf/machine/am180x-evm.conf         | 4 +++-
> > >  recipes-bsp/u-boot/u-boot-ti.inc     | 4 ++--
> > >  recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
> > >  3 files changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
> > > index 3182e8a..f83814e 100644
> > > --- a/conf/machine/am180x-evm.conf
> > > +++ b/conf/machine/am180x-evm.conf
> > > @@ -5,7 +5,9 @@
> > >  require conf/machine/include/davinci.inc
> > >  require conf/machine/include/omapl138.inc
> > >  
> > > -UBOOT_MACHINE = "da850evm_config"
> > > +UBOOT_MACHINE = "da850_am18xxevm_config"
> > > +UBOOT_SUFFIX = "ais"
> > > +
> > >  UBOOT_ENTRYPOINT = "0xc0008000"
> > >  UBOOT_LOADADDRESS = "0xc0008000"
> > 
> > Since we've got ENTRYPOINT/LOADADDRESS in here which also are omapl138
> > rather than am180x specific, that's OK with me.
> > 
> > > diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> > > index c024e96..0cb53ea 100644
> > > --- a/recipes-bsp/u-boot/u-boot-ti.inc
> > > +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> > > @@ -1,3 +1,5 @@
> > > +UBOOT_SUFFIX ?= "img"
> > > +
> > >  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> > 
> > This isn't completely safe, is it?  The COREBASE version also has ?= for
> > UBOOT_SUFFIX too.  We need to either convince oe-core to use ??= or just
> > populate our machine.conf/soc.inc files with UBOOT_SUFFIX.
> 
> That's why I moved it before require COREBASE, as otherwise it will be 
> set there...
> 
> So, if machine defines own UBOOT_SUFFIX, our .inc won't overwrite it and 
> COREBASE version won't either. If machine doesn't define one, we set it to 
> "img" here. And for recipes not using our version of .inc, it will be set to 
> "bin" in COREBASE .inc

I would have sworn the reason ??= was added was that what you describe
isn't always safe even if it looks like it should be, in all cases.  If
you're sure it's fine, OK.

-- 
Tom

