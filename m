Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3044DE0056A; Thu, 26 Jun 2014 12:22:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE186E0043B
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 12:22:18 -0700 (PDT)
Received: by mail-qa0-f46.google.com with SMTP id i13so3122961qae.5
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=o5mvXCTISQVCGhtWZeANrw3+Bb35EvIpqDihw5DUjqM=;
	b=OOEZYC38CfnJCfgRYqWH5s5nbBMOUr5noXoZgBkGH9NpRMhFfYi09GGBvSjc2Fl0L9
	1CCpvsD0z0XUI0eGk/kSfLWySAa3I11l/pG/fXkQlZMQUc7jsFoql1AdhzoOrLbpp6/J
	kzVHzK7K3Gik6OY33ZuFiSA9QKcMVku4oX2WuuTk1pWVEIxkjiVr+D9rdAEIK3OWNfi5
	TF8Ea3NaEaLJlgVfoD5PkYcoAi4wvnda+OWCyKWQ3BeqebkOQNmCi1wT3b6ONQC5gxse
	R0FLgCgqjQjfM31FUjcJJfJldognuGOqJxfumFXC2YVmn8k9e2Ap4JQWkoOpl3RgpwyK
	vtEw==
X-Received: by 10.224.2.196 with SMTP id 4mr16293753qak.60.1403810537923;
	Thu, 26 Jun 2014 12:22:17 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id q10sm12608987qah.9.2014.06.26.12.21.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 26 Jun 2014 12:22:15 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 26 Jun 2014 15:22:01 -0400
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20140626192201.GP9006@bill-the-cat>
References: <1403712632-26072-1-git-send-email-denis@denix.org>
	<20140626133045.GN9006@bill-the-cat> <20140626173148.GB6700@edge>
MIME-Version: 1.0
In-Reply-To: <20140626173148.GB6700@edge>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: disable SPL/MLO processing for omapl138 SOCs
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
X-List-Received-Date: Thu, 26 Jun 2014 19:22:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2014 at 01:31:48PM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 26, 2014 at 09:30:45AM -0400, Tom Rini wrote:
> > On Wed, Jun 25, 2014 at 12:10:32PM -0400, Denys Dmytriyenko wrote:
> > 
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > index b326aa1..9da6f7d 100644
> > > --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > @@ -25,3 +25,6 @@ SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> > >  
> > >  SPL_BINARY = "MLO"
> > >  SPL_UART_BINARY = "u-boot-spl.bin"
> > > +
> > > +SPL_BINARY_omapl138 = ""
> > > +SPL_UART_BINARY_omapl138 = ""
> > 
> > omapl138 is am18xx right?  SPL supports that.  The only issue is that we
> > need to ship u-boot.ais which is a combo image.  If I'm looking at the
> > right branch, the problem(s) right now are we don't use the right config
> > target (da850_am18xxevm_config is what we want) and UBOOT_SUFFIX to
> > "ais" (in the omapl138.inc file).
> 
> What's the difference between da850_config and da850_am18xxevm_config? The 
> first one is what we used previously. Is the second one set ups the building 
> of "ais" image?

The difference between a "da850 evm" and "am18xx evm" is where the MAC
is stored, da850_am18xxevm picks it up from the right place.

> As of UBOOT_SUFFIX, with hierarchical inclusion of different .inc files, it 
> would be overwritten if defined in the machine config. Usually we end up 
> specifying it in the machine-specific u-boot recipe. Let me take a look at it 
> and see if we can move that var to the machine config...

Right, I'm referring to the machine.inc file here since it's a SoC-level
thing rather than a machine-tweakable thing.

-- 
Tom

