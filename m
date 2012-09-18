Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD794E002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:31:19 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8I0VIhP025367;
	Mon, 17 Sep 2012 19:31:18 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8I0VIsE024587;
	Mon, 17 Sep 2012 19:31:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 17 Sep 2012 19:31:17 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8I0VIHG002179;
	Mon, 17 Sep 2012 19:31:18 -0500
Date: Mon, 17 Sep 2012 20:31:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120918003117.GA1708@edge>
References: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
	<C65364BD-A83A-4A63-AEC3-3DAC96A979B3@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2B3E93@DFLE09.ent.ti.com>
	<81DF8557-307C-43CF-9E46-4CA3F7C41A30@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <81DF8557-307C-43CF-9E46-4CA3F7C41A30@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "r-monk@ti.com
 meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] libgles-omap3: Add new 4.06.00.02 version.
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
X-List-Received-Date: Tue, 18 Sep 2012 00:31:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 04, 2012 at 10:28:19AM +0200, Koen Kooi wrote:
> >> * Add a new version of the Graphics SDK. There are a few changes in 
> >> the  Graphics SDK that need to be investigated to determine if it 
> >> impacts  someone who is trying to use X11. This recipe should work 
> >> fine  for non X11 users. Therefore, the DEFAULT_PREFERENCE will be -1 
> >> until  it is clear that X11 users arent negatively impacted and any 
> >> needed  changes in libgles-omap3.inc are made.
> > 
> > What's the timeframe for such tests?
> > 
> > I plan on leaving the DEFAULT_PREFERENCE at -1 until we can ensure that 
> > X11 issues are sorted out. I am not even sure if there really is an 
> > issue.. All I know is libpvrPVR2D_X11WSEGL OpenGLES2 was being used in the 
> > 4.05 version but no longer exists in this newer version. The only version 
> > of libpvrPVR2D_X11WSEGL that exist is for OpenVG. I was told by the 
> > graphics team that libpvrPVR2D_X11WSEGL is deprecated and 
> > libpvrPVR2D_DRIWSEGL should be used instead. Is this a non issue?
> 
> Here's my limited understanding of the wsegl stuff:
> 
> X11wsegl is a 'dumb' way to make it work with x11. It will tell X11 the rect 
> coordinates to draw a window border and nothing more. The rendering still 
> happens to the framebuffer. No context locking, nothing.

> Driwsegl uses DRI for rendering and need a proper Xorg module to work, it 
> features locking and stuff so you can have multiple clients. 
> 
> Roger Monk had it working a few months ago on omap4, but I don't know what 
> he had to do to make it work. I hope it is as simple as rebuilding the 
> sgxkernel modules with SUPPORT_XORG=1 (actually dri) and installing the 
> binary Xorg module.

Roger,

Can we get some updates on the status of the new 4.06 Graphics SDK working 
with DRI? Thanks.

-- 
Denys

