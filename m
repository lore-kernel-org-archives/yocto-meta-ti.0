Return-Path: <michael@amarulasolutions.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 493DFE013E8
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:39:25 -0700 (PDT)
Received: by mail-wg0-f47.google.com with SMTP id j13so2583970wgh.2
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent
	:x-gm-message-state;
	bh=Vq6HUIvmdUvyU7ZWU4rgM+mplnp032bJZdD4QVrrigg=;
	b=Wmlk+do+areh0PXqxWLI8MvZiajJoTeefmw9/iECzSRSKRc4UJB3JyZk4+qDQsXwAK
	ecLmJEpPk53KBrR4gjP4EIwoyOBTClasK1wO5xgOnq29n0f1gU9feItkGNYKj11wK3+Y
	rKasWwYa3ChcMC5fjPWTo/0Rpyty2ZctFEmSTI0WUHIhiJ+CSsl148aJY7drlD8Lx6jb
	vgIMfgXzceovW9iJw34szChX6gMj5wkkZmkVSvv0zErf4d8rQSQLIIjXWaOEOWNOp/1s
	cy/UlSO7mIhEFhhVjXScfkIu8/P/mJDaEbrPXucYqgDHArlGNWft3OHbBDS2oBYvagqa
	VtqA==
X-Received: by 10.180.20.116 with SMTP id m20mr293361wie.46.1374611964980;
	Tue, 23 Jul 2013 13:39:24 -0700 (PDT)
Received: from panicking (net-2-39-208-255.cust.dsl.vodafone.it.
	[2.39.208.255])
	by mx.google.com with ESMTPSA id i1sm874563wiz.6.2013.07.23.13.39.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 13:39:24 -0700 (PDT)
Date: Tue, 23 Jul 2013 22:39:19 +0200
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20130723203919.GC10067@panicking>
References: <20130723200931.GA10067@panicking> <20130723202110.GB32068@edge>
	<20130723202417.GB10067@panicking> <20130723203737.GC32068@edge>
MIME-Version: 1.0
In-Reply-To: <20130723203737.GC32068@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQkDwqiEa1M28z7Fg2RWd1PA9nDqngEatpVH3lB+PJ6CEoOMcISbGWEaDwzKMr2uF6BjZuEc
Cc: meta-ti@yoctoproject.org
Subject: Re: Unable to compile am180x-evm + gstreamer-ti
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
X-List-Received-Date: Tue, 23 Jul 2013 20:39:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On Tue, Jul 23, 2013 at 04:37:38PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 23, 2013 at 10:24:17PM +0200, Michael Trimarchi wrote:
> > Hi
> > 
> > On Tue, Jul 23, 2013 at 04:21:11PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Jul 23, 2013 at 10:09:31PM +0200, Michael Trimarchi wrote:
> > > > Hi
> > > > 
> > > > I was having trouble in compilation of am180x-evm. The problem is that
> > > > I have this error:
> > > > 
> > > > Nothing PROVIDES 'ti-codecs-omapl138'. I'm using HOB right now and I
> > > > have included meta-ti repository. Any hints?
> > > 
> > > But am180x-evm is the platform without DSP, so you shouldn't use gstreamer-ti 
> > > with it.
> > > 
> > > -- 
> > > Denys
> > 
> > http://www.ti.com/product/omap-l138
> > 
> > Is there a reference platform for this cpu?
> 
> Actually, am180x CPU is the same exact one on the ARM side as OMAP-L138, just 
> doesn't have DSP:
> 
> http://www.ti.com/product/am1808
> 
> Currently, there's a SW gap in meta-ti on the DSP side, hopefully it will be 
> closed in the future - there was some activity and discussions on the mailing 
> list and internally... No promises yet.
> 

Any patch around to cookup the bb file?

Michael

> -- 
> Denys

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |

