Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEFA3E0141D
	for <meta-ti@yoctoproject.org>; Thu,  2 Aug 2012 15:37:44 -0700 (PDT)
Received: by yhfq46 with SMTP id q46so88934yhf.35
	for <meta-ti@yoctoproject.org>; Thu, 02 Aug 2012 15:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=MW48Rz+AaOkSt74OJSJqeeYugsYTUpZJotoIGvdx7Ck=;
	b=PsJcBiiqx+53TXL6VXL6RM0ACDLk6ONGXoFRYLU0tZetc/SIDqjwFHXZIpHrEo2Djk
	nqAQFfK7Zoen4wCU272o1/VzKC4tMI674S+fq5BoiYw1ZXECL5VpM61ymjtXldt7sHUs
	XkjQC5XMy1NTFvS84Kfjhic+6WvgSKX9SijEY6lChV1xo0drHxoUT84hnT1DCwtzY3Wy
	Q/qVSsm0Hts6sAfOEIBbRXHiN46NeFlt3QUEiqInZExswBbViuXXgnHdOQuTLn7R9457
	DHvcBEDqChrCHV7gvMIvCG0HpvjwWt2jTJGkLpiHkH5P2co957B04bk5t9K4FITXUBjK
	Kb4Q==
Received: by 10.50.237.72 with SMTP id va8mr6469348igc.17.1343947063436;
	Thu, 02 Aug 2012 15:37:43 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:e006:937b:1830:2cb])
	by mx.google.com with ESMTPS id fe7sm16336303igc.14.2012.08.02.15.37.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 15:37:42 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 2 Aug 2012 15:37:52 -0700
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20120802223752.GA13507@bill-the-cat>
References: <20120726013212.1F5DA52AA6@arago-project.org>
	<CC361C01.B0548%jdk@ti.com> <20120801191214.GD16076@bill-the-cat>
	<20120802220621.GD28560@edge>
MIME-Version: 1.0
In-Reply-To: <20120802220621.GD28560@edge>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Koen Kooi : u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Thu, 02 Aug 2012 22:37:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 02, 2012 at 06:06:22PM -0400, Denys Dmytriyenko wrote:
> On Wed, Aug 01, 2012 at 12:12:14PM -0700, Tom Rini wrote:
> > On Thu, Jul 26, 2012 at 01:57:27AM +0000, Kridner, Jason wrote:
> > > 
> > > -----Original Message-----
> > > From: Arago Project git <git@arago-project.org>
> > > Date: Wednesday, July 25, 2012 9:32 PM
> > > To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> > > Subject: [meta-ti] Koen Kooi : u-boot 2011.09+git: update to latest
> > > version	of Tom Rini's tree
> > > 
> > > >Module: meta-ti
> > > >Branch: master
> > > >Commit: e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66
> > > >URL:    
> > > >http://arago-project.org/git/meta-ti.git?a=commit;h=e1b4ab72cfb3ea4599701d
> > > >1600c44fe3c5f8ba66
> > > >
> > > >Author: Koen Kooi <koen@dominion.thruhere.net>
> > > >Date:   Wed Jul 11 11:53:27 2012 +0200
> > > >
> > > >u-boot 2011.09+git: update to latest version of Tom Rini's tree
> > > 
> > > Aren't all of Tom's patches upstream now?  Why not pull from the latest
> > > u-boot release? Are we carrying any patches that would be accepted
> > > upstream?
> > 
> > Late to the party, I know.  v2012.07 has extremely minimal support for
> > am335x platforms.  With 3 series of patches (which I expect to queue up
> > and push along to u-boot-arm and then u-boot proper) mainline support
> > should be better, at least wrt bone, than the arago tree.  NAND and SPI
> > and MMC1 won't be there, yet.  i2c, ethernet, booting kernels will be
> > there.  And easier than arago eeprom programming will be there too
> > (eeprom command in U-Boot for dumping memory to eeprom).
> 
> Tom,
> 
> Why are you comparing to "arago u-boot"? Isn't that your tree also? :)

I know you know but for the record..

It's a product tree that I am the responsible party for.  I'm also the
custodian of the TI parts in mainline U-Boot.  The goal is to one day be
able to make the tree on arago just be for historical reference and have
everyone using mainline (or mainline with distro / product / etc
specific patches).  We're getting much nearer the point where I think
folks can switch to the mainline tree.  Some peripherals that can be
exposed via capes wouldn't be supported today but the important ones on
a beaglebone would be.

The other side of things is that barring a product related need I don't
add new features (and then backport as much as possible from mainline)
to the arago hosted tree.  So improved / easier eeprom writing isn't
likely to end up there :)

-- 
Tom

